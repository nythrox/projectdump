import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  final String text;
  final void Function() function;
  const SuccessPage({Key key, this.text, this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.check_circle_outline,
              color: Theme.of(context).primaryColor,
              size: 220.0,
            ),
            const Text(
              "Sucesso!",
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              text,
              style: const TextStyle(
                  fontSize: 14.0,
                  decoration: TextDecoration.none,
                  color: Colors.black),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: RaisedButton(
                padding: const EdgeInsets.all(15),
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                onPressed: function,
                child: const Text(
                  "VOLTAR",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
