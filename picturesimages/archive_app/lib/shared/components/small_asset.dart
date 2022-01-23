import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmallAssetCard extends StatelessWidget {
  final Widget title;
  final Widget background;
  final Widget settingsButton;
  final Function() onTap;

  const SmallAssetCard(
      {Key key,
      @required this.title,
      @required this.background,
      @required this.onTap,
      @required this.settingsButton})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Material(
          color: Color(0xff1E1E1E),
          child: Column(children: [
            Expanded(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Material(
                    type: MaterialType.card,
                    child: InkWell(
                        onTap: onTap,
                        child: ConstrainedBox(
                            constraints: BoxConstraints(
                                minHeight: 50, minWidth: double.infinity),
                            child: background)),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[title, settingsButton],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
