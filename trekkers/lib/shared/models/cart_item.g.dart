// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartItem on _CartItem, Store {
  Computed<double> _$totalComputed;

  @override
  double get total =>
      (_$totalComputed ??= Computed<double>(() => super.total)).value;

  final _$amountAtom = Atom(name: '_CartItem.amount');

  @override
  int get amount {
    _$amountAtom.context.enforceReadPolicy(_$amountAtom);
    _$amountAtom.reportObserved();
    return super.amount;
  }

  @override
  set amount(int value) {
    _$amountAtom.context.conditionallyRunInAction(() {
      super.amount = value;
      _$amountAtom.reportChanged();
    }, _$amountAtom, name: '${_$amountAtom.name}_set');
  }

  final _$_CartItemActionController = ActionController(name: '_CartItem');

  @override
  void increment() {
    final _$actionInfo = _$_CartItemActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$_CartItemActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrement() {
    final _$actionInfo = _$_CartItemActionController.startAction();
    try {
      return super.decrement();
    } finally {
      _$_CartItemActionController.endAction(_$actionInfo);
    }
  }
}
