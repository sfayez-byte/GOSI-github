// ignore_for_file: must_be_immutable

part of 'iphone_13_14_twelve_bloc.dart';

/// Represents the state of Iphone1314Twelve in the application.
class Iphone1314TwelveState extends Equatable {
  Iphone1314TwelveState({this.iphone1314TwelveModelObj});

  Iphone1314TwelveModel? iphone1314TwelveModelObj;

  @override
  List<Object?> get props => [
        iphone1314TwelveModelObj,
      ];

  Iphone1314TwelveState copyWith(
      {Iphone1314TwelveModel? iphone1314TwelveModelObj}) {
    return Iphone1314TwelveState(
      iphone1314TwelveModelObj:
          iphone1314TwelveModelObj ?? this.iphone1314TwelveModelObj,
    );
  }
}
