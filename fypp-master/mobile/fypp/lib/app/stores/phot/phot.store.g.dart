// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phot.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PhotStore on _PhotStoreBase, Store {
  final _$loadingDataAtom = Atom(name: '_PhotStoreBase.loadingData');

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

  final _$photsAtom = Atom(name: '_PhotStoreBase.phots');

  @override
  List<Photographer> get phots {
    _$photsAtom.reportRead();
    return super.phots;
  }

  @override
  set phots(List<Photographer> value) {
    _$photsAtom.reportWrite(value, super.phots, () {
      super.phots = value;
    });
  }

  final _$getPhotographersAsyncAction =
      AsyncAction('_PhotStoreBase.getPhotographers');

  @override
  Future<List<Photographer>> getPhotographers() {
    return _$getPhotographersAsyncAction.run(() => super.getPhotographers());
  }

  @override
  String toString() {
    return '''
loadingData: ${loadingData},
phots: ${phots}
    ''';
  }
}
