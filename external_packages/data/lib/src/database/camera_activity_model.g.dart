// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'camera_activity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SnapshotActivity _$SnapshotActivityFromJson(Map<String, dynamic> json) =>
    SnapshotActivity(
      id: json['id'] as String,
      title: json['title'] as String,
      createdAt: parseUtcDateTimeToLocal(json['createdAt'] as String),
      filePath: json['filePath'] as String,
    );

Map<String, dynamic> _$SnapshotActivityToJson(SnapshotActivity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'createdAt': toUtcDateTime(instance.createdAt),
      'filePath': instance.filePath,
    };

RecordingActivity _$RecordingActivityFromJson(Map<String, dynamic> json) =>
    RecordingActivity(
      id: json['id'] as String,
      title: json['title'] as String,
      createdAt: parseUtcDateTimeToLocal(json['createdAt'] as String),
      filePath: json['filePath'] as String,
      thumbnailPath: json['thumbnailPath'] as String,
    );

Map<String, dynamic> _$RecordingActivityToJson(RecordingActivity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'createdAt': toUtcDateTime(instance.createdAt),
      'filePath': instance.filePath,
      'thumbnailPath': instance.thumbnailPath,
    };
