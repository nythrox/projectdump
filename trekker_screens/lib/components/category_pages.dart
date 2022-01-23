import 'package:trekkers/shared/components/menu.dart';
import 'package:flutter/material.dart';
import 'package:trekkers/components/custom_tab_view.dart';
import 'package:trekkers/datas/category.dart';
import 'package:trekkers/services/api.dart';
import 'package:trekkers/widgets/custo_progress_indicator.dart';
import 'package:trekkers/widgets/nenhum_registro.dart';

class CategoryPagesSettings {
  final String jsonTag;
  final String msgError;
  final String msgSemRegistro;

 const CategoryPagesSettings(this.jsonTag,
      {this.msgError = "Erro ao carregar categorias",
      this.msgSemRegistro = "Nenhum registro até o momento!"});
}

typedef IndexedWidgetBuilderData = Widget Function(
    BuildContext context, int index, dynamic data);

class CategoryPages<T> extends StatefulWidget {
  final String title;

  final Future<T> futureCategory;
  final AsyncWidgetBuilder builderCategory;
  final CategoryPagesSettings settingsCat;

  final apiUrlId futureCategoryItem;
  final AsyncWidgetBuilder builderCategoryItem;
  final CategoryPagesSettings settingsItem;
  final IndexedWidgetBuilderData defaultItemBuilder;

  const CategoryPages(
      {Key key,
      this.title,
      this.futureCategory,
      this.builderCategory,
      this.settingsCat,
      this.futureCategoryItem,
      this.builderCategoryItem,
      this.settingsItem,
      this.defaultItemBuilder})
      : super(key: key);

  @override
  _CategoryPagesState createState() => _CategoryPagesState();
}

class _CategoryPagesState extends State<CategoryPages> {
  List<String> data = ['Todos'];
  int initPosition = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(),
      appBar: AppBar(
        elevation: 0,
        title: Text(widget.title ?? "Título"),
        centerTitle: true,
      ),
      body: _buidBoby(context),
    );
  }

  Widget _buidBoby(BuildContext context) {
    if (widget.futureCategory == null) {
      return Center(
        child: Text("Configure a Categoria."),
      );
    }

    return FutureBuilder(
      future: widget.futureCategory,
      builder: widget.builderCategory ??
          (context, snapshot) => _defaultBuilderCategory(context, snapshot),
    );
  }

  _defaultBuilderCategory(context, snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
      case ConnectionState.waiting:
        return CustomProgressIndicator();
      default:
        if (snapshot.hasError) {
          return Container(
            child: Column(
              children: <Widget>[
                Text(widget.settingsCat.msgError),
                Text(snapshot.error.toString())
              ],
            ),
          );
        } else {
          if (_verificaDados(snapshot, widget.settingsCat.jsonTag)) {
            List listJson = snapshot.data[widget.settingsCat.jsonTag];

            List<CategoryData> data = List();
            data.add(CategoryData(id: 0, title: "Todos"));
            listJson.forEach((j) {
              data.add(CategoryData.fromJsonMap(j));
            });

            return _createTabBarCategory(context, data);
          } else {
            return EmptyItems(
              text: widget.settingsCat.msgSemRegistro,
            );
          }
        }
    }
  }

  _defaultBuilderCategoryItem(context, snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
      case ConnectionState.waiting:
        return CustomProgressIndicator();
      default:
        if (snapshot.hasError) {
          return Container(
            child: Column(
              children: <Widget>[
                Text(widget.settingsItem.msgError),
                Text(snapshot.error.toString())
              ],
            ),
          );
        } else {
          if (_verificaDados(snapshot, widget.settingsItem.jsonTag)) {
            List data = snapshot.data[widget.settingsItem.jsonTag];

            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  if (widget.defaultItemBuilder != null)
                    return widget.defaultItemBuilder(context, index, data);
                  return Text(index.toString());
                });
          } else {
            return EmptyItems(
              text: widget.settingsItem.msgSemRegistro,
            );
          }
        }
    }
  }

  bool _verificaDados(snapshot, tag) {
    return (snapshot.hasData &&
        snapshot.data.containsKey(tag) &&
        (snapshot.data[tag] as List).length > 0);
  }

  Widget _createTabBarCategory(BuildContext context, List<CategoryData> data) {
    return CustomTabView(
      initPosition: initPosition,
      itemCount: data.length,
      tabBuilder: (context, index) => Tab(text: data[index].title),
      pageBuilder: (context, index) => _pageBuilder(context, data[index]),
      onPositionChange: (index) {
        print('posição: $index');
        initPosition = index;
      },
    );
  }

  Widget _pageBuilder(BuildContext context, CategoryData category) {
    if (widget.futureCategoryItem == null) {
      return Center(
        child: Text("Configure o Item da Categoria."),
      );
    }

    return Column(
      children: <Widget>[
        Expanded(
          child: FutureBuilder<Map<dynamic, dynamic>>(
            future: widget.futureCategoryItem(category.id),
            builder: widget.builderCategoryItem ??
                (context, snapshot) =>
                    _defaultBuilderCategoryItem(context, snapshot),
          ),
        )
      ],
    );
  }
}
