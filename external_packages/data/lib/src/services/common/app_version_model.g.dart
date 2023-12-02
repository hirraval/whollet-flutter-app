// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_version_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppVersion _$AppVersionFromJson(Map<String, dynamic> json) => AppVersion(
      android: AppVersionInfo.fromJson(json['android'] as Map<String, dynamic>),
      ios: AppVersionInfo.fromJson(json['ios'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AppVersionToJson(AppVersion instance) =>
    <String, dynamic>{
      'android': instance.android.toJson(),
      'ios': instance.ios.toJson(),
    };

AppVersionInfo _$AppVersionInfoFromJson(Map<String, dynamic> json) =>
    AppVersionInfo(
      version: json['version'] as String,
      buildNumber: json['buildNumber'] as int,
      latestVersion: json['latestVersion'] as String,
      latestBuildNumber: json['latestBuildNumber'] as int,
    );

Map<String, dynamic> _$AppVersionInfoToJson(AppVersionInfo instance) =>
    <String, dynamic>{
      'version': instance.version,
      'buildNumber': instance.buildNumber,
      'latestVersion': instance.latestVersion,
      'latestBuildNumber': instance.latestBuildNumber,
    };
