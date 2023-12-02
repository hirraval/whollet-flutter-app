import 'package:flutter/material.dart';

class AppColor extends ThemeExtension<AppColor> {
  final Color failure;
  final Color onFailure;
  final Color success;
  final Color onSuccess;
  final Color pending;

  Color get failureContainer => failure.withAlpha(50);

  Color get onFailureContainer => failure;

  Color get successContainer => success.withAlpha(50);

  Color get onSuccessContainer => success;

  const AppColor({
    required this.failure,
    required this.onFailure,
    required this.success,
    required this.onSuccess,
    required this.pending,
  });

  static AppColor of(BuildContext context) {
    var extension = Theme.of(context).extension<AppColor>();
    assert(extension != null);
    return extension!;
  }

  @override
  ThemeExtension<AppColor> copyWith({
    Color? failure,
    Color? onFailure,
    Color? success,
    Color? onSuccess,
    Color? pending,
    Color? onPending,
    Color? warning,
    Color? onWarning,
  }) {
    return AppColor(
      failure: failure ?? this.failure,
      onFailure: onFailure ?? this.onFailure,
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      pending: pending ?? this.pending,
    );
  }

  @override
  ThemeExtension<AppColor> lerp(ThemeExtension<AppColor>? other, double t) {
    if (other is! AppColor) return this;
    return copyWith(
      failure: Color.lerp(failure, other.failure, t),
      onFailure: Color.lerp(onFailure, other.onFailure, t),
      success: Color.lerp(success, other.success, t),
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppColor &&
          runtimeType == other.runtimeType &&
          failure == other.failure &&
          onFailure == other.onFailure &&
          failureContainer == other.failureContainer &&
          onFailureContainer == other.onFailureContainer &&
          success == other.success &&
          onSuccess == other.onSuccess &&
          successContainer == other.successContainer &&
          onSuccessContainer == other.onSuccessContainer;

  @override
  int get hashCode =>
      failure.hashCode ^
      onFailure.hashCode ^
      failureContainer.hashCode ^
      onFailureContainer.hashCode ^
      success.hashCode ^
      onSuccess.hashCode ^
      successContainer.hashCode ^
      onSuccessContainer.hashCode;
}

extension AppColorContextExtension on BuildContext {
  AppColor get appColor => AppColor.of(this);
}

extension AppColorThemeExtension on ThemeData {
  AppColor get appColor {
    var extension = this.extension<AppColor>();
    assert(extension != null);
    return extension!;
  }
}
