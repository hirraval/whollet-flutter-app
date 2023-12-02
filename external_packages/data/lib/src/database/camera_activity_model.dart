import 'package:data/src/model/model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'camera_activity_model.g.dart';

sealed class CameraActivity extends Equatable {
  final String id;
  final String title;
  @JsonKey(fromJson: parseUtcDateTimeToLocal, toJson: toUtcDateTime)
  final DateTime createdAt;
  final CameraActivityType type;

  const CameraActivity({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.type,
  });

  @mustCallSuper
  @override
  List<Object?> get props => [id, title, createdAt, type];

  factory CameraActivity.fromJson(Map<String, dynamic> json) {
    final type = CameraActivityType.values.byName(json["type"]);
    return switch (type) {
      CameraActivityType.snapshot => SnapshotActivity.fromJson(json),
      CameraActivityType.recording => RecordingActivity.fromJson(json),
    };
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "createdAt": createdAt.millisecondsSinceEpoch,
      "type": type.name,
    };
  }
}

@JsonEnum()
enum CameraActivityType {
  snapshot,
  recording;
}

@JsonSerializable()
final class SnapshotActivity extends CameraActivity {
  final String filePath;

  const SnapshotActivity({
    required super.id,
    required super.title,
    required super.createdAt,
    required this.filePath,
  }) : super(type: CameraActivityType.snapshot);

  @override
  List<Object?> get props => super.props..add(filePath);

  factory SnapshotActivity.fromJson(Map<String, dynamic> json) => _$SnapshotActivityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SnapshotActivityToJson(this);
}

@JsonSerializable()
final class RecordingActivity extends CameraActivity {
  final String filePath;
  final String thumbnailPath;

  const RecordingActivity({
    required super.id,
    required super.title,
    required super.createdAt,
    required this.filePath,
    required this.thumbnailPath,
  }) : super(type: CameraActivityType.recording);

  @override
  List<Object?> get props => super.props..addAll([filePath, thumbnailPath]);

  factory RecordingActivity.fromJson(Map<String, dynamic> json) => _$RecordingActivityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RecordingActivityToJson(this);

  RecordingActivity copyWith({String? filePath, String? thumbnailPath}) {
    return RecordingActivity(
      id: id,
      createdAt: createdAt,
      title: title,
      filePath: filePath ?? this.filePath,
      thumbnailPath: thumbnailPath ?? this.thumbnailPath,
    );
  }
}
