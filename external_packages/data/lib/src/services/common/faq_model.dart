import 'package:data/src/model/model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'faq_model.g.dart';

@JsonSerializable()
class FaqQuestionGroup extends Equatable {
  final FaqGroup info;
  final List<FaqQuestion> questions;

  const FaqQuestionGroup({required this.info, required this.questions});

  @override
  List<Object?> get props => [info, questions];

  factory FaqQuestionGroup.fromJson(Map<String, dynamic> json) => _$FaqQuestionGroupFromJson(json);

  Map<String, dynamic> toJson() => _$FaqQuestionGroupToJson(this);
}

@JsonSerializable()
class FaqGroup extends NetworkResourceId {
  final String title;

  const FaqGroup({required super.id, required this.title});

  @override
  List<Object?> get props => [id, title];

  factory FaqGroup.fromJson(Map<String, dynamic> json) => _$FaqGroupFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FaqGroupToJson(this);
}

@JsonSerializable()
class FaqQuestion extends NetworkResourceId {
  final FaqGroup group;
  final String question;
  final String answer;

  const FaqQuestion({
    required super.id,
    required this.group,
    required this.question,
    required this.answer,
  });

  factory FaqQuestion.fromJson(Map<String, dynamic> json) => _$FaqQuestionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FaqQuestionToJson(this);

  @override
  List<Object> get props => [id, question, group, answer];
}
