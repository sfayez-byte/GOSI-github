// ignore_for_file: must_be_immutable

part of 'iphone_13_14_twentysix_bloc.dart';

/// Represents the state of Iphone1314Twentysix in the application.
class Iphone1314TwentysixState extends Equatable {
  Iphone1314TwentysixState({this.iphone1314TwentysixModelObj});

  Iphone1314TwentysixModel? iphone1314TwentysixModelObj;

  @override
  List<Object?> get props => [
        iphone1314TwentysixModelObj,
      ];

  Iphone1314TwentysixState copyWith(
      {Iphone1314TwentysixModel? iphone1314TwentysixModelObj}) {
    return Iphone1314TwentysixState(
      iphone1314TwentysixModelObj:
          iphone1314TwentysixModelObj ?? this.iphone1314TwentysixModelObj,
    );
  }
}
