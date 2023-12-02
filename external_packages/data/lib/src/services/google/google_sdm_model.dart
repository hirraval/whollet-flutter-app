import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'google_sdm_traits_model.dart';

part 'google_sdm_model.g.dart';

final _devicePartPrefixRegex = RegExp(r'^enterprises/.*/devices/');
final _structurePartPrefixRegex = RegExp(r'^enterprises/.*/structures/');
final _roomPartSuffixRegex = RegExp(r'/rooms/.*');
final _roomPartPrefixRegex = RegExp(r'^enterprises/.*/structures/.*/rooms/');

@JsonSerializable()
class GoogleSdmDevice extends Equatable {
  final String name;
  final List<GoogleSdmParentRelation> parentRelations;
  final Map<String, dynamic> traits;
  final String type;
  final String assignee;

  const GoogleSdmDevice({
    required this.name,
    this.parentRelations = const [],
    this.traits = const {},
    required this.type,
    required this.assignee,
  });

  factory GoogleSdmDevice.fromJson(Map<String, dynamic> json) => _$GoogleSdmDeviceFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleSdmDeviceToJson(this);

  @override
  List<Object?> get props => [name, parentRelations, traits, type, assignee];

  String get deviceId => name.replaceAll(_devicePartPrefixRegex, "");

  String get structureId => assignee.replaceAll(_structurePartPrefixRegex, "").replaceAll(_roomPartSuffixRegex, "");

  String get roomId => assignee.replaceAll(_roomPartPrefixRegex, "");

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
}

@JsonSerializable()
class GoogleSdmParentRelation extends Equatable {
  final String? displayName;
  final String? parent;

  const GoogleSdmParentRelation({
    this.displayName,
    this.parent,
  });

  factory GoogleSdmParentRelation.fromJson(Map<String, dynamic> json) => _$GoogleSdmParentRelationFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleSdmParentRelationToJson(this);

  @override
  List<Object?> get props => [displayName, parent];
}

@JsonSerializable()
class GoogleSdmRoom extends Equatable {
  final String? name;
  final Map<String, dynamic> traits;

  const GoogleSdmRoom({
    this.name,
    this.traits = const {},
  });

  factory GoogleSdmRoom.fromJson(Map<String, dynamic> json) => _$GoogleSdmRoomFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleSdmRoomToJson(this);

  @override
  List<Object?> get props => [name, traits];

  GoogleSdmInfoTraitsInfo? get roomInfoTraits {
    final json = traits[GoogleSdmTraits.roomInfo.value];
    return json == null ? null : GoogleSdmInfoTraitsInfo.fromJson(json);
  }
}

@JsonSerializable()
class GoogleSdmStructure extends Equatable {
  final String? name;
  final Map<String, dynamic> traits;

  const GoogleSdmStructure({
    this.name,
    this.traits = const {},
  });

  factory GoogleSdmStructure.fromJson(Map<String, dynamic> json) => _$GoogleSdmStructureFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleSdmStructureToJson(this);

  @override
  List<Object?> get props => [name, traits];

  GoogleSdmInfoTraitsInfo? get structureInfoTraits {
    final json = traits[GoogleSdmTraits.structureInfo.value];
    return json == null ? null : GoogleSdmInfoTraitsInfo.fromJson(json);
  }
}
