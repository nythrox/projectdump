
import 'package:elevador_flutter_app/search_bar.dart';
import 'package:flutter/material.dart';

class SearchResultTile<T extends HasDescription> extends StatelessWidget {
  final T result;
  final Widget icon;
  final Function(T selected) onSelected;
  const SearchResultTile(
      {Key key, @required this.result, this.onSelected, this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: icon ?? Icon(Icons.event),
          title: Text(
            result.description,
            style: TextStyle(color: Colors.grey[600]),
          ),
          onTap: () => {if (onSelected != null) onSelected(result)},
        ),
        Divider(
          height: 0,
        )
      ],
    );
  }
}
