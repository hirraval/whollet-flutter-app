import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'language_model.g.dart';

@JsonSerializable()
class LanguageModel extends Equatable {
  final String name;
  final String code;
  final String? icon;

  const LanguageModel({
    required this.name,
    required this.code,
    this.icon,
  });

  @override
  List<Object?> get props => [name, code,icon];

  factory LanguageModel.fromJson(Map<String, dynamic> json) => _$LanguageModelFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageModelToJson(this);
}
