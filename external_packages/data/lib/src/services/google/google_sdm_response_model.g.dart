// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_sdm_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoogleSdmListDevicesResponse _$GoogleSdmListDevicesResponseFromJson(
        Map<String, dynamic> json) =>
    GoogleSdmListDevicesResponse(
      nextPageToken: json['nextPageToken'] as String?,
      devices: (json['devices'] as List<dynamic>?)
              ?.map((e) => GoogleSdmDevice.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$GoogleSdmListDevicesResponseToJson(
    GoogleSdmListDevicesResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('nextPageToken', instance.nextPageToken);
  val['devices'] = instance.devices.map((e) => e.toJson()).toList();
  return val;
}

GoogleSdmListRoomsResponse _$GoogleSdmListRoomsResponseFromJson(
        Map<String, dynamic> json) =>
    GoogleSdmListRoomsResponse(
      nextPageToken: json['nextPageToken'] as String?,
      rooms: (json['rooms'] as List<dynamic>?)
              ?.map((e) => GoogleSdmRoom.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$GoogleSdmListRoomsResponseToJson(
    GoogleSdmListRoomsResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('nextPageToken', instance.nextPageToken);
  val['rooms'] = instance.rooms.map((e) => e.toJson()).toList();
  return val;
}

GoogleSdmListStructuresResponse _$GoogleSdmListStructuresResponseFromJson(
        Map<String, dynamic> json) =>
    GoogleSdmListStructuresResponse(
      nextPageToken: json['nextPageToken'] as String?,
      structures: (json['structures'] as List<dynamic>?)
              ?.map(
                  (e) => GoogleSdmStructure.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$GoogleSdmListStructuresResponseToJson(
    GoogleSdmListStructuresResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('nextPageToken', instance.nextPageToken);
  val['structures'] = instance.structures.map((e) => e.toJson()).toList();
  return val;
}
