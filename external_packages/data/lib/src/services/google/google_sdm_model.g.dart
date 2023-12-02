// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_sdm_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoogleSdmDevice _$GoogleSdmDeviceFromJson(Map<String, dynamic> json) =>
    GoogleSdmDevice(
      name: json['name'] as String,
      parentRelations: (json['parentRelations'] as List<dynamic>?)
              ?.map((e) =>
                  GoogleSdmParentRelation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      traits: json['traits'] as Map<String, dynamic>? ?? const {},
      type: json['type'] as String,
      assignee: json['assignee'] as String,
    );

Map<String, dynamic> _$GoogleSdmDeviceToJson(GoogleSdmDevice instance) =>
    <String, dynamic>{
      'name': instance.name,
      'parentRelations':
          instance.parentRelations.map((e) => e.toJson()).toList(),
      'traits': instance.traits,
      'type': instance.type,
      'assignee': instance.assignee,
    };

GoogleSdmParentRelation _$GoogleSdmParentRelationFromJson(
        Map<String, dynamic> json) =>
    GoogleSdmParentRelation(
      displayName: json['displayName'] as String?,
      parent: json['parent'] as String?,
    );

Map<String, dynamic> _$GoogleSdmParentRelationToJson(
    GoogleSdmParentRelation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('displayName', instance.displayName);
  writeNotNull('parent', instance.parent);
  return val;
}

GoogleSdmRoom _$GoogleSdmRoomFromJson(Map<String, dynamic> json) =>
    GoogleSdmRoom(
      name: json['name'] as String?,
      traits: json['traits'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$GoogleSdmRoomToJson(GoogleSdmRoom instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  val['traits'] = instance.traits;
  return val;
}

GoogleSdmStructure _$GoogleSdmStructureFromJson(Map<String, dynamic> json) =>
    GoogleSdmStructure(
      name: json['name'] as String?,
      traits: json['traits'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$GoogleSdmStructureToJson(GoogleSdmStructure instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  val['traits'] = instance.traits;
  return val;
}
