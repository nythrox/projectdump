import 'package:elevador_flutter_app/search_bar.dart';
import 'package:flutter/material.dart';

class SearchResultExpandableCheckboxTileContainer<T extends HasDescription>
    extends StatefulWidget {
  final String title;
  final List<Widget> children;
  SearchResultExpandableCheckboxTileContainer({
    Key key,
    this.children,
    this.title,
  }) : super(key: key);

  @override
  _SearchResultExpandableCheckboxTileContainerState<T> createState() =>
      _SearchResultExpandableCheckboxTileContainerState<T>();
}

class _SearchResultExpandableCheckboxTileContainerState<
        T extends HasDescription>
    extends State<SearchResultExpandableCheckboxTileContainer<T>> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        leading: Icon(
          isExpanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
          size: 30,
        ),
        trailing: Text(""),
        title: Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
        ),
        onExpansionChanged: (c) {
          setState(() {
            isExpanded = c;
          });
        },
        children: widget.children);
  }
}

class SearchResultNumberedTile<T extends HasDescription>
    extends StatelessWidget {
  const SearchResultNumberedTile({
    Key key,
    @required this.isSelected,
    @required this.onSelected,
    @required this.result,
    @required this.onUnselected,
    @required this.number,
  }) : super(key: key);
  final double number;
  final T result;
  final bool isSelected;
  final Function(T selected) onSelected;
  final Function(T unselected) onUnselected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0),
      child: Column(
        children: <Widget>[
          CircularCheckboxListTile(
            value: isSelected,
            onChanged: (e) {
              print(e);
              e ? onSelected(result) : onUnselected(result);
            },
            title: Text(
              "$number. ${result.description}",
              style: TextStyle(
                  color: isSelected ? Colors.blue : Colors.grey[600],
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,fontSize: 16),
            ),
          ),
          Divider(
            height: 0,
          )
        ],
      ),
    );
  }
}

class CircularCheckboxListTile extends StatelessWidget {
  final bool value;
  final Text title;
  final Function(bool value) onChanged;

  const CircularCheckboxListTile(
      {Key key,
      @required this.value,
      @required this.title,
      @required this.onChanged})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
          onTap: () => onChanged(!value),
          child: Padding(
            padding: const EdgeInsets.only(right:20.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 15, left: 50),
                    child: title,
                  ),
                  if (value)
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blue, shape: BoxShape.circle),
                      width: 30,
                      height: 30,
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                    )
                ]),
          )),
    );
  }
}
