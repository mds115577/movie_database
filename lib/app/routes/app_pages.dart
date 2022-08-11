import 'package:get/get.dart';

import 'package:movie_database/app/modules/authenticator/bindings/authenticator_binding.dart';
import 'package:movie_database/app/modules/authenticator/views/authenticator_view.dart';
import 'package:movie_database/app/modules/details_screen/bindings/details_screen_binding.dart';
import 'package:movie_database/app/modules/details_screen/views/details_screen_view.dart';
import 'package:movie_database/app/modules/error_screen/bindings/error_screen_binding.dart';
import 'package:movie_database/app/modules/error_screen/views/error_screen_view.dart';
import 'package:movie_database/app/modules/home_screen/bindings/home_screen_binding.dart';
import 'package:movie_database/app/modules/home_screen/views/home_screen_view.dart';
import 'package:movie_database/app/modules/login_page/bindings/login_page_binding.dart';
import 'package:movie_database/app/modules/login_page/views/login_page_view.dart';
import 'package:movie_database/app/modules/sign_up/bindings/sign_up_binding.dart';
import 'package:movie_database/app/modules/sign_up/views/sign_up_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.AUTHENTICATOR;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN_PAGE,
      page: () => LoginPageView(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: _Paths.HOME_SCREEN,
      page: () => HomeScreenView(),
      binding: HomeScreenBinding(),
    ),
    GetPage(
      name: _Paths.DETAILS_SCREEN,
      page: () => DetailsScreenView(),
      binding: DetailsScreenBinding(),
    ),
    GetPage(
      name: _Paths.AUTHENTICATOR,
      page: () => AuthenticatorView(),
      binding: AuthenticatorBinding(),
    ),
    GetPage(
      name: _Paths.ERROR_SCREEN,
      page: () => ErrorScreenView(),
      binding: ErrorScreenBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
  ];
}
