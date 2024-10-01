import 'package:baraka_trans/app/routes/app_pages.dart';
import 'package:baraka_trans/consts/consts.dart';
import 'package:baraka_trans/consts/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../controllers/paymentmethods_controller.dart';

class PaymobPaymentView extends GetView<PaymentmethodsController> {
  const PaymobPaymentView({super.key});
  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    final webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            // Check if the URL indicates success or failure and navigate accordingly
            if (url.contains("success=true")) {
              args["isTransfer"]
                  ? controller.paymentForTransfers(context)
                  : controller.payWithCard();
              Get.toNamed(Routes.PAYMENT_STATUS, arguments: {
                "paymentStatus": true
              }); // Navigate to success page
            } else if (url.contains('success=false')) {
              Get.toNamed(Routes.PAYMENT_STATUS, arguments: {
                "paymentStatus": false
              }); // Navigate to success page
            }
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith(
                "https://accept.paymob.com/api/acceptance/iframes/861651?payment_token=${controller.paymentKey}")) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(
          "https://accept.paymob.com/api/acceptance/iframes/861651?payment_token=${controller.paymentKey}"));

    return Scaffold(
        appBar: AppBar(
          backgroundColor: appColors.secondColor,
          elevation: 0,
          scrolledUnderElevation: 0,
          title: const Text(
            "الدفع بواسطة كارت",
            style: TextStyle(
              color: Colors.white,
              fontFamily: Appfonts.mainFont,
            ),
          ),
          centerTitle: true,
          leading: InkWell(
            onTap: () => Get.back(),
            child: const Icon(
              color: Colors.white,
              Icons.cancel,
              size: 25,
            ),
          ),
        ),
        body: SafeArea(child: WebViewWidget(controller: webViewController)));
  }
}
