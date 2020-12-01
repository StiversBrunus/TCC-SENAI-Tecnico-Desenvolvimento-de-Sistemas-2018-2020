import 'package:fypp/app/model/photographer.dart';
import 'package:mobx/mobx.dart';
import 'package:fypp/app/controllers/photographer_controller.dart';
part 'phot.store.g.dart';

class PhotStore = _PhotStoreBase with _$PhotStore;

abstract class _PhotStoreBase with Store {

  PhotographerController photController = PhotographerController();

  @observable
  bool loadingData = false; 
  
  @observable
  List<Photographer> phots = [];

  @action
  Future<List<Photographer>> getPhotographers() async {
    loadingData = true;
    // phots = await photController.getPhotographers();
    loadingData = false; 
    return phots;
  } 


}