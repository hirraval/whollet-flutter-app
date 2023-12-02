import 'package:data/src/model/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'security_question_model.g.dart';

@JsonSerializable()
class SecurityQuestion extends NetworkResourceId {
  final String question;
  final int type;
  final bool status;

  const SecurityQuestion({
    required super.id,
    required this.question,
    required this.type,
    required this.status,
  });

  @override
  List<Object> get props => [id, question, type, status];

  factory SecurityQuestion.fromJson(Map<String, dynamic> json) => _$SecurityQuestionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SecurityQuestionToJson(this);
}
