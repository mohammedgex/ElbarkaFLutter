import 'package:baraka_trans/app/modules/main/views/main_view.dart';
import 'package:baraka_trans/app/modules/my_payments/views/my_payments_view.dart';
import 'package:baraka_trans/app/modules/myprofile/views/myprofile_view.dart';
import 'package:baraka_trans/app/modules/saved_transportations/views/saved_transportations_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final RxList _pages = [
    const MainView(),
    SavedTransportationsView(),
    const MyPaymentsView(),
    const MyprofileView(),
  ].obs;

  final storage = GetStorage();

  RxInt currentPage = 0.obs;
  List get Pages => _pages;

  void changeIndex(int value) {
    currentPage.value = value;
  }
}
