import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'live_chat_model.g.dart';

@JsonSerializable()
class MessageModel extends Equatable{
  final String id;
  final String mId;
  final String message;
  final String senderId;
  final String receiverId;
  final String chatId;
  final int msgType;
  final int convType;
  final int readStatus;
  final int deletedStatus;
  final int isSelected;
  final int isEdited;
  final int senderType;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? userName;
  final String? userPhoto;

  const MessageModel({
    required this.id,
    required this.mId,
    required this.message,
    required this.senderId,
    required this.receiverId,
    required this.chatId,
    required this.msgType,
    required this.convType,
    required this.senderType,
    this.readStatus = 0,
    this.deletedStatus = 0,
    this.isSelected = 0,
    this.isEdited = 0,
    this.createdAt,
    this.updatedAt,
    this.userName = "",
    this.userPhoto = "",
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => _$MessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessageModelToJson(this);

  MessageModel copyWith({
    String? id,
    String? mId,
    String? message,
    String? senderId,
    String? receiverId,
    String? chatId,
    int? msgType,
    int? convType,
    int? readStatus,
    int? deletedStatus,
    int? isSelected,
    int? isEdited,
    int? senderType,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? userName,
    String? userPhoto,
  }) {
    return MessageModel(
      id: id ?? this.id,
      mId: mId ?? this.mId,
      message: message ?? this.message,
      senderId: senderId ?? this.senderId,
      receiverId: receiverId ?? this.receiverId,
      chatId: chatId ?? this.chatId,
      msgType: msgType ?? this.msgType,
      convType: convType ?? this.convType,
      readStatus: readStatus ?? this.readStatus,
      deletedStatus: deletedStatus ?? this.deletedStatus,
      isSelected: isSelected ?? this.isSelected,
      isEdited: isEdited ?? this.isEdited,
      senderType: senderType ?? this.senderType,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      userName: userName ?? this.userName,
      userPhoto: userPhoto ?? this.userPhoto,
    );
  }

  @override
  List<Object?> get props =>[
    id,
    mId,
    message,
    senderId,
    receiverId,
    chatId,
    msgType,
    convType,
    readStatus,
    deletedStatus,
    isSelected,
    isEdited,
    createdAt,
    updatedAt,
    userName,
    userPhoto,
    senderType,
  ];
}