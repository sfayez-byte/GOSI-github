import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:sanad5pages/presentation/iphone_13_14_twentysix_screen/models/iphone_13_14_twentysix_model.dart';
part 'iphone_13_14_twentysix_event.dart';
part 'iphone_13_14_twentysix_state.dart';

/// A bloc that manages the state of a Iphone1314Twentysix according to the event that is dispatched to it.
class Iphone1314TwentysixBloc
    extends Bloc<Iphone1314TwentysixEvent, Iphone1314TwentysixState> {
  Iphone1314TwentysixBloc(Iphone1314TwentysixState initialState)
      : super(initialState) {
    on<Iphone1314TwentysixInitialEvent>(_onInitialize);
  }

  _onInitialize(
    Iphone1314TwentysixInitialEvent event,
    Emitter<Iphone1314TwentysixState> emit,
  ) async {}
}
