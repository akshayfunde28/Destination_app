import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:turisamapp/Utils/Colors.dart';

class PaymentPage extends StatefulWidget {
    double money; // the amount to pay

    PaymentPage({
    super.key,
    required this.money,
  });


  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late Razorpay _razorpay;
  final TextEditingController _amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    _razorpay.clear();
    _amountController.dispose();
    super.dispose();
  }

  void openCheckout() {
    if (widget.money==0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a valid amount")),
      );
      return;
    }

    double amount = widget.money * 100; // convert to paise


    var options = {
      'key': 'rzp_test_U6LXs2MWCEfepJ',
      'amount': amount,
      'name': 'My App',
      'description': 'Payment',
      'prefill': {
        'contact': '9876543210',
        'email': 'test@example.com',
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("SUCCESS: ${response.paymentId}")),
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(
          "ERROR: ${response.code} - ${response.message ?? "Payment Failed"}")),
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("EXTERNAL WALLET: ${response.walletName}")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment Page"),
        backgroundColor: appBarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Booking Amount",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: TextEditingController(text: widget.money.toString()),
              readOnly: true, // makes it non-editable
              decoration: InputDecoration(
                labelText: "Amount (INR)",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.currency_rupee),
              ),
            )
,
            const SizedBox(height: 20),

            // Mini payment options
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     IconButton(
            //       onPressed: openCheckout,
            //       icon: const Icon(Icons.credit_card, size: 40, color: Colors.teal),
            //     ),
            //     IconButton(
            //       onPressed: openCheckout,
            //       icon: const Icon(Icons.account_balance_wallet, size: 40, color: Colors.teal),
            //     ),
            //     IconButton(
            //       onPressed: openCheckout,
            //       icon: const Icon(Icons.payment, size: 40, color: Colors.teal),
            //     ),
            //   ],
            // ),
            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: openCheckout,
                style: ElevatedButton.styleFrom(
                  backgroundColor: appBarColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Proceed to Pay",
                  style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
