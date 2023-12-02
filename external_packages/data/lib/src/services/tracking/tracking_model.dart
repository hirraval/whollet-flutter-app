import 'package:data/data.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tracking_model.g.dart';

@JsonSerializable()
class DeviceDetailListModel extends Equatable {
  final MetaData? metaData;
  final List<DeviceDetailModel> eDevice;

  const DeviceDetailListModel({
    this.metaData,
    this.eDevice = const [],
  });

  factory DeviceDetailListModel.fromJson(Map<String, dynamic> json) => _$DeviceDetailListModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceDetailListModelToJson(this);

  DeviceDetailListModel copyWith({
    MetaData? metaData,
    List<DeviceDetailModel>? eDevice,
  }) {
    return DeviceDetailListModel(
      metaData: metaData ?? this.metaData,
      eDevice: eDevice ?? this.eDevice,
    );
  }

  @override
  List<Object?> get props => [metaData, eDevice];
}

@JsonSerializable()
class DeviceDetailModel extends NetworkResourceId {
  final String imei;
  final String userId;
  final String deviceName;
  final bool lowFuel;
  final bool tirePressureLow;
  final bool carBatteryLow;
  final bool reachMaxSpeed;
  final bool reachZone;
  final List<String> sharedUser;
  final String data;
  final List<dynamic> location;

  const DeviceDetailModel({
    required super.id,
    this.imei = "",
    this.userId = "",
    this.deviceName = "",
    this.lowFuel = false,
    this.tirePressureLow = false,
    this.carBatteryLow = false,
    this.reachMaxSpeed = false,
    this.reachZone = false,
    this.sharedUser = const [],
    this.data = "",
    this.location = const [],
  });

  factory DeviceDetailModel.fromJson(Map<String, dynamic> json) => _$DeviceDetailModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DeviceDetailModelToJson(this);

  @override
  List<Object> get props => [
        id,
        imei,
        userId,
        deviceName,
        lowFuel,
        tirePressureLow,
        carBatteryLow,
        reachMaxSpeed,
        reachZone,
        sharedUser,
        data,
        location,
      ];

  DeviceDetailModel copyWith({
    String? id,
    String? imei,
    String? userId,
    String? deviceName,
    bool? lowFuel,
    bool? tirePressureLow,
    bool? carBatteryLow,
    bool? reachMaxSpeed,
    bool? reachZone,
    List<String>? sharedUser,
    String? data,
    List<dynamic>? location,
  }) {
    return DeviceDetailModel(
      id: id ?? this.id,
      imei: imei ?? this.imei,
      userId: userId ?? this.userId,
      deviceName: deviceName ?? this.deviceName,
      lowFuel: lowFuel ?? this.lowFuel,
      tirePressureLow: tirePressureLow ?? this.tirePressureLow,
      carBatteryLow: carBatteryLow ?? this.carBatteryLow,
      reachMaxSpeed: reachMaxSpeed ?? this.reachMaxSpeed,
      reachZone: reachZone ?? this.reachZone,
      sharedUser: sharedUser ?? this.sharedUser,
      data: data ?? this.data,
      location: location ?? this.location,
    );
  }
}

@JsonSerializable()
class Records extends Equatable {
  @JsonKey(fromJson: parseUtcDateTimeToLocal)
  final DateTime timestamp;
  final int priority;
  final Gps gps;
  final int eventId;
  final int propertiesCount;

  final List<IoElements> ioElements;

  const Records({
    required this.timestamp,
    this.priority = 0,
    this.gps = const Gps(),
    this.eventId = 0,
    this.propertiesCount = 0,
    this.ioElements = const [],
  });

  factory Records.fromJson(Map<String, dynamic> json) => _$RecordsFromJson(json);

  Map<String, dynamic> toJson() => _$RecordsToJson(this);

  @override
  List<Object?> get props => [timestamp, priority, gps, eventId, propertiesCount, ioElements];

  Records copyWith({
    DateTime? timestamp,
    int? priority,
    Gps? gps,
    int? eventId,
    int? propertiesCount,
    List<IoElements>? ioElements,
  }) {
    return Records(
      timestamp: timestamp ?? this.timestamp,
      priority: priority ?? this.priority,
      gps: gps ?? this.gps,
      eventId: eventId ?? this.eventId,
      propertiesCount: propertiesCount ?? this.propertiesCount,
      ioElements: ioElements ?? this.ioElements,
    );
  }
}

