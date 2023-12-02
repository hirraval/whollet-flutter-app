// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'security_question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SecurityQuestion _$SecurityQuestionFromJson(Map<String, dynamic> json) =>
    SecurityQuestion(
      id: json['_id'] as String,
      question: json['question'] as String,
      type: json['type'] as int,
      status: json['status'] as bool,
    );

Map<String, dynamic> _$SecurityQuestionToJson(SecurityQuestion instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'question': instance.question,
      'type': instance.type,
      'status': instance.status,
    };
