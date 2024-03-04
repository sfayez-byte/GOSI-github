// ignore_for_file: must_be_immutable

part of 'iphone_13_14_twentysix_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Iphone1314Twentysix widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class Iphone1314TwentysixEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Iphone1314Twentysix widget is first created.
class Iphone1314TwentysixInitialEvent extends Iphone1314TwentysixEvent {
  @override
  List<Object?> get props => [];
}
