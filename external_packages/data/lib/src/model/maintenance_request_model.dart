import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'maintenance_request_model.g.dart';

@JsonSerializable()
class MaintenanceNewRequestModel extends Equatable {
  @JsonKey(name: "_id")
  final String id;
  final String location;
  final DateTime? date;
  final String message;
  final List<String> attachments;
  final int currentStatus;

  const MaintenanceNewRequestModel({
    this.id = "",
    this.location = "",
    this.date,
    this.message = "",
    this.attachments = const [],
    this.currentStatus = 0,
  });

  factory MaintenanceNewRequestModel.fromJson(Map<String, dynamic> json) => _$MaintenanceNewRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$MaintenanceNewRequestModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        location,
        message,
        attachments,
        currentStatus,
        date,
      ];

  MaintenanceNewRequestModel copyWith({
    String? id,
    String? location,
    DateTime? date,
    String? message,
    List<String>? attachments,
    int? currentStatus,
  }) {
    return MaintenanceNewRequestModel(
      id: id ?? this.id,
      location: location ?? this.location,
      date: date ?? this.date,
      message: message ?? this.message,
      attachments: attachments ?? this.attachments,
      currentStatus: currentStatus ?? this.currentStatus,
    );
  }
}
