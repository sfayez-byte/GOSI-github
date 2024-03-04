// ignore_for_file: must_be_immutable

part of 'iphone_13_14_twelve_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Iphone1314Twelve widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class Iphone1314TwelveEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Iphone1314Twelve widget is first created.
class Iphone1314TwelveInitialEvent extends Iphone1314TwelveEvent {
  @override
  List<Object?> get props => [];
}
