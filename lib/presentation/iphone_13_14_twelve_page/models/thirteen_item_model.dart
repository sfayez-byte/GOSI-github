import '../../../core/app_export.dart';

/// This class is used in the [thirteen_item_widget] screen.
class ThirteenItemModel {
  ThirteenItemModel({
    this.image,
    this.stretchingExercises,
    this.id,
    required this.url
  }) {
    image = image ?? ImageConstant.imgScreenshot20240226164327;
    stretchingExercises = stretchingExercises ?? "Stretching exercises:";
    id = id ?? "";
  }

  String? image;

  String? stretchingExercises;

  String? id;

  String url;
}
