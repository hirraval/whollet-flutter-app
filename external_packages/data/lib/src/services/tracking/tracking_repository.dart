import 'package:data/data.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class TrackingRepository extends BaseRepository {
  TrackingRepository({required super.dio});

  Stream<DataEvent<DeviceDetailListModel>> getTrackingDeviceList({int page = 1}) async* {
    final request = ApiRequest<DeviceDetailListModel>(RequestType.get, "user/listExternalDevice")
      ..queryParams = {"page": page}
      ..responseParser = (value) => DeviceDetailListModel.fromJson(value);
    yield* processApi(request);
  }

  Stream<DataEvent<TrackingHistoryDetail>> getTrackingDeviceDetail({String? imeiId, int page = 1}) async* {
    final request = ApiRequest<TrackingHistoryDetail>(RequestType.get, "user/trackingHistory")
      ..queryParams = {'imei': imeiId, "page": page}
      ..responseParser = (value) => TrackingHistoryDetail.fromJson(value);
    yield* processApi(request);
  }

  Stream<DataEvent<TrackingHistoryDetail>> getTrackingFilterDeviceDetail({
    String? imeiId,
    int page = 1,
    String? fromDate,
    String? toDate,
  }) async* {
    final request = ApiRequest<TrackingHistoryDetail>(RequestType.get, "user/trackingHistory")
      ..queryParams = {'imei': imeiId, "page": page, "fromDate": fromDate, "toDate": toDate}
      ..responseParser = (value) => TrackingHistoryDetail.fromJson(value);
    yield* processApi(request);
  }

  Stream<DataEvent<dynamic>> addTrackingDevice({
    ZoneSelection? zoneSelection,
  }) async* {
    Map<String, dynamic> map = {
      "imeiId": zoneSelection?.imei,
      "deviceName": zoneSelection?.deviceName,
      "zone": zoneSelection?.zone,
      "speed": zoneSelection?.speed,
    };
    if (zoneSelection?.zone == "Circle") {
      map["radius"] = zoneSelection?.radius;
      map["location"] = zoneSelection?.location;
    } else {
      map["location"] = zoneSelection?.locationList;
    }
    final request = ApiRequest<dynamic>(RequestType.post, "user/addExternalDevice")..data = map;
    yield* processApi(request);
  }
}
