import 'package:baraka_trans/app/routes/app_pages.dart';
import 'package:baraka_trans/consts/consts.dart';
import 'package:baraka_trans/consts/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../controllers/chat_support_controller.dart';

class ChatSupportView extends GetView<ChatSupportController> {
  const ChatSupportView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith(
                'https://tawk.to/chat/66b924ae146b7af4a4391d1c/1i51jej2r/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(
          Uri.parse('https://tawk.to/chat/66b924ae146b7af4a4391d1c/1i51jej2r'));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColors.mainColor,
        title: const Text(
          "دعم التطبيق",
          style: TextStyle(
            color: Colors.white,
            fontFamily: Appfonts.mainFont,
          ),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () => Get.offAllNamed(Routes.HOME),
          child: const Icon(
            color: Colors.white,
            Icons.cancel,
            size: 25,
          ),
        ),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
