import 'package:injectable/injectable.dart';
import 'package:network/network.dart';

import 'google_sdm_commands_model.dart';
import 'google_sdm_model.dart';
import 'google_sdm_response_model.dart';

@lazySingleton
class GoogleSdmRepository extends BaseRepository {
  GoogleSdmRepository({
    @Named("google_sdm_dio") required super.dio,
    required super.cacheService,
  });

  Future<GoogleSdmDevice> getDevice({
    required String deviceId,
  }) async {
    final request = ApiRequest<GoogleSdmDevice>(
      RequestType.get,
      "devices/{deviceId}",
      pathParams: {'deviceId': deviceId},
      responseParser: (responseData) => GoogleSdmDevice.fromJson(responseData),
    );
    return processApiRequest(request);
  }

  Future<GoogleSdmListDevicesResponse> listDevices({
    int? pageSize,
    String? pageToken,
    String? filter,
  }) async {
    final request = ApiRequest<GoogleSdmListDevicesResponse>(
      RequestType.get,
      "devices",
      queryParams: {
        if (pageSize != null) 'pageSize': pageSize,
        if (pageToken != null) 'pageToken': pageToken,
        if (filter != null) 'filter': filter,
      },
      responseParser: (responseData) => GoogleSdmListDevicesResponse.fromJson(responseData),
    );
    return processApiRequest(request);
  }

  Future<GoogleSdmExecuteDeviceCommandResponse> executeDeviceCommand({
    required String deviceId,
    required GoogleSdmCommand command,
    required GoogleSdmCommandParams? params,
  }) async {
    final request = ApiRequest<GoogleSdmExecuteDeviceCommandResponse>(
      RequestType.post,
      "devices/{deviceId}:executeCommand",
      pathParams: {'deviceId': deviceId},
      data: {
        "command": command.command,
        if (params != null) "params": params.toJson(),
      },
      responseParser: (responseData) => GoogleSdmExecuteDeviceCommandResponse.fromJson(responseData),
    );
    return processApiRequest(request);
  }

  Future<GoogleSdmStructure> getStructure({
    required String structureId,
  }) async {
    final request = ApiRequest<GoogleSdmStructure>(
      RequestType.get,
      "structures/{structureId}",
      pathParams: {'structureId': structureId},
      responseParser: (responseData) => GoogleSdmStructure.fromJson(responseData),
    );
    return processApiRequest(request);
  }

  Future<GoogleSdmListStructuresResponse> listStructure({
    int? pageSize,
    String? pageToken,
    String? filter,
  }) async {
    final request = ApiRequest<GoogleSdmListStructuresResponse>(
      RequestType.get,
      "structures",
      queryParams: {
        if (pageSize != null) 'pageSize': pageSize,
        if (pageToken != null) 'pageToken': pageToken,
        if (filter != null) 'filter': filter,
      },
      responseParser: (responseData) => GoogleSdmListStructuresResponse.fromJson(responseData),
    );
    return processApiRequest(request);
  }

  Future<GoogleSdmRoom> getRoom({
    required String structureId,
    required String roomId,
  }) async {
    final request = ApiRequest<GoogleSdmRoom>(
      RequestType.get,
      "structures/{structureId}/rooms/{roomId}",
      pathParams: {'structureId': structureId, 'roomId': roomId},
      responseParser: (responseData) => GoogleSdmRoom.fromJson(responseData),
    );
    return processApiRequest(request);
  }

  Future<GoogleSdmListRoomsResponse> listRoom({
    required String structureId,
    int? pageSize,
    String? pageToken,
  }) async {
    final request = ApiRequest<GoogleSdmListRoomsResponse>(
      RequestType.get,
      "structures/{structureId}/rooms",
      pathParams: {"structureId": structureId},
      queryParams: {
        if (pageSize != null) 'pageSize': pageSize,
        if (pageToken != null) 'pageToken': pageToken,
      },
      responseParser: (responseData) => GoogleSdmListRoomsResponse.fromJson(responseData),
    );
    return processApiRequest(request);
  }
}
