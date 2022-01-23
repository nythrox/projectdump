import 'package:flutter/material.dart';

class CategoryPage<T> extends StatefulWidget {
  final Future<T> Function() future;
  final AsyncWidgetBuilder<T> builder;

  const CategoryPage({Key key, this.future, this.builder}) : super(key: key);
  @override
  _CategoryPageState<T> createState() => _CategoryPageState<T>();
}

class _CategoryPageState<T> extends State<CategoryPage<T>> {
  Future<T> _future;

  @override
  void initState() {
    _future = widget.future();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<T>(
        future: _future,
        builder: widget.builder,
      ),
    );
  }
}
