// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_sdm_commands_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoogleSdmExecuteDeviceCommandResponse
    _$GoogleSdmExecuteDeviceCommandResponseFromJson(
            Map<String, dynamic> json) =>
        GoogleSdmExecuteDeviceCommandResponse(
          results: json['results'] as Map<String, dynamic>?,
        );

Map<String, dynamic> _$GoogleSdmExecuteDeviceCommandResponseToJson(
    GoogleSdmExecuteDeviceCommandResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('results', instance.results);
  return val;
}

GenerateWebRtcStreamResponse _$GenerateWebRtcStreamResponseFromJson(
        Map<String, dynamic> json) =>
    GenerateWebRtcStreamResponse(
      answerSdp: json['answerSdp'] as String,
      expiresAt: json['expiresAt'] as String,
      mediaSessionId: json['mediaSessionId'] as String,
    );

Map<String, dynamic> _$GenerateWebRtcStreamResponseToJson(
        GenerateWebRtcStreamResponse instance) =>
    <String, dynamic>{
      'answerSdp': instance.answerSdp,
      'expiresAt': instance.expiresAt,
      'mediaSessionId': instance.mediaSessionId,
    };
