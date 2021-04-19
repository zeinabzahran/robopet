import 'package:get/get.dart';

class IndexController extends GetxController{
  var bottomNavigationBarItemIndex=1.obs;
  void setIndexValue(int number){
    bottomNavigationBarItemIndex.value=number;
  }
}