// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategoryStore on _CategoryStoreBase, Store {
  final _$loadingDataAtom = Atom(name: '_CategoryStoreBase.loadingData');

  @override
  bool get loadingData {
    _$loadingDataAtom.reportRead();
    return super.loadingData;
  }

  @override
  set loadingData(bool value) {
    _$loadingDataAtom.reportWrite(value, super.loadingData, () {
      super.loadingData = value;
    });
  }

  final _$categoriesAtom = Atom(name: '_CategoryStoreBase.categories');

  @override
  List<Category> get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(List<Category> value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  final _$getCategoriesAsyncAction =
      AsyncAction('_CategoryStoreBase.getCategories');

  @override
  Future<List<Category>> getCategories() {
    return _$getCategoriesAsyncAction.run(() => super.getCategories());
  }

  @override
  String toString() {
    return '''
loadingData: ${loadingData},
categories: ${categories}
    ''';
  }
}
