// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceDetailListModel _$DeviceDetailListModelFromJson(
        Map<String, dynamic> json) =>
    DeviceDetailListModel(
      metaData: json['metaData'] == null
          ? null
          : MetaData.fromJson(json['metaData'] as Map<String, dynamic>),
      eDevice: (json['eDevice'] as List<dynamic>?)
              ?.map(
                  (e) => DeviceDetailModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$DeviceDetailListModelToJson(
    DeviceDetailListModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('metaData', instance.metaData?.toJson());
  val['eDevice'] = instance.eDevice.map((e) => e.toJson()).toList();
  return val;
}

DeviceDetailModel _$DeviceDetailModelFromJson(Map<String, dynamic> json) =>
    DeviceDetailModel(
      id: json['_id'] as String,
      imei: json['imei'] as String? ?? "",
      userId: json['userId'] as String? ?? "",
      deviceName: json['deviceName'] as String? ?? "",
      lowFuel: json['lowFuel'] as bool? ?? false,
      tirePressureLow: json['tirePressureLow'] as bool? ?? false,
      carBatteryLow: json['carBatteryLow'] as bool? ?? false,
      reachMaxSpeed: json['reachMaxSpeed'] as bool? ?? false,
      reachZone: json['reachZone'] as bool? ?? false,
      sharedUser: (json['sharedUser'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      data: json['data'] as String? ?? "",
      location: json['location'] as List<dynamic>? ?? const [],
    );

Map<String, dynamic> _$DeviceDetailModelToJson(DeviceDetailModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'imei': instance.imei,
      'userId': instance.userId,
      'deviceName': instance.deviceName,
      'lowFuel': instance.lowFuel,
      'tirePressureLow': instance.tirePressureLow,
      'carBatteryLow': instance.carBatteryLow,
      'reachMaxSpeed': instance.reachMaxSpeed,
      'reachZone': instance.reachZone,
      'sharedUser': instance.sharedUser,
      'data': instance.data,
      'location': instance.location,
    };

Records _$RecordsFromJson(Map<String, dynamic> json) => Records(
      timestamp: parseUtcDateTimeToLocal(json['timestamp'] as String),
      priority: json['priority'] as int? ?? 0,
      gps: json['gps'] == null
          ? const Gps()
          : Gps.fromJson(json['gps'] as Map<String, dynamic>),
      eventId: json['eventId'] as int? ?? 0,
      propertiesCount: json['propertiesCount'] as int? ?? 0,
      ioElements: (json['ioElements'] as List<dynamic>?)
              ?.map((e) => IoElements.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$RecordsToJson(Records instance) => <String, dynamic>{
      'timestamp': instance.timestamp.toIso8601String(),
      'priority': instance.priority,
      'gps': instance.gps.toJson(),
      'eventId': instance.eventId,
      'propertiesCount': instance.propertiesCount,
      'ioElements': instance.ioElements.map((e) => e.toJson()).toList(),
    };

Gps _$GpsFromJson(Map<String, dynamic> json) => Gps(
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0.0,
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0.0,
      altitude: json['altitude'] as int? ?? 0,
      angle: json['angle'] as int? ?? 0,
      satellites: json['satellites'] as int? ?? 0,
      speed: json['speed'] as int? ?? 0,
    );

Map<String, dynamic> _$GpsToJson(Gps instance) => <String, dynamic>{
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'altitude': instance.altitude,
      'angle': instance.angle,
      'satellites': instance.satellites,
      'speed': instance.speed,
    };

IoElements _$IoElementsFromJson(Map<String, dynamic> json) => IoElements(
      id: json['id'] as int? ?? 0,
      value: json['value'] as int? ?? 0,
      label: json['label'] as String? ?? "",
      valueHuman: json['valueHuman'] as String? ?? "",
    );

Map<String, dynamic> _$IoElementsToJson(IoElements instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'label': instance.label,
      'valueHuman': instance.valueHuman,
    };

CRC _$CRCFromJson(Map<String, dynamic> json) => CRC(
      i0: json['i0'] as int? ?? 0,
      i1: json['i1'] as int? ?? 0,
      i2: json['i2'] as int? ?? 0,
      i3: json['i3'] as int? ?? 0,
    );

Map<String, dynamic> _$CRCToJson(CRC instance) => <String, dynamic>{
      'i0': instance.i0,
      'i1': instance.i1,
      'i2': instance.i2,
      'i3': instance.i3,
    };

DeviceDetail _$DeviceDetailFromJson(Map<String, dynamic> json) => DeviceDetail(
      id: json['_id'] as String,
      imei: json['imei'] as String? ?? "",
      data: Records.fromJson(json['data'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$DeviceDetailToJson(DeviceDetail instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'imei': instance.imei,
      'data': instance.data.toJson(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

TrackingHistoryDetail _$TrackingHistoryDetailFromJson(
        Map<String, dynamic> json) =>
    TrackingHistoryDetail(
      metaData: json['metaData'] == null
          ? null
          : MetaData.fromJson(json['metaData'] as Map<String, dynamic>),
      trackingHistory: (json['trackingHistory'] as List<dynamic>?)
              ?.map((e) => DeviceDetail.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$TrackingHistoryDetailToJson(
    TrackingHistoryDetail instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('metaData', instance.metaData?.toJson());
  val['trackingHistory'] =
      instance.trackingHistory.map((e) => e.toJson()).toList();
  return val;
}

MetaData _$MetaDataFromJson(Map<String, dynamic> json) => MetaData(
      page: json['page'] as int? ?? 0,
      limit: json['limit'] as int? ?? 0,
      total: json['total'] as int? ?? 0,
    );

Map<String, dynamic> _$MetaDataToJson(MetaData instance) => <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'total': instance.total,
    };

Point _$PointFromJson(Map<String, dynamic> json) => Point(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$PointToJson(Point instance) => <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

RoutesHistoryInfo _$RoutesHistoryInfoFromJson(Map<String, dynamic> json) =>
    RoutesHistoryInfo(
      timestamp: DateTime.parse(json['timestamp'] as String),
      totalKms: (json['totalKms'] as num).toDouble(),
      averageSpeed: (json['averageSpeed'] as num).toDouble(),
      maxSpeed: json['maxSpeed'] as int,
      latLngList: (json['latLngList'] as List<dynamic>?)
              ?.map((e) => Point.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$RoutesHistoryInfoToJson(RoutesHistoryInfo instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp.toIso8601String(),
      'totalKms': instance.totalKms,
      'averageSpeed': instance.averageSpeed,
      'maxSpeed': instance.maxSpeed,
      'latLngList': instance.latLngList.map((e) => e.toJson()).toList(),
    };

QrViewCode _$QrViewCodeFromJson(Map<String, dynamic> json) => QrViewCode(
      imei: json['imei'] as String,
      userId: json['userId'] as String,
      deviceName: json['deviceName'] as String,
      vinNumber: json['vinNumber'] as String,
    );

Map<String, dynamic> _$QrViewCodeToJson(QrViewCode instance) =>
    <String, dynamic>{
      'imei': instance.imei,
      'userId': instance.userId,
      'deviceName': instance.deviceName,
      'vinNumber': instance.vinNumber,
    };

LocationPoint _$LocationPointFromJson(Map<String, dynamic> json) =>
    LocationPoint(
      long: (json['long'] as num).toDouble(),
      lat: (json['lat'] as num).toDouble(),
    );

Map<String, dynamic> _$LocationPointToJson(LocationPoint instance) =>
    <String, dynamic>{
      'long': instance.long,
      'lat': instance.lat,
    };

ZoneSelection _$ZoneSelectionFromJson(Map<String, dynamic> json) =>
    ZoneSelection(
      imei: json['imei'] as String? ?? "",
      deviceName: json['deviceName'] as String? ?? "",
      zone: json['zone'] as String? ?? "",
      speed: json['speed'] as int? ?? 70,
      radius: json['radius'] as int? ?? 1,
      location: json['location'] == null
          ? null
          : LocationPoint.fromJson(json['location'] as Map<String, dynamic>),
      locationList: json['locationList'] as List<dynamic>? ?? const [],
    );

Map<String, dynamic> _$ZoneSelectionToJson(ZoneSelection instance) {
  final val = <String, dynamic>{
    'imei': instance.imei,
    'deviceName': instance.deviceName,
    'zone': instance.zone,
    'speed': instance.speed,
    'radius': instance.radius,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('location', instance.location?.toJson());
  val['locationList'] = instance.locationList;
  return val;
}
