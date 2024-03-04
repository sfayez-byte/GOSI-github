import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:sanad5pages/presentation/otp_screen/models/otp_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
part 'otp_event.dart';
part 'otp_state.dart';

/// A bloc that manages the state of a Otp according to the event that is dispatched to it.
class OtpBloc extends Bloc<OtpEvent, OtpState> with CodeAutoFill {
  OtpBloc(OtpState initialState) : super(initialState) {
    on<OtpInitialEvent>(_onInitialize);
    on<ChangeOTPEvent>(_changeOTP);
  }

  @override
  codeUpdated() {
    add(ChangeOTPEvent(code: code!));
  }

  _changeOTP(
    ChangeOTPEvent event,
    Emitter<OtpState> emit,
  ) {
    emit(
        state.copyWith(otpController: TextEditingController(text: event.code)));
  }

  _onInitialize(
    OtpInitialEvent event,
    Emitter<OtpState> emit,
  ) async {
    emit(state.copyWith(otpController: TextEditingController()));
    listenForCode();
  }
}
