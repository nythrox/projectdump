// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_cart.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ShoppingCart on _ShoppingCart, Store {
  Computed<double> _$totalComputed;

  @override
  double get total =>
      (_$totalComputed ??= Computed<double>(() => super.total)).value;
  Computed<int> _$amountOfItemsComputed;

  @override
  int get amountOfItems =>
      (_$amountOfItemsComputed ??= Computed<int>(() => super.amountOfItems))
          .value;

  final _$itemsAtom = Atom(name: '_ShoppingCart.items');

  @override
  ObservableList<CartItem> get items {
    _$itemsAtom.context.enforceReadPolicy(_$itemsAtom);
    _$itemsAtom.reportObserved();
    return super.items;
  }

  @override
  set items(ObservableList<CartItem> value) {
    _$itemsAtom.context.conditionallyRunInAction(() {
      super.items = value;
      _$itemsAtom.reportChanged();
    }, _$itemsAtom, name: '${_$itemsAtom.name}_set');
  }

  final _$_ShoppingCartActionController =
      ActionController(name: '_ShoppingCart');

  @override
  void add(CartItem product) {
    final _$actionInfo = _$_ShoppingCartActionController.startAction();
    try {
      return super.add(product);
    } finally {
      _$_ShoppingCartActionController.endAction(_$actionInfo);
    }
  }

  @override
  void remove(CartItem item) {
    final _$actionInfo = _$_ShoppingCartActionController.startAction();
    try {
      return super.remove(item);
    } finally {
      _$_ShoppingCartActionController.endAction(_$actionInfo);
    }
  }
}
