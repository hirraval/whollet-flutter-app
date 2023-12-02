import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'google_sdm_commands_model.g.dart';

abstract class GoogleSdmDeviceCommands {
  static const cameraLiveStream = GoogleSdmCameraLiveStream();
}

final class GoogleSdmCameraLiveStream {
  const GoogleSdmCameraLiveStream();

  final generateRtspStream = const GoogleSdmCameraLiveStreamCommand("GenerateRtspStream");
  final extendRtspStream = const GoogleSdmCameraLiveStreamCommand("ExtendRtspStream");
  final stopRtspStream = const GoogleSdmCameraLiveStreamCommand("StopRtspStream");
  final generateWebRtcStream = const GoogleSdmCameraLiveStreamCommand("GenerateWebRtcStream");
  final extendWebRtcStream = const GoogleSdmCameraLiveStreamCommand("ExtendWebRtcStream");
  final stopWebRtcStream = const GoogleSdmCameraLiveStreamCommand("StopWebRtcStream");
}

abstract base class GoogleSdmCommand extends Equatable {
  const GoogleSdmCommand();

  @override
  List<Object?> get props => [];

  String get command;
}

final class GoogleSdmCameraLiveStreamCommand extends GoogleSdmCommand {
  const GoogleSdmCameraLiveStreamCommand(this._commandName);

  final String _commandName;

  @override
  List<Object?> get props => [_commandName];

  @override
  String get command => "sdm.devices.commands.CameraLiveStream.$_commandName";
}

abstract base class GoogleSdmCommandParams extends Equatable {
  const GoogleSdmCommandParams();

  @override
  List<Object?> get props => [];

  Map<String, dynamic> toJson();
}

final class GenerateWebRtcStreamParams extends GoogleSdmCommandParams {
  final String offerSdp;

  const GenerateWebRtcStreamParams({required this.offerSdp});

  @override
  List<Object?> get props => [offerSdp];

  @override
  Map<String, dynamic> toJson() => {"offerSdp": offerSdp};
}

final class ExtendWebRtcStreamParams extends GoogleSdmCommandParams {
  final String mediaSessionId;

  const ExtendWebRtcStreamParams({required this.mediaSessionId});

  @override
  List<Object?> get props => [mediaSessionId];

  @override
  Map<String, dynamic> toJson() => {"mediaSessionId": mediaSessionId};
}

final class StopWebRtcStreamParams extends GoogleSdmCommandParams {
  final String mediaSessionId;

  const StopWebRtcStreamParams({required this.mediaSessionId});

  @override
  List<Object?> get props => [mediaSessionId];

  @override
  Map<String, dynamic> toJson() => {"mediaSessionId": mediaSessionId};
}

@JsonSerializable()
class GoogleSdmExecuteDeviceCommandResponse extends Equatable {
  final Map<String, dynamic>? results;

  const GoogleSdmExecuteDeviceCommandResponse({this.results});

  factory GoogleSdmExecuteDeviceCommandResponse.fromJson(Map<String, dynamic> json) =>
      _$GoogleSdmExecuteDeviceCommandResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleSdmExecuteDeviceCommandResponseToJson(this);

  @override
  List<Object?> get props => [results];
}

@JsonSerializable()
final class GenerateWebRtcStreamResponse extends Equatable {
  final String answerSdp;
  final String expiresAt;
  final String mediaSessionId;

  const GenerateWebRtcStreamResponse({
    required this.answerSdp,
    required this.expiresAt,
    required this.mediaSessionId,
  });

  @override
  List<Object?> get props => [answerSdp, expiresAt, mediaSessionId];

  factory GenerateWebRtcStreamResponse.fromJson(Map<String, dynamic> json) =>
      _$GenerateWebRtcStreamResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GenerateWebRtcStreamResponseToJson(this);
}
