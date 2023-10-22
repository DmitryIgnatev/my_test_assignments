// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottom_sheet_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BottomSheetState on BottomSheetStateBase, Store {
  late final _$isSoundOnAtom =
      Atom(name: 'BottomSheetStateBase.isSoundOn', context: context);

  @override
  bool get isSoundOn {
    _$isSoundOnAtom.reportRead();
    return super.isSoundOn;
  }

  @override
  set isSoundOn(bool value) {
    _$isSoundOnAtom.reportWrite(value, super.isSoundOn, () {
      super.isSoundOn = value;
    });
  }

  late final _$isMasterModeAtom =
      Atom(name: 'BottomSheetStateBase.isMasterMode', context: context);

  @override
  bool get isMasterMode {
    _$isMasterModeAtom.reportRead();
    return super.isMasterMode;
  }

  @override
  set isMasterMode(bool value) {
    _$isMasterModeAtom.reportWrite(value, super.isMasterMode, () {
      super.isMasterMode = value;
    });
  }

  late final _$priceListAtom =
      Atom(name: 'BottomSheetStateBase.priceList', context: context);

  @override
  ObservableList<PriceList> get priceList {
    _$priceListAtom.reportRead();
    return super.priceList;
  }

  @override
  set priceList(ObservableList<PriceList> value) {
    _$priceListAtom.reportWrite(value, super.priceList, () {
      super.priceList = value;
    });
  }

  late final _$BottomSheetStateBaseActionController =
      ActionController(name: 'BottomSheetStateBase', context: context);

  @override
  void changeSoundStatus() {
    final _$actionInfo = _$BottomSheetStateBaseActionController.startAction(
        name: 'BottomSheetStateBase.changeSoundStatus');
    try {
      return super.changeSoundStatus();
    } finally {
      _$BottomSheetStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeMasterModeStatus() {
    final _$actionInfo = _$BottomSheetStateBaseActionController.startAction(
        name: 'BottomSheetStateBase.changeMasterModeStatus');
    try {
      return super.changeMasterModeStatus();
    } finally {
      _$BottomSheetStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addNewPrice() {
    final _$actionInfo = _$BottomSheetStateBaseActionController.startAction(
        name: 'BottomSheetStateBase.addNewPrice');
    try {
      return super.addNewPrice();
    } finally {
      _$BottomSheetStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deletePriceList(int index) {
    final _$actionInfo = _$BottomSheetStateBaseActionController.startAction(
        name: 'BottomSheetStateBase.deletePriceList');
    try {
      return super.deletePriceList(index);
    } finally {
      _$BottomSheetStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void cleanState() {
    final _$actionInfo = _$BottomSheetStateBaseActionController.startAction(
        name: 'BottomSheetStateBase.cleanState');
    try {
      return super.cleanState();
    } finally {
      _$BottomSheetStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSoundOn: ${isSoundOn},
isMasterMode: ${isMasterMode},
priceList: ${priceList}
    ''';
  }
}
