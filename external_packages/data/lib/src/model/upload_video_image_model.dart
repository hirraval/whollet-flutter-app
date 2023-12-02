import 'package:data/data.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'upload_video_image_model.g.dart';


@JsonSerializable()
class MultipleImageVideoResponse extends Equatable {
  final List<String> images;
  final List<VideoResponse> video;

  const MultipleImageVideoResponse({this.images = const [], this.video = const []});

  factory MultipleImageVideoResponse.fromJson(Map<String, dynamic> json) => _$MultipleImageVideoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MultipleImageVideoResponseToJson(this);

  @override
  List<Object> get props => [images, video];

  MultipleImageVideoResponse copyWith({
    List<String>? images,
    List<VideoResponse>? video,
  }) {
    return MultipleImageVideoResponse(
      images: images ?? this.images,
      video: video ?? this.video,
    );
  }
}
