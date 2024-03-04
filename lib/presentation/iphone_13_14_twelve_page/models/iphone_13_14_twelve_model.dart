// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'thirteen_item_model.dart';

/// This class defines the variables used in the [iphone_13_14_twelve_page],
/// and is typically used to hold data that is passed between different parts of the application.
class Iphone1314TwelveModel extends Equatable {
  Iphone1314TwelveModel({this.thirteenItemList = const []}) {}

  List<ThirteenItemModel> thirteenItemList;

  Iphone1314TwelveModel copyWith({List<ThirteenItemModel>? thirteenItemList}) {
    return Iphone1314TwelveModel(
      thirteenItemList: thirteenItemList ?? this.thirteenItemList,
    );
  }

  @override
  List<Object?> get props => [thirteenItemList];
}
