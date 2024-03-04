import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:sanad5pages/presentation/iphone_13_14_twelve_container_screen/models/iphone_13_14_twelve_container_model.dart';
part 'iphone_13_14_twelve_container_event.dart';
part 'iphone_13_14_twelve_container_state.dart';

/// A bloc that manages the state of a Iphone1314TwelveContainer according to the event that is dispatched to it.
class Iphone1314TwelveContainerBloc extends Bloc<Iphone1314TwelveContainerEvent,
    Iphone1314TwelveContainerState> {
  Iphone1314TwelveContainerBloc(Iphone1314TwelveContainerState initialState)
      : super(initialState) {
    on<Iphone1314TwelveContainerInitialEvent>(_onInitialize);
  }

  _onInitialize(
    Iphone1314TwelveContainerInitialEvent event,
    Emitter<Iphone1314TwelveContainerState> emit,
  ) async {}
}
