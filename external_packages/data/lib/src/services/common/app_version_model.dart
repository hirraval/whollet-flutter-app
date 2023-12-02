import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_version_model.g.dart';

@JsonSerializable()
class AppVersion extends Equatable {
  final AppVersionInfo android;
  final AppVersionInfo ios;

  @override
  List<Object?> get props => [android, ios];

  const AppVersion({
    required this.android,
    required this.ios,
  });

  factory AppVersion.fromJson(Map<String, dynamic> json) => _$AppVersionFromJson(json);

  Map<String, dynamic> toJson() => _$AppVersionToJson(this);
}

@JsonSerializable()
class AppVersionInfo extends Equatable {
  final String version;
  final int buildNumber;
  final String latestVersion;
  final int latestBuildNumber;

  const AppVersionInfo({
    required this.version,
    required this.buildNumber,
    required this.latestVersion,
    required this.latestBuildNumber,
  });

  @override
  List<Object?> get props => [version, buildNumber, latestVersion, latestBuildNumber];

  factory AppVersionInfo.fromJson(Map<String, dynamic> json) => _$AppVersionInfoFromJson(json);

  Map<String, dynamic> toJson() => _$AppVersionInfoToJson(this);
}
