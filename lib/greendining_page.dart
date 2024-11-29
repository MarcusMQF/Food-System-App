import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class GreenDiningPage extends StatefulWidget {
  final String title;

  GreenDiningPage({required this.title});

  @override
  // ignore: library_private_types_in_public_api
  _GreenDiningPageState createState() => _GreenDiningPageState();
}

class _GreenDiningPageState extends State<GreenDiningPage> {
  InAppWebViewController? controller;
  String url = "https://forms.gle/VWXTVFD9ggJiQfUw7";
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              child: progress < 1.0
                  ? LinearProgressIndicator(value: progress)
                  : Container(),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent),
                ),
                child: InAppWebView(
                  initialUrlRequest: URLRequest(url: WebUri(url)),
                  // ignore: deprecated_member_use
                  initialOptions: InAppWebViewGroupOptions(
                    // ignore: deprecated_member_use
                    crossPlatform: InAppWebViewOptions(
                      useOnDownloadStart: true,
                      javaScriptEnabled: true,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}