// ignore_for_file: must_be_immutable

part of 'log_in_bloc.dart';

/// Represents the state of LogIn in the application.
class LogInState extends Equatable {
  LogInState({
    this.phoneNumberController,
    this.selectedCountry,
    this.logInModelObj,
  });

  TextEditingController? phoneNumberController;

  LogInModel? logInModelObj;

  Country? selectedCountry;

  @override
  List<Object?> get props => [
        phoneNumberController,
        selectedCountry,
        logInModelObj,
      ];

  LogInState copyWith({
    TextEditingController? phoneNumberController,
    Country? selectedCountry,
    LogInModel? logInModelObj,
  }) {
    return LogInState(
      phoneNumberController:
          phoneNumberController ?? this.phoneNumberController,
      selectedCountry: selectedCountry ?? this.selectedCountry,
      logInModelObj: logInModelObj ?? this.logInModelObj,
    );
  }
}
