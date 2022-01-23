import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.check_circle_outline,
              color: Theme.of(context).primaryColor,
              size: 220.0,
            ),
            Text(
              "Sucesso!",
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                  color: Colors.black),
            ),
            SizedBox(height: 20.0,),
              Text(
              "Pedido realizado com Sucesso!",
              style: TextStyle(
                  fontSize: 14.0,
                  decoration: TextDecoration.none,
                  color: Colors.black54),
            ),
            Container(
              height: 45.0,
              width: MediaQuery.of(context).size.width / 1.1,
              margin: EdgeInsets.only(top: 40.0),
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                onPressed: () => {},
                child: Text(
                  "VOLTAR",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
