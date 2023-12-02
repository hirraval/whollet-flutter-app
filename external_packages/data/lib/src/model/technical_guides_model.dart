import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'technical_guides_model.g.dart';

@JsonSerializable()
class TechnicalGuides extends Equatable {
  @JsonKey(name: "_id")
  final String id;
  final String title;
  final String description;
  final List<String> image;
  final List<VideoResponse> video;

  const TechnicalGuides({
    this.id = "",
    this.title = "",
    this.description = "",
    this.image = const [],
    this.video = const [],
  });

  factory TechnicalGuides.fromJson(Map<String, dynamic> json) => _$TechnicalGuidesFromJson(json);

  Map<String, dynamic> toJson() => _$TechnicalGuidesToJson(this);

  @override
  List<Object> get props => [id, title, description, image, video];

  TechnicalGuides copyWith({
    String? id,
    String? title,
    String? description,
    List<String>? image,
    List<VideoResponse>? video,
  }) {
    return TechnicalGuides(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
      video: video ?? this.video,
    );
  }
}

@JsonSerializable()
class VideoResponse extends Equatable {
  final String video;
  final String thumbnail;

  const VideoResponse({this.video = "", this.thumbnail = ""});

  factory VideoResponse.fromJson(Map<String, dynamic> json) => _$VideoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VideoResponseToJson(this);

  @override
  List<Object> get props => [video, thumbnail];
}
