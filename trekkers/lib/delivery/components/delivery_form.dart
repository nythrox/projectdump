import 'package:trekkers/payment/views/payment_page.dart';
import 'package:trekkers/shared/components/success_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeliveryForm extends StatefulWidget {
  @override
  _DeliveryFormState createState() => _DeliveryFormState();
}

class _DeliveryFormState extends State<DeliveryForm> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 15),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Radio(
                        groupValue: "a",
                        value: null,
                        onChanged: (e) {},
                      ),
                      const Text("Retirada no local"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Radio(
                        groupValue: "a",
                        value: null,
                        onChanged: (e) {},
                      ),
                      const Text("Correios"),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(13),
                      labelText: "Informe o seu CEP",
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1.0),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0, top: 32),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Confirme o seu endereço de entrega",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 17),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(13),
                            labelText: "Endereço",
                            labelStyle: const TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 1.0),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 7.0,
                      ),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(13),
                            labelText: "nº",
                            labelStyle: const TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 1.0),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(13),
                      labelText: "Complemento",
                      labelStyle: const TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1.0),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(13),
                      labelText: "Bairro",
                      labelStyle: const TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1.0),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(13),
                            labelText: "Cidade",
                            labelStyle: const TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 1.0),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 7.0,
                      ),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(13),
                            labelText: "UF",
                            labelStyle: const TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 1.0),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 45.0, right: 35.0, top: 45, bottom: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Subtotal",
                      style: TextStyle(
                          fontSize: 15.0,
                          decoration: TextDecoration.none,
                          color: Colors.black45)),
                  const Spacer(),
                  Text("\$400,00",
                      style: TextStyle(
                          fontSize: 15.0,
                          decoration: TextDecoration.none,
                          color: Colors.black45)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 45.0, right: 35.0, top: 7.0, bottom: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Frete",
                      style: TextStyle(
                          fontSize: 15.0,
                          decoration: TextDecoration.none,
                          color: Colors.black38)),
                  const Spacer(),
                  Text("\$50,00",
                      style: const TextStyle(
                          fontSize: 15.0,
                          decoration: TextDecoration.none,
                          color: Colors.black38)),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 45.0, right: 35.0, top: 7.0, bottom: 40.0),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text("Total",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0,
                        decoration: TextDecoration.none,
                        color: Colors.black)),
                const Spacer(),
                Text("\$450,00",
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0,
                        decoration: TextDecoration.none,
                        color: Colors.black)),
              ]),
            ),
            Container(
              margin:
                  const EdgeInsets.only(right: 20.0, left: 20.0, bottom: 40.0),
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                padding: const EdgeInsets.all(12),
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                onPressed: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => PaymentPage()
                  ),
                ),
                /*
                SuccessPage(
                      text: "Pedido realizado com sucesso!",
                      function: () {
                        
                      },
                    ),
                */
                child: const Text(
                  "CONTINUAR",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