@JsonSerializable()
class Gps extends Equatable {
  final double longitude;
  final double latitude;
  final int altitude;
  final int angle;
  final int satellites;
  final int speed;

  const Gps({
    this.longitude = 0.0,
    this.latitude = 0.0,
    this.altitude = 0,
    this.angle = 0,
    this.satellites = 0,
    this.speed = 0,
  });

  factory Gps.fromJson(Map<String, dynamic> json) => _$GpsFromJson(json);

  Map<String, dynamic> toJson() => _$GpsToJson(this);

  @override
  List<Object?> get props => [longitude, latitude, altitude, angle, satellites, speed];

  Gps copyWith({
    double? longitude,
    double? latitude,
    int? altitude,
    int? angle,
    int? satellites,
    int? speed,
  }) {
    return Gps(
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      altitude: altitude ?? this.altitude,
      angle: angle ?? this.angle,
      satellites: satellites ?? this.satellites,
      speed: speed ?? this.speed,
    );
  }
}

@JsonSerializable()
class IoElements extends Equatable {
  final int id;
  final int value;
  final String label;
  final String valueHuman;

  const IoElements({
    this.id = 0,
    this.value = 0,
    this.label = "",
    this.valueHuman = "",
  });

  factory IoElements.fromJson(Map<String, dynamic> json) => _$IoElementsFromJson(json);

  Map<String, dynamic> toJson() => _$IoElementsToJson(this);

  @override
  List<Object?> get props => [id, value, label, valueHuman];

  IoElements copyWith({
    int? id,
    int? value,
    String? label,
    String? valueHuman,
  }) {
    return IoElements(
      id: id ?? this.id,
      value: value ?? this.value,
      label: label ?? this.label,
      valueHuman: valueHuman ?? this.valueHuman,
    );
  }
}

@JsonSerializable()
class CRC extends Equatable {
  final int i0;
  final int i1;
  final int i2;
  final int i3;

  const CRC({
    this.i0 = 0,
    this.i1 = 0,
    this.i2 = 0,
    this.i3 = 0,
  });

  factory CRC.fromJson(Map<String, dynamic> json) => _$CRCFromJson(json);

  Map<String, dynamic> toJson() => _$CRCToJson(this);

  @override
  List<Object?> get props => [i0, i1, i2, i3];

  CRC copyWith({
    int? i0,
    int? i1,
    int? i2,
    int? i3,
  }) {
    return CRC(
      i0: i0 ?? this.i0,
      i1: i1 ?? this.i1,
      i2: i2 ?? this.i2,
      i3: i3 ?? this.i3,
    );
  }
}

@JsonSerializable()
class DeviceDetail extends NetworkResourceId {
  final String imei;
  final Records data;
  final DateTime createdAt;
  final DateTime updatedAt;

