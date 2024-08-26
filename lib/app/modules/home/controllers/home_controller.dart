import 'package:baraka_trans/app/modules/main/views/main_view.dart';
import 'package:baraka_trans/app/modules/myprofile/views/myprofile_view.dart';
import 'package:baraka_trans/app/modules/myreservations/views/myreservations_view.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxList _pages = [
    MainView(),
    const MyreservationsView(),
    const MyprofileView(),
  ].obs;

  RxInt currentPage = 0.obs;
  List get Pages => _pages;

  void changeIndex(int value) {
    currentPage.value = value;
  }
}
