import 'package:trekkers/delivery/components/delivery_form.dart';
import 'package:flutter/material.dart';

class DeliveryPage extends StatelessWidget {
  const DeliveryPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "OPÇÕES DE ENTREGA",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
        ),

        centerTitle: true,
      ),
      body: Container(color: Colors.white, child: DeliveryForm()),
    );
  }
}
