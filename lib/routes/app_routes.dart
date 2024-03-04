import 'package:flutter/material.dart';
import 'package:sanad5pages/presentation/another_pages/profile_scr.dart';
import '../presentation/log_in_screen/log_in_screen.dart';
import '../presentation/otp_screen/otp_screen.dart';
import '../presentation/sign_up_screen/sign_up_screen.dart';
import '../presentation/iphone_13_14_twentysix_screen/iphone_13_14_twentysix_screen.dart';
import '../presentation/iphone_13_14_twelve_container_screen/iphone_13_14_twelve_container_screen.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String logInScreen = '/log_in_screen';

  static const String otpScreen = '/otp_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String iphone1314TwentysixScreen =
      '/iphone_13_14_twentysix_screen';

  static const String iphone1314TwelvePage = '/iphone_13_14_twelve_page';

  static const String iphone1314TwelveContainerScreen =
      '/iphone_13_14_twelve_container_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        logInScreen: LogInScreen.builder,
        otpScreen: OtpScreen.builder,
        signUpScreen: SignUpScreen.builder,
        iphone1314TwentysixScreen: Iphone1314TwentysixScreen.builder,
        iphone1314TwelveContainerScreen:
            Iphone1314TwelveContainerScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        'profile': ProfileScr.builder,
        initialRoute: LogInScreen.builder
      };
}
