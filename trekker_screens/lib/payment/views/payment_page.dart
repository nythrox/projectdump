import 'package:trekkers/payment/components/payment_form.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "FORMAS DE PAGAMENTO",
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0),
        ),
        centerTitle: true,
      ),
      body: Container(color: Colors.white, child: const PaymentForm()),
    );
  }
}
