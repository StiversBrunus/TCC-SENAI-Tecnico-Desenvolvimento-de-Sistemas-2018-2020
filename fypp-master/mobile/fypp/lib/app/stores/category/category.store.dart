import 'package:fypp/app/controllers/category_controller.dart';
import 'package:fypp/app/model/category.dart';
import 'package:fypp/app/model/photographer.dart';
import 'package:mobx/mobx.dart';
part 'category.store.g.dart';

class CategoryStore = _CategoryStoreBase with _$CategoryStore;

abstract class _CategoryStoreBase with Store {

  CategoryController categoryController = CategoryController();

  @observable
  bool loadingData = false; 
  
  @observable
  List<Category> categories = [];

  @action 
  Future<List<Category>> getCategories() async {
    loadingData = true;
    categories = await categoryController.getCategories();
    loadingData = false;
    return categories; 
  } 

}