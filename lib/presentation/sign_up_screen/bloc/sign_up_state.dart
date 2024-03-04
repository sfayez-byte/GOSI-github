// ignore_for_file: must_be_immutable

part of 'sign_up_bloc.dart';

/// Represents the state of SignUp in the application.
class SignUpState extends Equatable {
  SignUpState({
    this.nameController,
    // this.frameSeventeenController,
    this.ageDate,
    this.signUpModelObj,
  });

  TextEditingController? nameController;

  // TextEditingController? frameSeventeenController;

  DateTime? ageDate;

  SignUpModel? signUpModelObj;

  @override
  List<Object?> get props => [
        nameController,
        ageDate,
        // frameSeventeenController,
        signUpModelObj,
      ];

  SignUpState copyWith({
    TextEditingController? nameController,
    // TextEditingController? frameSeventeenController,
    DateTime? ageDate,
    SignUpModel? signUpModelObj,
  }) {
    return SignUpState(
      nameController: nameController ?? this.nameController,
      ageDate:
          ageDate ?? this.ageDate,
      // frameSeventeenController:
      //     frameSeventeenController ?? this.frameSeventeenController,
      signUpModelObj: signUpModelObj ?? this.signUpModelObj,
    );
  }
}
