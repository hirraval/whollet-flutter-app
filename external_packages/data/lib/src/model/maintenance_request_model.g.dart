// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenance_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaintenanceNewRequestModel _$MaintenanceNewRequestModelFromJson(
        Map<String, dynamic> json) =>
    MaintenanceNewRequestModel(
      id: json['_id'] as String? ?? "",
      location: json['location'] as String? ?? "",
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      message: json['message'] as String? ?? "",
      attachments: (json['attachments'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      currentStatus: json['currentStatus'] as int? ?? 0,
    );

Map<String, dynamic> _$MaintenanceNewRequestModelToJson(
    MaintenanceNewRequestModel instance) {
  final val = <String, dynamic>{
    '_id': instance.id,
    'location': instance.location,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('date', instance.date?.toIso8601String());
  val['message'] = instance.message;
  val['attachments'] = instance.attachments;
  val['currentStatus'] = instance.currentStatus;
  return val;
}
