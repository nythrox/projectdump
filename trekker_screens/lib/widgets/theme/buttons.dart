import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String texto;
  final Color corbt;
  final Color corfont;
  final double borda;
  final Color bordacolor;
  final Widget page;
  final VoidCallback onPressed;

  const CustomButton(
      {Key key,
      this.texto,
      this.corbt,
      this.corfont,
      this.bordacolor,
      this.page,
      this.onPressed, this.borda})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      alignment: Alignment.center, 
      decoration: BoxDecoration(
        color: corbt ?? Color.fromRGBO(0, 0, 0, 1),
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
        border: Border.all(
            width: borda ?? 0, color: bordacolor ?? Color.fromRGBO(0, 0, 0, 1)),
      ),
      child: SizedBox.expand(
        child: FlatButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                texto,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: corfont ?? Colors.black,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          onPressed: () {
            if (page != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => page,
                ),
              );
            }else{
              onPressed();
            }
          },
        ),
      ),
    );
  }
}
