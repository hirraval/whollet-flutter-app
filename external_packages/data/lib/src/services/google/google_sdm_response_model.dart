import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'google_sdm_model.dart';

part 'google_sdm_response_model.g.dart';

@JsonSerializable()
class GoogleSdmListDevicesResponse extends Equatable {
  final String? nextPageToken;
  final List<GoogleSdmDevice> devices;

  const GoogleSdmListDevicesResponse({
    this.nextPageToken,
    this.devices = const [],
  });

  factory GoogleSdmListDevicesResponse.fromJson(Map<String, dynamic> json) =>
      _$GoogleSdmListDevicesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleSdmListDevicesResponseToJson(this);

  @override
  List<Object?> get props => [nextPageToken, devices];
}

@JsonSerializable()
class GoogleSdmListRoomsResponse extends Equatable {
  final String? nextPageToken;
  final List<GoogleSdmRoom> rooms;

  const GoogleSdmListRoomsResponse({
    this.nextPageToken,
    this.rooms = const [],
  });

  factory GoogleSdmListRoomsResponse.fromJson(Map<String, dynamic> json) => _$GoogleSdmListRoomsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleSdmListRoomsResponseToJson(this);

  @override
  List<Object?> get props => [nextPageToken, rooms];
}

@JsonSerializable()
class GoogleSdmListStructuresResponse extends Equatable {
  final String? nextPageToken;
  final List<GoogleSdmStructure> structures;

  const GoogleSdmListStructuresResponse({
    this.nextPageToken,
    this.structures = const [],
  });

  factory GoogleSdmListStructuresResponse.fromJson(Map<String, dynamic> json) =>
      _$GoogleSdmListStructuresResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleSdmListStructuresResponseToJson(this);

  @override
  List<Object?> get props => [nextPageToken, structures];
}
