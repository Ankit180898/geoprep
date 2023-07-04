import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:in_app_purchases_paywall_ui/in_app_purchases_paywall_ui.dart';
import 'package:in_app_purchases_paywall_ui/paywall/model/icon_and_text.dart';
import 'package:in_app_purchases_paywall_ui/paywall/moritz/moritz_paywall.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../bottom_nav_widget.dart';
class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {

  final _razorpay = Razorpay();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
      _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    });
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    print(response);
    verifySignature(
      signature: response.signature,
      paymentId: response.paymentId,
      orderId: response.orderId,
    );
    Get.snackbar("Success", "You have completed the order");
    Get.offAll(BottomNav());
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print(response);
    // Do something when payment fails
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(response.message ?? ''),
      ),
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print(response);
    // Do something when an external wallet is selected
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(response.walletName ?? ''),
      ),
    );
  }

// create order
  void createOrder() async {
    String username = "rzp_test_550pkbVN3eKBfE";
    String password = "s4TcjvtLatkQLWKQ57s5PPIK";
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';

    Map<String, dynamic> body = {
      "amount": 100,
      "currency": "INR",
      "receipt": "rcptid_11"
    };
    var res = await http.post(
      Uri.https(
          "api.razorpay.com", "v1/orders"), //https://api.razorpay.com/v1/orders
      headers: <String, String>{
        "Content-Type": "application/json",
        'authorization': basicAuth,
      },
      body: jsonEncode(body),
    );

    if (res.statusCode == 200) {
      openGateway(jsonDecode(res.body)['id']);
    }
    print(res.body);
  }

  openGateway(String orderId) {
    var options = {
      'key': "rzp_test_550pkbVN3eKBfE",
      'amount': 100, //in the smallest currency sub-unit.
      'name': 'Acme Corp.',
      'order_id': orderId, // Generate order_id using Orders API
      'description': 'Fine T-Shirt',
      'timeout': 60 * 5, // in seconds // 5 minutes
      'prefill': {
        'contact': '9123456789',
        'email': 'ary@example.com',
      }
    };
    _razorpay.open(options);
  }

  verifySignature({
    String? signature,
    String? paymentId,
    String? orderId,
  }) async {
    Map<String, dynamic> body = {
      'razorpay_signature': signature,
      'razorpay_payment_id': paymentId,
      'razorpay_order_id': orderId,
    };

    var parts = [];
    body.forEach((key, value) {
      parts.add('${Uri.encodeQueryComponent(key)}='
          '${Uri.encodeQueryComponent(value)}');
    });
    var formData = parts.join('&');
    var res = await http.post(
      Uri.https(
        "10.0.2.2", // my ip address , localhost
        "razorpay_signature_verify.php",
      ),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded", // urlencoded
      },
      body: formData,
    );

    print(res.body);
    if (res.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(res.body),
        ),
      );
    }
  }

  @override
  void dispose() {
    _razorpay.clear(); // Removes all listeners

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    PurchaseHandler purchaseHandler = PurchaseHandler();


    final List<String> imageList = [
      "https://www.actuaries.org.sg/sites/default/files/inline-images/Membership%20Renewal%202022%20Banner%20%283%29_3.png",
      "https://www.actuaries.org.sg/sites/default/files/inline-images/221219%20Membership%20Renewal%20-%20Top%20Banner.png",
      "https://www.actuaries.org.sg/sites/default/files/inline-images/Membership%20Renewal%202022%20Banner%20%283%29_3.png",
      "https://www.actuaries.org.sg/sites/default/files/inline-images/221219%20Membership%20Renewal%20-%20Top%20Banner.png",
    ];
    var size=MediaQuery.of(context).size;


    return
      PaywallScaffold(

          // appBarTitle for scaffold
          appBarTitle: "YourApp Premium",
          child: MoritzPaywall(

            // Title Bar
            title: "Go Premium",
            // SubTitle
            subTitle:
            "Enjoy all the advantages of YourApp with the Premium subscription.",
            continueText: "Continue",
            // Add as many bullet points as you like
            bulletPoints: [
              IconAndText(Icons.call, "Get free consulting support"),
              IconAndText(Icons.sort, "Access to All Premium Articles"),
              IconAndText(Icons.picture_as_pdf_outlined, "Get pdf materials"),
              IconAndText(Icons.question_mark, "Get 100+ mock tests")
            ],
            // Your subscriptions that you want to offer to the user
            subscriptionListData: [
              SubscriptionData(
                  durationTitle: "",
                  durationShort: "\n12 month",
                  price: "₹1499",
                  highlightText: "Most popular",
                  dealPercentage: 59,
                  productDetails: "Dynamic purchase data",
                  currencySymbol: "€",
                  duration: "P1Y",
                  index: 3),
              SubscriptionData(
                  durationTitle: "",
                  durationShort: "\n6 month",
                  price: "₹899",
                  dealPercentage: 42,
                  productDetails: "Dynamic purchase data",
                  currencySymbol: "€",
                  duration: "P3M",
                  index: 2),
              SubscriptionData(
                  durationTitle: "translations.monthly.toTitleCase()",
                  durationShort: "\n2 month",
                  price: "₹299",
                  dealPercentage: 0,
                  productDetails: "Dynamic purchase data",
                  currencySymbol: "€",
                  monthText: "",
                  duration: "P1M",
                  index: 1)
            ],
            // Shown if isPurchaseSuccess == true
            successTitle: "To continue, click on Pay now",
            // Shown if isPurchaseSuccess == true
            successSubTitle: "Thanks for choosing Premium!",
            // Widget can be anything. Shown if isPurchaseSuccess == true
            successWidget: Container(
                padding: EdgeInsets.only(top: 16, bottom: 16),
                child:
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ElevatedButton(
                    child: Text("Pay now"),
                    onPressed: () {
                      createOrder();
                    },
                  )
                ])),
            // set true if subscriptions are loading
            isSubscriptionLoading: false,
            // if purchase is in progress, set to true. this will show a fullscreen progress indicator
            isPurchaseInProgress: false,
            // to show the success widget
            purchaseState: PurchaseState.NOT_PURCHASED,
            // callback Interface for restore and purchase tap events. Extend DefaultPurchaseHandler
            callbackInterface: purchaseHandler,
            purchaseStateStreamInterface: purchaseHandler,
            // provide your TOS
            tosData:
            TextAndUrl("Terms of Service", "https://www.linkfive.io/tos"),
            // provide your PP
            ppData:
            TextAndUrl("Privacy Policy", "https://www.linkfive.io/privacy"),
            // add a custom campaign widget
            /*campaignWidget: CampaignBanner(
              theme: Theme.of(context),
              headline: "🥳 Summer Special Sale",
              subContent: Container(
                  padding: EdgeInsets.all(8),
                  child: CountdownTimer(
                    endTime: DateTime.now()
                        .add(Duration(days: 2, hours: 7))
                        .millisecondsSinceEpoch,
                  )),
            )*/));
  }
}
class PurchaseHandler extends DefaultPurchaseHandler {

  @override
  Future<bool> purchase(SubscriptionData productDetails) async {
    print("purchase start");
    isPendingPurchase = true;
    await Future.delayed(Duration(seconds: 1));
    print("purchase done");
    purchaseState = PurchaseState.PURCHASED;
    isPendingPurchase = false;
    return true;
  }

  @override
  Future<bool> restore() async {
    isPendingPurchase = true;
    await Future.delayed(Duration(seconds: 1));
    purchaseState = PurchaseState.PURCHASED;
    isPendingPurchase = false;
    return true;
  }
}
