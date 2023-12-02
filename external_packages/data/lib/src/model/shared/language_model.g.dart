// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LanguageModel _$LanguageModelFromJson(Map<String, dynamic> json) =>
    LanguageModel(
      name: json['name'] as String,
      code: json['code'] as String,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$LanguageModelToJson(LanguageModel instance) {
  final val = <String, dynamic>{
    'name': instance.name,
    'code': instance.code,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('icon', instance.icon);
  return val;
}
