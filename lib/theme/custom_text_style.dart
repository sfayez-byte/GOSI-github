import 'package:flutter/material.dart';
import 'package:sanad5pages/core/utils/size_utils.dart';
import 'package:sanad5pages/theme/theme_helper.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeBluegray800 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.blueGray800,
      );
  static get bodyLargeErrorContainer => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.errorContainer.withOpacity(0.7),
      );
  static get bodyLargeGray500 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray500,
      );
  static get bodyLargeSomarPrimary => theme.textTheme.bodyLarge!.somar.copyWith(
        color: theme.colorScheme.primary,
      );
  static get bodySmallReadexProErrorContainer =>
      theme.textTheme.bodySmall!.readexPro.copyWith(
        color: theme.colorScheme.errorContainer.withOpacity(1),
        fontSize: 10.fSize,
      );
  // Display style
  static get displayMediumInter => theme.textTheme.displayMedium!.inter;
  // Headline text style
  static get headlineSmallErrorContainer =>
      theme.textTheme.headlineSmall!.copyWith(
        color: theme.colorScheme.errorContainer.withOpacity(1),
      );
  static get headlineSmallffffffff => theme.textTheme.headlineSmall!.copyWith(
        color: Color(0XFFFFFFFF),
      );
  // Label text style
  static get labelLargePoppinsPrimary =>
      theme.textTheme.labelLarge!.poppins.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w500,
      );
  static get labelLargeffffffff => theme.textTheme.labelLarge!.copyWith(
        color: Color(0XFFFFFFFF),
      );
  // Title text style
  static get titleLargeReadexPro =>
      theme.textTheme.titleLarge!.readexPro.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get titleMediumReadexProErrorContainer =>
      theme.textTheme.titleMedium!.readexPro.copyWith(
        color: theme.colorScheme.errorContainer.withOpacity(1),
        fontSize: 18.fSize,
      );
  static get titleSmallGray70001 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray70001,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallReadexProGray70001 =>
      theme.textTheme.titleSmall!.readexPro.copyWith(
        color: appTheme.gray70001,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallReadexProGray7000114 =>
      theme.textTheme.titleSmall!.readexPro.copyWith(
        color: appTheme.gray70001,
        fontSize: 14.fSize,
      );
}

extension on TextStyle {
  TextStyle get somar {
    return copyWith(
      fontFamily: 'Somar',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }

  TextStyle get readexPro {
    return copyWith(
      fontFamily: 'Readex Pro',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }
}
