// ignore_for_file: must_be_immutable

part of 'otp_bloc.dart';

/// Represents the state of Otp in the application.
class OtpState extends Equatable {
  OtpState({
    this.otpController,
    this.otpModelObj,
  });

  TextEditingController? otpController;

  OtpModel? otpModelObj;

  @override
  List<Object?> get props => [
        otpController,
        otpModelObj,
      ];

  OtpState copyWith({
    TextEditingController? otpController,
    OtpModel? otpModelObj,
  }) {
    return OtpState(
      otpController: otpController ?? this.otpController,
      otpModelObj: otpModelObj ?? this.otpModelObj,
    );
  }
}