  const DeviceDetail({
    required super.id,
    this.imei = "",
    required this.data,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DeviceDetail.fromJson(Map<String, dynamic> json) => _$DeviceDetailFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DeviceDetailToJson(this);

  @override
  List<Object?> get props => [id, imei, data, createdAt, updatedAt];

  DeviceDetail copyWith({
    String? imei,
    Records? data,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return DeviceDetail(
      id: id,
      imei: imei ?? this.imei,
      data: data ?? this.data,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

@JsonSerializable()
class TrackingHistoryDetail extends Equatable {
  final MetaData? metaData;
  final List<DeviceDetail> trackingHistory;

  const TrackingHistoryDetail({
    this.metaData,
    this.trackingHistory = const [],
  });

  factory TrackingHistoryDetail.fromJson(Map<String, dynamic> json) => _$TrackingHistoryDetailFromJson(json);

  Map<String, dynamic> toJson() => _$TrackingHistoryDetailToJson(this);

  TrackingHistoryDetail copyWith({
    MetaData? metaData,
    List<DeviceDetail>? trackingHistory,
  }) {
    return TrackingHistoryDetail(
      metaData: metaData ?? this.metaData,
      trackingHistory: trackingHistory ?? this.trackingHistory,
    );
  }

  @override
  List<Object?> get props => [metaData, trackingHistory];
}

@JsonSerializable()
class MetaData extends Equatable {
  final int page;
  final int limit;
  final int total;

  const MetaData({
    this.page = 0,
    this.limit = 0,
    this.total = 0,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) => _$MetaDataFromJson(json);

  Map<String, dynamic> toJson() => _$MetaDataToJson(this);

  @override
  List<Object?> get props => [page, limit, total];

  MetaData copyWith({
    int? page,
    int? limit,
    int? total,
  }) {
    return MetaData(
      page: page ?? this.page,
      limit: limit ?? this.limit,
      total: total ?? this.total,
    );
  }
}

@JsonSerializable()
class Point {
  final double latitude;
  final double longitude;

  Point({
    required this.latitude,
    required this.longitude,
  });

  factory Point.fromJson(Map<String, dynamic> json) => _$PointFromJson(json);

  Map<String, dynamic> toJson() => _$PointToJson(this);
}

@JsonSerializable()
class RoutesHistoryInfo extends Equatable {
  final DateTime timestamp;
  final double totalKms;
  final double averageSpeed;
  final int maxSpeed;
  final List<Point> latLngList;

  @override
  List<Object?> get props => [
        timestamp,
        totalKms,
        averageSpeed,
        maxSpeed,
        latLngList,
      ];

  const RoutesHistoryInfo({
    required this.timestamp,
    required this.totalKms,
    required this.averageSpeed,
    required this.maxSpeed,
    this.latLngList = const [],
  });

  factory RoutesHistoryInfo.fromJson(Map<String, dynamic> json) => _$RoutesHistoryInfoFromJson(json);

  Map<String, dynamic> toJson() => _$RoutesHistoryInfoToJson(this);

  RoutesHistoryInfo copyWith({
    DateTime? timestamp,
    double? totalKms,
    double? averageSpeed,
    int? maxSpeed,
    List<Point>? latLngList,
  }) {
    return RoutesHistoryInfo(
      timestamp: timestamp ?? this.timestamp,
      totalKms: totalKms ?? this.totalKms,
      averageSpeed: averageSpeed ?? this.averageSpeed,
      maxSpeed: maxSpeed ?? this.maxSpeed,
      latLngList: latLngList ?? this.latLngList,
    );
  }
}

@JsonSerializable()
class QrViewCode extends Equatable {
  final String imei;
  final String userId;
  final String deviceName;
  final String vinNumber;

  const QrViewCode({
    required this.imei,
    required this.userId,
    required this.deviceName,
    required this.vinNumber,
  });

  factory QrViewCode.fromJson(Map<String, dynamic> json) => _$QrViewCodeFromJson(json);

  Map<String, dynamic> toJson() => _$QrViewCodeToJson(this);

  @override
  List<Object?> get props => [imei, userId, deviceName, vinNumber];

  QrViewCode copyWith({
    String? imei,
    String? userId,
    String? deviceName,
    String? vinNumber,
  }) {
    return QrViewCode(
      imei: imei ?? this.imei,
      userId: userId ?? this.userId,
      deviceName: deviceName ?? this.deviceName,
      vinNumber: vinNumber ?? this.vinNumber,
    );
  }
}

@JsonSerializable()
class LocationPoint {
  final double long;
  final double lat;

  LocationPoint({
    required this.long,
    required this.lat,
  });

  factory LocationPoint.fromJson(Map<String, dynamic> json) => _$LocationPointFromJson(json);

  Map<String, dynamic> toJson() => _$LocationPointToJson(this);

  LocationPoint copyWith({
    double? lat,
    double? long,
  }) {
    return LocationPoint(
      lat: lat ?? this.lat,
      long: long ?? this.long,
    );
  }
}

@JsonSerializable()
class ZoneSelection extends Equatable {
  final String imei;
  final String deviceName;
  final String zone;
  final int speed;
  final int radius;
  final LocationPoint? location;
  final List<dynamic> locationList;

  const ZoneSelection({
    this.imei = "",
    this.deviceName = "",
    this.zone = "",
    this.speed = 70,
    this.radius = 1,
    this.location,
    this.locationList = const [],
  });

  factory ZoneSelection.fromJson(Map<String, dynamic> json) => _$ZoneSelectionFromJson(json);

  Map<String, dynamic> toJson() => _$ZoneSelectionToJson(this);

  @override
  List<Object?> get props => [
        imei,
        zone,
        deviceName,
        speed,
        radius,
        location,
        locationList,
      ];

  ZoneSelection copyWith({
    String? imei,
    String? deviceName,
    String? zone,
    int? speed,
    int? radius,
    LocationPoint? location,
    List<dynamic>? locationList,
  }) {
    return ZoneSelection(
      imei: imei ?? this.imei,
      deviceName: deviceName ?? this.deviceName,
      zone: zone ?? this.zone,
      speed: speed ?? this.speed,
      radius: radius ?? this.radius,
      location: location ?? this.location,
      locationList: locationList ?? this.locationList,
    );
  }
}
