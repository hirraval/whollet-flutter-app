// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) => MessageModel(
      id: json['id'] as String,
      mId: json['mId'] as String,
      message: json['message'] as String,
      senderId: json['senderId'] as String,
      receiverId: json['receiverId'] as String,
      chatId: json['chatId'] as String,
      msgType: json['msgType'] as int,
      convType: json['convType'] as int,
      senderType: json['senderType'] as int,
      readStatus: json['readStatus'] as int? ?? 0,
      deletedStatus: json['deletedStatus'] as int? ?? 0,
      isSelected: json['isSelected'] as int? ?? 0,
      isEdited: json['isEdited'] as int? ?? 0,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      userName: json['userName'] as String? ?? "",
      userPhoto: json['userPhoto'] as String? ?? "",
    );

Map<String, dynamic> _$MessageModelToJson(MessageModel instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'mId': instance.mId,
    'message': instance.message,
    'senderId': instance.senderId,
    'receiverId': instance.receiverId,
    'chatId': instance.chatId,
    'msgType': instance.msgType,
    'convType': instance.convType,
    'readStatus': instance.readStatus,
    'deletedStatus': instance.deletedStatus,
    'isSelected': instance.isSelected,
    'isEdited': instance.isEdited,
    'senderType': instance.senderType,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  writeNotNull('updatedAt', instance.updatedAt?.toIso8601String());
  writeNotNull('userName', instance.userName);
  writeNotNull('userPhoto', instance.userPhoto);
  return val;
}
