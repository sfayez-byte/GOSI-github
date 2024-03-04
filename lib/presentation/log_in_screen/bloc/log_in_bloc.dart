import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:sanad5pages/presentation/log_in_screen/models/log_in_model.dart';
part 'log_in_event.dart';
part 'log_in_state.dart';

/// A bloc that manages the state of a LogIn according to the event that is dispatched to it.
class LogInBloc extends Bloc<LogInEvent, LogInState> {
  LogInBloc(LogInState initialState) : super(initialState) {
    on<LogInInitialEvent>(_onInitialize);
    on<ChangeCountryEvent>(_changeCountry);
  }

  _changeCountry(
    ChangeCountryEvent event,
    Emitter<LogInState> emit,
  ) {
    emit(state.copyWith(selectedCountry: event.value));
  }

  _onInitialize(
    LogInInitialEvent event,
    Emitter<LogInState> emit,
  ) async {
    emit(state.copyWith(phoneNumberController: TextEditingController()));
    Future.delayed(const Duration(milliseconds: 3000), () {
      // NavigatorService.popAndPushNamed(
      //   AppRoutes.iphone1314TwentysixScreen,
      // );
    });
  }
}
