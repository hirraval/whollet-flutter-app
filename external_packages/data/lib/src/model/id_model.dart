import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

abstract class NetworkResourceId extends Equatable {
  @JsonKey(name: "_id")
  final String id;

  const NetworkResourceId({
    required this.id,
  });

  Map<String, dynamic> toJson();
}
