import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/thirteen_item_model.dart';
import 'package:sanad5pages/presentation/iphone_13_14_twelve_page/models/iphone_13_14_twelve_model.dart';
part 'iphone_13_14_twelve_event.dart';
part 'iphone_13_14_twelve_state.dart';

/// A bloc that manages the state of a Iphone1314Twelve according to the event that is dispatched to it.
class Iphone1314TwelveBloc
    extends Bloc<Iphone1314TwelveEvent, Iphone1314TwelveState> {
  Iphone1314TwelveBloc(Iphone1314TwelveState initialState)
      : super(initialState) {
    on<Iphone1314TwelveInitialEvent>(_onInitialize);
  }

  _onInitialize(
    Iphone1314TwelveInitialEvent event,
    Emitter<Iphone1314TwelveState> emit,
  ) async {
    emit(state.copyWith(
        iphone1314TwelveModelObj: state.iphone1314TwelveModelObj?.copyWith(
      thirteenItemList: fillThirteenItemList(),
    )));
  }

  List<ThirteenItemModel> fillThirteenItemList() {
    return [
      ThirteenItemModel(
          image: 'assets/images/v1.png',
          url: 'https://youtu.be/0e7Bz0eAwWQ?si=ylBQDTAwXm3nmXyj',
          stretchingExercises: "Lower body stretches (after exercise)"),
      ThirteenItemModel(
          image: 'assets/images/v2.png',
          url: 'https://youtu.be/yDXBRssBpVo?si=KD2EbZW52NYS0_8Z',
          stretchingExercises: "10 Minute Mobility & Stretching Routine Follow Along - Morning, Daily, Warm up, or Cool Down"),
      ThirteenItemModel(
          image: 'assets/images/v3.png',
          url: 'https://youtu.be/1hAfB0EUS4E?si=SO6KPz9JmuvVBSpJ',
          stretchingExercises: "The ideal height routine || Tighten your back and abdomen and increase your height in just 10 minutes a day"),
      ThirteenItemModel(
          image: 'assets/images/v4.png',
          url: 'https://youtu.be/dVfXNaPdFpU?si=5Sc5dfe87aNBEgdL',
          stretchingExercises: "Exercises to relieve knee pain")
    ];
  }
}
