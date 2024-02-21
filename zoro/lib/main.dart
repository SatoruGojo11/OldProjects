import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ZoroApp(),
    ),
  );
}

class ZoroApp extends StatefulWidget {
  const ZoroApp({super.key});

  @override
  State<ZoroApp> createState() => _ZoroAppState();
}

class _ZoroAppState extends State<ZoroApp> {
  late final WebViewController? webViewController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    late final PlatformWebViewControllerCreationParams params;
    try {
      if (WebViewPlatform.instance is WebKitWebViewPlatform) {
        params = WebKitWebViewControllerCreationParams(
          allowsInlineMediaPlayback: true,
          mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
        );
      } else {
        params = const PlatformWebViewControllerCreationParams();
      }

      final WebViewController controller =
          WebViewController.fromPlatformCreationParams(params)
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            ..setBackgroundColor(const Color(0x00000000))
            ..loadRequest(Uri.parse('https://sanji.to/home'));

      webViewController = controller;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: WillPopScope(
          onWillPop: PopCallback,
          child:
              SafeArea(child: WebViewWidget(controller: webViewController!))),
    );
  }

  Future<bool> PopCallback() async {
    final shouldPop = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text(
            'Do you want to go back?',
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text(
                'Yes',
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ZoroApp()),
                );
              },
              child: const Text(
                'No',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
    return shouldPop!;
  }
}
