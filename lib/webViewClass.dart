import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'notifications.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    super.initState();
  }

  Future isSeenScreen() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    var seenState = await sharedPreferences.getBool("seen") ?? false;

    return !seenState;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (BuildContext context) {
        return SafeArea(
            child: WebView(
          initialUrl: 'https://mobile.private-driver.ma',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) async {
            _controller.complete(webViewController);
            if (await isSeenScreen()) {
              tz.initializeTimeZones();
              NotificationService().showNotification(1, 'Bonjour 🖐 !',
                  'Bienvenue sur El Mouhajir votre chauffeur VTC privé', 1);
            }
          },
          onProgress: (int progress) {
            print("we are in the process phase");
          },
          onPageFinished: (String url) async {
            final SharedPreferences sharedPreferences =
                await SharedPreferences.getInstance();
            sharedPreferences.setBool("seen", true);
            print("the session registred");
          },
          javascriptChannels: <JavascriptChannel>{
            _toasterJavascriptChannel(context),
          },
        ));
      }),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          // ignore: deprecated_member_use
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }
}
