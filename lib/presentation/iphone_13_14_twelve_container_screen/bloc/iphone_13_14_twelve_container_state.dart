// ignore_for_file: must_be_immutable

part of 'iphone_13_14_twelve_container_bloc.dart';

/// Represents the state of Iphone1314TwelveContainer in the application.
class Iphone1314TwelveContainerState extends Equatable {
  Iphone1314TwelveContainerState({this.iphone1314TwelveContainerModelObj});

  Iphone1314TwelveContainerModel? iphone1314TwelveContainerModelObj;

  @override
  List<Object?> get props => [
        iphone1314TwelveContainerModelObj,
      ];

  Iphone1314TwelveContainerState copyWith(
      {Iphone1314TwelveContainerModel? iphone1314TwelveContainerModelObj}) {
    return Iphone1314TwelveContainerState(
      iphone1314TwelveContainerModelObj: iphone1314TwelveContainerModelObj ??
          this.iphone1314TwelveContainerModelObj,
    );
  }
}
