// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FaqQuestionGroup _$FaqQuestionGroupFromJson(Map<String, dynamic> json) =>
    FaqQuestionGroup(
      info: FaqGroup.fromJson(json['info'] as Map<String, dynamic>),
      questions: (json['questions'] as List<dynamic>)
          .map((e) => FaqQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FaqQuestionGroupToJson(FaqQuestionGroup instance) =>
    <String, dynamic>{
      'info': instance.info.toJson(),
      'questions': instance.questions.map((e) => e.toJson()).toList(),
    };

FaqGroup _$FaqGroupFromJson(Map<String, dynamic> json) => FaqGroup(
      id: json['_id'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$FaqGroupToJson(FaqGroup instance) => <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
    };

FaqQuestion _$FaqQuestionFromJson(Map<String, dynamic> json) => FaqQuestion(
      id: json['_id'] as String,
      group: FaqGroup.fromJson(json['group'] as Map<String, dynamic>),
      question: json['question'] as String,
      answer: json['answer'] as String,
    );

Map<String, dynamic> _$FaqQuestionToJson(FaqQuestion instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'group': instance.group.toJson(),
      'question': instance.question,
      'answer': instance.answer,
    };
