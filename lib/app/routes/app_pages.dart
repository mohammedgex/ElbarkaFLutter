import 'package:baraka_trans/app/modules/paymentmethods/views/paymentStatus.dart';
import 'package:get/get.dart';

import '../modules/ChatSupport/bindings/chat_support_binding.dart';
import '../modules/ChatSupport/views/chat_support_view.dart';
import '../modules/Forgetpassword/bindings/forgetpassword_binding.dart';
import '../modules/Forgetpassword/views/forgetpassword_view.dart';
import '../modules/Login/bindings/login_binding.dart';
import '../modules/Login/views/login_view.dart';
import '../modules/Signup/bindings/signup_binding.dart';
import '../modules/Signup/views/signup_view.dart';
import '../modules/Signup/views/verify_account.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/my_bookmarks/bindings/my_bookmarks_binding.dart';
import '../modules/my_bookmarks/views/my_bookmarks_view.dart';
import '../modules/my_payments/bindings/my_payments_binding.dart';
import '../modules/my_payments/views/my_payments_view.dart';
import '../modules/my_profile_detials/bindings/my_profile_detials_binding.dart';
import '../modules/my_profile_detials/views/my_profile_detials_view.dart';
import '../modules/myprofile/bindings/myprofile_binding.dart';
import '../modules/myprofile/views/myprofile_view.dart';
import '../modules/myreservations/bindings/myreservations_binding.dart';
import '../modules/myreservations/views/myreservations_view.dart';
import '../modules/notifications/bindings/notifications_binding.dart';
import '../modules/notifications/views/notifications_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/paymentmethods/bindings/paymentmethods_binding.dart';
import '../modules/paymentmethods/views/PaymobPaymentView.dart';
import '../modules/paymentmethods/views/Self_payment.dart';
import '../modules/paymentmethods/views/paymentmethods_view.dart';
import '../modules/paymentmethods/views/personPaymentView.dart';
import '../modules/reservation/bindings/reservation_binding.dart';
import '../modules/reservation/views/reservation_view.dart';
import '../modules/saved_transportations/bindings/saved_transportations_binding.dart';
import '../modules/saved_transportations/views/saved_transportations_view.dart';
import '../modules/transport_details/bindings/transport_details_binding.dart';
import '../modules/transport_details/views/notes.dart';
import '../modules/transport_details/views/transport_details_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;
  static const ONBOARDING = Routes.ONBOARDING;

  static final routes = [
    GetPage(
        name: _Paths.HOME,
        page: () => const HomeView(),
        binding: HomeBinding(),
        transition: Transition.cupertino),
    GetPage(
        name: _Paths.NOTES,
        page: () => const NotesView(),
        binding: TransportDetailsBinding(),
        transition: Transition.cupertino),
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.MYRESERVATIONS,
      page: () => const MyreservationsView(),
      binding: MyreservationsBinding(),
    ),
    GetPage(
      name: _Paths.MYPROFILE,
      page: () => const MyprofileView(),
      binding: MyprofileBinding(),
    ),
    GetPage(
        name: _Paths.NOTIFICATIONS,
        page: () => const NotificationsView(),
        binding: NotificationsBinding(),
        transition: Transition.downToUp),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.RESERVATION,
      page: () => const ReservationView(),
      binding: ReservationBinding(),
    ),
    GetPage(
        name: _Paths.TRANSPORT_DETAILS,
        page: () => const TransportDetailsView(),
        binding: TransportDetailsBinding(),
        transition: Transition.downToUp),
    GetPage(
        name: _Paths.PAYMENTMETHODS,
        page: () => const PaymentmethodsView(),
        binding: PaymentmethodsBinding(),
        transition: Transition.downToUp),
    GetPage(
        name: _Paths.SELF_PAYMENT,
        page: () => const Self_paymentView(),
        binding: PaymentmethodsBinding(),
        transition: Transition.downToUp),
    GetPage(
        name: _Paths.PAYMENT_STATUS,
        page: () => PaymentStatusView(),
        binding: PaymentmethodsBinding(),
        transition: Transition.downToUp),
    GetPage(
        name: _Paths.PERSON_PAYMENT,
        page: () => const personPaymentView(),
        binding: PaymentmethodsBinding(),
        transition: Transition.downToUp),
    GetPage(
        name: _Paths.LOGIN,
        page: () => const LoginView(),
        binding: LoginBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: _Paths.SIGNUP,
        page: () => const SignupView(),
        binding: SignupBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: _Paths.FORGETPASSWORD,
        page: () => const ForgetpasswordView(),
        binding: ForgetpasswordBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: _Paths.VERIFYACCOUNT,
        page: () => const VerifyAccount(),
        binding: SignupBinding(),
        transition: Transition.noTransition),
    GetPage(
      name: _Paths.MY_PAYMENTS,
      page: () => const MyPaymentsView(),
      binding: MyPaymentsBinding(),
    ),
    GetPage(
      name: _Paths.MY_PROFILE_DETIALS,
      page: () => const MyProfileDetialsView(),
      binding: MyProfileDetialsBinding(),
    ),
    GetPage(
      name: _Paths.MY_BOOKMARKS,
      page: () => const MyBookmarksView(),
      binding: MyBookmarksBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_SUPPORT,
      page: () => const ChatSupportView(),
      binding: ChatSupportBinding(),
    ),
    GetPage(
        name: _Paths.PAYMOB_PAYMENT,
        page: () => const PaymobPaymentView(),
        binding: MyPaymentsBinding(),
        transition: Transition.downToUp),
    GetPage(
      name: _Paths.SAVED_TRANSPORTATIONS,
      page: () => const SavedTransportationsView(),
      binding: SavedTransportationsBinding(),
    ),
  ];
}
