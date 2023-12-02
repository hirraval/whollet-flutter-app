import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'google_sdm_traits_model.g.dart';

enum GoogleSdmTraits<T extends Object> {
  deviceInfo("sdm.devices.traits.Info"),
  cameraLiveStream("sdm.devices.traits.CameraLiveStream"),
  cameraImage("sdm.devices.traits.CameraImage"),
  cameraPerson("sdm.devices.traits.CameraPerson"),
  cameraMotion("sdm.devices.traits.CameraMotion"),
  cameraClipPreview("sdm.devices.traits.CameraClipPreview"),
  doorbellChime("sdm.devices.traits.DoorbellChime"),
  structureInfo("sdm.structures.traits.Info"),
  roomInfo("sdm.structures.traits.RoomInfo");

  final String value;

  const GoogleSdmTraits(this.value);
}

mixin GoogleSdmDeviceTraitsMixin {
  Map<String, dynamic> get traits;

  GoogleSdmInfoTraitsInfo? get deviceInfoTraits {
    final json = traits[GoogleSdmTraits.deviceInfo.value];
    return json == null ? null : GoogleSdmInfoTraitsInfo.fromJson(json);
  }

  GoogleSdmCameraLiveStreamTraitsInfo? get cameraLiveStreamTraits {
    final json = traits[GoogleSdmTraits.cameraLiveStream.value];
    return json == null ? null : GoogleSdmCameraLiveStreamTraitsInfo.fromJson(json);
  }

  GoogleSdmCameraImageTraitsInfo? get cameraImageTraits {
    final json = traits[GoogleSdmTraits.cameraImage.value];
    return json == null ? null : GoogleSdmCameraImageTraitsInfo.fromJson(json);
  }

  GoogleSdmInfoTraitsInfo? get structureInfoTraits {
    final json = traits[GoogleSdmTraits.structureInfo.value];
    return json == null ? null : GoogleSdmInfoTraitsInfo.fromJson(json);
  }

  GoogleSdmInfoTraitsInfo? get roomInfoTraits {
    final json = traits[GoogleSdmTraits.roomInfo.value];
    return json == null ? null : GoogleSdmInfoTraitsInfo.fromJson(json);
  }
}

@JsonSerializable()
class GoogleSdmInfoTraitsInfo extends Equatable {
  final String customName;

  const GoogleSdmInfoTraitsInfo({this.customName = ""});

  @override
  List<Object?> get props => [customName];

  factory GoogleSdmInfoTraitsInfo.fromJson(Map<String, dynamic> json) => _$GoogleSdmInfoTraitsInfoFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleSdmInfoTraitsInfoToJson(this);
}

@JsonSerializable()
class GoogleSdmCameraLiveStreamTraitsInfo extends Equatable {
  final GoogleSdmCameraVideoResolution? maxVideoResolution;
  final List<String> audioCodecs;
  final List<String> videoCodecs;
  final List<String> supportedProtocols;

  const GoogleSdmCameraLiveStreamTraitsInfo({
    this.maxVideoResolution,
    this.audioCodecs = const [],
    this.videoCodecs = const [],
    this.supportedProtocols = const [],
  });

  @override
  List<Object?> get props => [maxVideoResolution, audioCodecs, videoCodecs, supportedProtocols];

  factory GoogleSdmCameraLiveStreamTraitsInfo.fromJson(Map<String, dynamic> json) =>
      _$GoogleSdmCameraLiveStreamTraitsInfoFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleSdmCameraLiveStreamTraitsInfoToJson(this);
}

@JsonSerializable()
class GoogleSdmCameraVideoResolution extends Equatable {
  final int width;
  final int height;

  const GoogleSdmCameraVideoResolution({required this.width, required this.height});

  @override
  List<Object?> get props => [width, height];

  factory GoogleSdmCameraVideoResolution.fromJson(Map<String, dynamic> json) =>
      _$GoogleSdmCameraVideoResolutionFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleSdmCameraVideoResolutionToJson(this);
}

@JsonSerializable()
class GoogleSdmCameraImageTraitsInfo extends Equatable {
  final GoogleSdmCameraImageResolution? maxImageResolution;

  const GoogleSdmCameraImageTraitsInfo({this.maxImageResolution});

  @override
  List<Object?> get props => [maxImageResolution];

  factory GoogleSdmCameraImageTraitsInfo.fromJson(Map<String, dynamic> json) =>
      _$GoogleSdmCameraImageTraitsInfoFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleSdmCameraImageTraitsInfoToJson(this);
}

@JsonSerializable()
class GoogleSdmCameraImageResolution extends Equatable {
  final int width;
  final int height;

  const GoogleSdmCameraImageResolution({required this.width, required this.height});

  @override
  List<Object?> get props => [width, height];

  factory GoogleSdmCameraImageResolution.fromJson(Map<String, dynamic> json) =>
      _$GoogleSdmCameraImageResolutionFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleSdmCameraImageResolutionToJson(this);
}
