// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'technical_guides_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TechnicalGuides _$TechnicalGuidesFromJson(Map<String, dynamic> json) =>
    TechnicalGuides(
      id: json['_id'] as String? ?? "",
      title: json['title'] as String? ?? "",
      description: json['description'] as String? ?? "",
      image:
          (json['image'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      video: (json['video'] as List<dynamic>?)
              ?.map((e) => VideoResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$TechnicalGuidesToJson(TechnicalGuides instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
      'video': instance.video.map((e) => e.toJson()).toList(),
    };

VideoResponse _$VideoResponseFromJson(Map<String, dynamic> json) =>
    VideoResponse(
      video: json['video'] as String? ?? "",
      thumbnail: json['thumbnail'] as String? ?? "",
    );

Map<String, dynamic> _$VideoResponseToJson(VideoResponse instance) =>
    <String, dynamic>{
      'video': instance.video,
      'thumbnail': instance.thumbnail,
    };
