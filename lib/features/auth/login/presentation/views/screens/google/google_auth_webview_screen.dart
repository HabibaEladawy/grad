import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GoogleAuthWebViewScreen extends StatefulWidget {
  static const String routeName = 'GoogleAuthWebViewScreen';

  final String url;

  const GoogleAuthWebViewScreen({super.key, required this.url});

  @override
  State<GoogleAuthWebViewScreen> createState() => _GoogleAuthWebViewScreenState();
}

class _GoogleAuthWebViewScreenState extends State<GoogleAuthWebViewScreen> {
  late final WebViewController _controller;

  static final _uuidRe = RegExp(
    r'[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}',
  );

  String? _extractRequestId(String url) {
    final m = _uuidRe.firstMatch(url);
    return m?.group(0);
  }

  @override
  void initState() {
    super.initState();
    _controller =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setNavigationDelegate(
            NavigationDelegate(
              onNavigationRequest: (req) {
                final id = _extractRequestId(req.url);
                if (id != null && id.isNotEmpty) {
                  Navigator.of(context).pop(id);
                  return NavigationDecision.prevent;
                }
                return NavigationDecision.navigate;
              },
            ),
          )
          ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Google Sign In')),
      body: WebViewWidget(controller: _controller),
    );
  }
}

