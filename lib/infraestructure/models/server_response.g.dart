// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServerResponse _$ServerResponseFromJson(Map<String, dynamic> json) =>
    ServerResponse(
      message: json['message'] as String?,
      result: json['result'],
      data: json['data'] as bool?,
      isSuccess: json['is_success'] as bool,
      statusCode: (json['status_code'] as num).toInt(),
    );

Map<String, dynamic> _$ServerResponseToJson(ServerResponse instance) =>
    <String, dynamic>{
      'is_success': instance.isSuccess,
      'result': instance.result,
      'message': instance.message,
      'status_code': instance.statusCode,
      'data': instance.data,
    };
