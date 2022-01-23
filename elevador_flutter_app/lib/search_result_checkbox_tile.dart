
import 'package:elevador_flutter_app/search_bar.dart';
import 'package:flutter/material.dart';

class SearchResultCheckboxTile<T extends HasDescription>
    extends StatelessWidget {
  final T result;
  final Widget icon;
  final bool isSelected;
  final Function(T selected) onSelected;
  const SearchResultCheckboxTile(
      {Key key,
      @required this.result,
      this.onSelected,
      this.icon,
      @required this.isSelected})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CheckboxListTile(
          value: isSelected,
          title: Row(
            children: <Widget>[
              icon ?? Icon(Icons.event),
              SizedBox(width: 10),
              Text(
                result.description,
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
          onChanged: (e) => {if (onSelected != null) onSelected(result)},
        ),
        Divider(
          height: 0,
        )
      ],
    );
  }
}