import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: CaptchaPage(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class CaptchaPage extends StatefulWidget {
  @override
  _CaptchaPageState createState() => _CaptchaPageState();
}

class _CaptchaPageState extends State<CaptchaPage> {
  @override
  Widget build(BuildContext context) {
    // final config = context.watch<EnvironmentConfig>();
    return RecaptchaV2(
      apiKey: "6LezL5kUAAAAAOZlII-jTEI9xfvTSfoc1DCLp6mY",
    );
  }
}

String getRecaptchaHtml(String key) {
  return '''
<!DOCTYPE html><html>
<head><title>Navigation Delegate Example</title></head>
<body>
<div id="recaptcha"></div>

<script type="text/javascript">
  function onloadCallback() {
    alert("loaded")
    grecaptcha.render('recaptcha', {
          'sitekey': '$key',
          'calblack': verifyCallback,
    });
  };
  function verifyCallback(response) {
    RecaptchaFlutterChannel.postMessage(response);  
  }
</script>

<script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit"
    async defer>
</script>

</body>
</html>
''';
}

class RecaptchaV2 extends StatefulWidget {
  const RecaptchaV2({
    Key key,
    this.onSuccess,
    this.onError,
    @required this.apiKey,
    this.apiSecret,
  }) : super(key: key);

  @override
  _RecaptchaV2State createState() => _RecaptchaV2State();
  final String apiKey;
  final String apiSecret;
  final ValueChanged<bool> onSuccess;
  final ValueChanged<String> onError;
}

class _RecaptchaV2State extends State<RecaptchaV2> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  String url;
  @override
  void initState() {
    super.initState();
    url = Uri.dataFromString(getRecaptchaHtml(widget.apiKey),
            mimeType: 'text/html')
        .toString();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: url,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _controller.complete(webViewController);
      },
      javascriptChannels: {
        JavascriptChannel(
          name: 'RecaptchaFlutterChannel',
          onMessageReceived: (JavascriptMessage receiver) {
            print(receiver.message);
            // String _token = receiver.message;
            // if (_token.contains("verify")) {
            //   _token = _token.substring(7);
            // }

            // verifyToken(_token);
          },
        ),
      },
      onPageStarted: (String url) {
        print('Page started loading: $url');
      },
      onPageFinished: (String url) {
        print('Page finished loading: $url');
      },
      gestureNavigationEnabled: true,
    );
  }

  void verifyToken(String token) async {
    // String url = "https://www.google.com/recaptcha/api/siteverify";
    // final response = await Dio().post(url, data: {
    //   "secret": widget.apiSecret,
    //   "response": token,
    // });
  }
}
