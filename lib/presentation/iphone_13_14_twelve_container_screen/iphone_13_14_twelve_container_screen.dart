import 'package:sanad5pages/presentation/iphone_13_14_twelve_page/iphone_13_14_twelve_page.dart';
import 'package:sanad5pages/widgets/custom_bottom_app_bar.dart';
import 'package:sanad5pages/widgets/custom_floating_button.dart';
import 'models/iphone_13_14_twelve_container_model.dart';
import 'package:flutter/material.dart';
import 'package:sanad5pages/core/app_export.dart';
import 'bloc/iphone_13_14_twelve_container_bloc.dart';

// ignore_for_file: must_be_immutable
class Iphone1314TwelveContainerScreen extends StatelessWidget {
  Iphone1314TwelveContainerScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<Iphone1314TwelveContainerBloc>(
        create: (context) => Iphone1314TwelveContainerBloc(
            Iphone1314TwelveContainerState(
                iphone1314TwelveContainerModelObj:
                    Iphone1314TwelveContainerModel()))
          ..add(Iphone1314TwelveContainerInitialEvent()),
        child: Iphone1314TwelveContainerScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Iphone1314TwelveContainerBloc,
        Iphone1314TwelveContainerState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: Container(
                  width: double.maxFinite,
                  decoration: AppDecoration.fillOnPrimaryContainer,
                  child: Column(children: [
                    // Navigator(
                    //     key: navigatorKey,
                    //     initialRoute: AppRoutes.iphone1314TwelvePage,
                    //     onGenerateRoute: (routeSetting) => PageRouteBuilder(
                    //         pageBuilder: (ctx, ani, ani1) =>
                    //             getCurrentPage(context, routeSetting.name!),
                    //         transitionDuration: Duration(seconds: 0))),
                    SizedBox(height: 47.v)
                  ])),
              bottomNavigationBar: _buildBottomNavConcept(context),
              floatingActionButton: CustomFloatingButton(
                  height: 52,
                  width: 52,
                  backgroundColor: theme.colorScheme.primary,
                  child: CustomImageView(
                      imagePath: ImageConstant.imgLinearVideo,
                      height: 26.0.v,
                      width: 26.0.h)),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked));
    });
  }

  /// Section Widget
  Widget _buildBottomNavConcept(BuildContext context) {
    return CustomBottomAppBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.iphone1314TwelvePage;
      case BottomBarEnum.Life:
        return "/";
      case BottomBarEnum.Calendar:
        return "/";
      case BottomBarEnum.Profile:
        return "/";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(
    BuildContext context,
    String currentRoute,
  ) {
    switch (currentRoute) {
      case AppRoutes.iphone1314TwelvePage:
        return Iphone1314TwelvePage.builder(context);
      default:
        return DefaultWidget();
    }
  }
}
