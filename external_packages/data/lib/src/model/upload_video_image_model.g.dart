// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_video_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MultipleImageVideoResponse _$MultipleImageVideoResponseFromJson(
        Map<String, dynamic> json) =>
    MultipleImageVideoResponse(
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      video: (json['video'] as List<dynamic>?)
              ?.map((e) => VideoResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$MultipleImageVideoResponseToJson(
        MultipleImageVideoResponse instance) =>
    <String, dynamic>{
      'images': instance.images,
      'video': instance.video.map((e) => e.toJson()).toList(),
    };
