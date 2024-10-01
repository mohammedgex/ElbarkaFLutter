import 'package:baraka_trans/app/data/user_model.dart';
import 'package:baraka_trans/utilits/api_service.dart';
import 'package:get/get.dart';

class MyprofileController extends GetxController {
  final ApiService _apiService = ApiService();
  RxBool? isloading = false.obs;

  var userData = UserModel(
    id: 0,
    name: '',
    phone: '',
    email: '',
    isActive: 1,
    isBlocked: 0,
    image: '',
    createdAt: '',
    updatedAt: '',
    profilePhotoUrl: '',
  ).obs;

  // get user data
  void fetchUserData() async {
    try {
      isloading!.value = true;
      final data = await _apiService.getUserData();
      userData.value = UserModel.fromJson(data);
    } catch (e) {
      Get.snackbar('Error', 'Failed to load user data');
    } finally {
      isloading!.value = false;
    }
  }

  @override
  void onInit() {
    fetchUserData();
    super.onInit();
  }
}
