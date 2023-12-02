// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_sdm_traits_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoogleSdmInfoTraitsInfo _$GoogleSdmInfoTraitsInfoFromJson(
        Map<String, dynamic> json) =>
    GoogleSdmInfoTraitsInfo(
      customName: json['customName'] as String? ?? "",
    );

Map<String, dynamic> _$GoogleSdmInfoTraitsInfoToJson(
        GoogleSdmInfoTraitsInfo instance) =>
    <String, dynamic>{
      'customName': instance.customName,
    };

GoogleSdmCameraLiveStreamTraitsInfo
    _$GoogleSdmCameraLiveStreamTraitsInfoFromJson(Map<String, dynamic> json) =>
        GoogleSdmCameraLiveStreamTraitsInfo(
          maxVideoResolution: json['maxVideoResolution'] == null
              ? null
              : GoogleSdmCameraVideoResolution.fromJson(
                  json['maxVideoResolution'] as Map<String, dynamic>),
          audioCodecs: (json['audioCodecs'] as List<dynamic>?)
                  ?.map((e) => e as String)
                  .toList() ??
              const [],
          videoCodecs: (json['videoCodecs'] as List<dynamic>?)
                  ?.map((e) => e as String)
                  .toList() ??
              const [],
          supportedProtocols: (json['supportedProtocols'] as List<dynamic>?)
                  ?.map((e) => e as String)
                  .toList() ??
              const [],
        );

Map<String, dynamic> _$GoogleSdmCameraLiveStreamTraitsInfoToJson(
    GoogleSdmCameraLiveStreamTraitsInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('maxVideoResolution', instance.maxVideoResolution?.toJson());
  val['audioCodecs'] = instance.audioCodecs;
  val['videoCodecs'] = instance.videoCodecs;
  val['supportedProtocols'] = instance.supportedProtocols;
  return val;
}

GoogleSdmCameraVideoResolution _$GoogleSdmCameraVideoResolutionFromJson(
        Map<String, dynamic> json) =>
    GoogleSdmCameraVideoResolution(
      width: json['width'] as int,
      height: json['height'] as int,
    );

Map<String, dynamic> _$GoogleSdmCameraVideoResolutionToJson(
        GoogleSdmCameraVideoResolution instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
    };

GoogleSdmCameraImageTraitsInfo _$GoogleSdmCameraImageTraitsInfoFromJson(
        Map<String, dynamic> json) =>
    GoogleSdmCameraImageTraitsInfo(
      maxImageResolution: json['maxImageResolution'] == null
          ? null
          : GoogleSdmCameraImageResolution.fromJson(
              json['maxImageResolution'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GoogleSdmCameraImageTraitsInfoToJson(
    GoogleSdmCameraImageTraitsInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('maxImageResolution', instance.maxImageResolution?.toJson());
  return val;
}

GoogleSdmCameraImageResolution _$GoogleSdmCameraImageResolutionFromJson(
        Map<String, dynamic> json) =>
    GoogleSdmCameraImageResolution(
      width: json['width'] as int,
      height: json['height'] as int,
    );

Map<String, dynamic> _$GoogleSdmCameraImageResolutionToJson(
        GoogleSdmCameraImageResolution instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
    };
