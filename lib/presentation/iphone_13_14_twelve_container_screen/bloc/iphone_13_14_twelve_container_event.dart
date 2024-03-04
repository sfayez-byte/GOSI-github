// ignore_for_file: must_be_immutable

part of 'iphone_13_14_twelve_container_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Iphone1314TwelveContainer widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class Iphone1314TwelveContainerEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Iphone1314TwelveContainer widget is first created.
class Iphone1314TwelveContainerInitialEvent
    extends Iphone1314TwelveContainerEvent {
  @override
  List<Object?> get props => [];
}
