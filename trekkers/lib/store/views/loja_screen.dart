import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trekkers/cart/views/cart_page.dart';
import 'package:trekkers/events/views/events_screen.dart';
import 'package:trekkers/main.dart';
import 'package:trekkers/shared/components/category_page.dart';
import 'package:trekkers/shared/models/cart_item.dart';
import 'package:trekkers/shared/models/category.dart';
import 'package:trekkers/shared/utils/constants.dart';
import 'package:trekkers/shared/utils/custom_dio.dart';
import 'package:trekkers/store/blocs/istore_bloc.dart';
import 'package:trekkers/store/blocs/store_bloc.dart';
import 'package:trekkers/store/components/product_tile.dart';
import 'package:trekkers/store/model/product.dart';
import 'package:trekkers/store/repositories/product_repository.dart';
import 'package:trekkers/store/repositories/store_category_repository.dart';
import 'package:trekkers/store/views/product_screen.dart';
import 'package:trekkers/widgets/nenhum_registro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StorePage extends StatefulWidget {
  const StorePage({Key key}) : super(key: key);
  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  IStoreBloc _storeBloc;

  @override
  void initState() {
    _storeBloc = StoreBloc(
      ProductCategoryRepository(
        CustomDio(),
      ),
      ProductRepository(
        CustomDio(),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final shoppingCart = AuthenticationProvider.of(context).shoppingCart;

    return FutureBuilder<List<Category>>(
      future: _storeBloc.categories,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "PRODUTOS",
                style: TextStyle(fontSize: 17),
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                )
              ],
              centerTitle: true,
            ),
            body: const Center(
              child: Text("Ocorreu um erro"),
            ),
          );
        }
        if (!snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "PRODUTOS",
                style: TextStyle(fontSize: 17),
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                )
              ],
              centerTitle: true,
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return DefaultTabController(
          length: snapshot.data.length,
          child: Scaffold(
            appBar: AppBar(
              title: const Text(
                "PRODUTOS",
                style: TextStyle(fontSize: 17),
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                )
              ],
              centerTitle: true,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(40),
                child: Container(
                  height: 40,
                  color: opaqueYellow,
                  child: TabBar(
                    isScrollable: snapshot.data.length > 3,
                    tabs: snapshot.data
                        .map((e) => Tab(
                              child: Text(e.title),
                            ))
                        .toList(),
                  ),
                ),
              ),
            ),
            body: TabBarView(
              children: snapshot.data
                  ?.map(
                    (e) => CategoryPage<List<Product>>(
                      future: () async =>
                          _storeBloc.findProductsByCategoryId(e.id),
                      builder: (_, snapshot) {
                        if (snapshot.hasError) {
                          return const Center(
                            child: Text(
                                "Ocorreu um erro ao pesquisar por produtos"),
                          );
                        }
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (snapshot.data.isEmpty) {
                          return const Center(
                            child: EmptyItems(
                              text: "Ainda n??o existem produtos cadastrados",
                            ),
                          );
                        }

                        return ListView.separated(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          itemCount: snapshot.data.length,
                          separatorBuilder: (ctx, i) =>
                              const SizedBox(height: 3),
                          itemBuilder: (ctx, index) {
                            final item = snapshot.data[index];
                            return Observer(builder: (_) {
                              final cartItem = CartItem(item);

                              final bool contains = shoppingCart.items
                                  .any((e) => e.product == item);

                              return ProductTile(
                                mark: item.brand,
                                onIconTap: () {
                                  if (contains) {
                                    shoppingCart.remove(cartItem);
                                  } else {
                                    shoppingCart.add(cartItem);
                                  }
                                },
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) =>
                                              ProductDetailPage(
                                                  cartItem: cartItem)));
                                },
                                price: "${item.price}",
                                title: item.name,
                                imageUrl: "$URL_IMG${item.images.first.link}",
                                inCart: contains,
                              );
                            });
                          },
                        );
                      },
                    ),
                  )
                  ?.toList(),
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.shopping_cart),
              onPressed: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                      settings: const RouteSettings(name: '/cart'),
                      builder: (context) => const CartPage())),
            ),
          ),
        );
      },
    );
  }
}
