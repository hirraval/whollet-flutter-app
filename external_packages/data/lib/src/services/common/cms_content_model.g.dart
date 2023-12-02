// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cms_content_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CmsContent _$CmsContentFromJson(Map<String, dynamic> json) => CmsContent(
      title: json['title'] as String,
      content: json['content'] as String,
      updatedAt: parseUtcDateTimeToLocal(json['updatedAt'] as String),
    );

Map<String, dynamic> _$CmsContentToJson(CmsContent instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'updatedAt': toUtcDateTime(instance.updatedAt),
    };
