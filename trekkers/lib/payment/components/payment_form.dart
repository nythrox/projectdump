import 'package:trekkers/payment/blocs/payment_form_bloc.dart';
import 'package:trekkers/payment/repositories/payment_repository.dart';
import 'package:trekkers/shared/components/success_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trekkers/shared/utils/custom_dio.dart';

class PaymentForm extends StatefulWidget {
  const PaymentForm({Key key}) : super(key: key);
  @override
  _PaymentFormState createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  final _formKey = GlobalKey<FormState>();

  final PaymentFormBloc _paymentFormBloc =
      PaymentFormBloc(PaymentRepository(CustomDio()));

  @override
  void initState() {
    super.initState();
    _paymentFormBloc.result.listen((e) => {
          Navigator.pushAndRemoveUntil(
              context,
              CupertinoPageRoute(
                builder: (context) => SuccessPage(
                  text: "Pedido realizado com sucesso!",
                  function: () {},
                ),
              ),
              ModalRoute.withName('/store'))
        });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Card(
                margin: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width - 50.0,
                      padding: const EdgeInsets.all(10.0),
                      child: ListTile(
                        title: const Text("Cupom de Desconto"),
                        leading: const Icon(
                          Icons.card_giftcard,
                          color: Colors.amber,
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.add),
                          color: Colors.amber,
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      width: MediaQuery.of(context).size.width - 40.0,
                      child: TextFormField(
                        onSaved: _paymentFormBloc.addCupom,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(15),
                          labelText: "Digite seu cupom",
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
              ),
            ),
            Row(
              children: <Widget>[
                Radio(
                  groupValue: "a",
                  value: null,
                  onChanged: (e) {},
                ),
                const Text("Cartão de crédito"),
              ],
            ),
            Row(
              children: <Widget>[
                Radio(
                  groupValue: "a",
                  value: null,
                  onChanged: (e) {},
                ),
                const Text("Utilizar saldo de R\$ 150,00"),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "Cartão de crédito",
                    style: TextStyle(fontSize: 18),
                  ),
                  const Spacer(),
                  Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Visa_Electron.svg/1200px-Visa_Electron.svg.png",
                    height: 20.0,
                  ),
                  const SizedBox(width: 5),
                  Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Mastercard_2019_logo.svg/1200px-Mastercard_2019_logo.svg.png",
                    height: 20.0,
                  ),
                  const SizedBox(width: 5),
                  Image.network(
                    "https://yt3.ggpht.com/a/AGF-l7_RngURq4w78zRyCYXD7LFqDVZDeD9tFXp1ng=s900-c-k-c0xffffffff-no-rj-mo",
                    height: 20.0,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    onSaved: _paymentFormBloc.addNumeroCartao,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(15),
                      labelText: "Número do cartão",
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1.0),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    onSaved: _paymentFormBloc.addCodigoSeguranca,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(15),
                      suffix: Image.network(
                        "https://cdn1.iconfinder.com/data/icons/glyph-card-payment/32/credit_card_CVV_CVC_code_number-512.png",
                        width: 50.0,
                        height: 13.0,
                      ),
                      labelText: "Código de segurança",
                      suffixIcon: const Icon(Icons.credit_card),
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1.0),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    onSaved: _paymentFormBloc.addNumeroParcelas,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(15),
                      labelText: "Número de parcelas",
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1.0),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 45.0, right: 35.0, top: 40.0, bottom: 20.0),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("Subtotal",
                    style: const TextStyle(
                        fontSize: 15.0,
                        decoration: TextDecoration.none,
                        color: Colors.black45)),
                const Spacer(),
                Text("\$100,00",
                    style: const TextStyle(
                        fontSize: 15.0,
                        decoration: TextDecoration.none,
                        color: Colors.black45)),
              ]),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 45.0, right: 35.0, top: 7.0, bottom: 20.0),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("Frete",
                    style: const TextStyle(
                        fontSize: 15.0,
                        decoration: TextDecoration.none,
                        color: Colors.black38)),
                const Spacer(),
                Text("\$50,00",
                    style: const TextStyle(
                        fontSize: 15.0,
                        decoration: TextDecoration.none,
                        color: Colors.black38)),
              ]),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 45.0, right: 35.0, top: 7.0, bottom: 40.0),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("Total",
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 17.0,
                        decoration: TextDecoration.none,
                        color: Colors.black)),
                const Spacer(),
                Text("\$100,00",
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 17.0,
                        decoration: TextDecoration.none,
                        color: Colors.black)),
              ]),
            ),
            StreamBuilder(
              stream: _paymentFormBloc.loading,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data == true)
                  return CircularProgressIndicator();
                return Container();
              },
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  padding: const EdgeInsets.all(12),
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  onPressed: () {
                    print(_formKey.currentState);
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save(); // Save our form now.
                    }
                  },
                  child: const Text(
                    "FINALIZAR",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
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
