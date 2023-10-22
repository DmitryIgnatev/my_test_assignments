import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:pyrobyte_test/domain/models/price_list.dart';

part 'bottom_sheet_state.g.dart'; //This will automatically generated after: flutter pub run build_runner build

@singleton
class BottomSheetState = BottomSheetStateBase with _$BottomSheetState;

abstract class BottomSheetStateBase with Store {
  @observable
  bool isSoundOn = false;

  @observable
  bool isMasterMode = false;

  @observable
  ObservableList<PriceList> priceList = ObservableList();

  @action
  void changeSoundStatus() {
    isSoundOn = !isSoundOn;
  }

  @action
  void changeMasterModeStatus() {
    isSoundOn = !isMasterMode;
  }

  @action
  void addNewPrice() {
    priceList.add(PriceList(id: 0, price: 0));
  }

  @action
  void deletePriceList(int index) {
    priceList.remove(priceList[index]);
  }

  @action
  void cleanState() {
    isSoundOn = false;
    isMasterMode = false;
    priceList.clear();
  }
}
