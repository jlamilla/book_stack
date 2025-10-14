import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'server_response.g.dart';

@JsonSerializable()
class ServerResponse extends Equatable {
  const ServerResponse({
    this.message,
    this.result,
    this.data,
    required this.isSuccess,
    required this.statusCode,
  });

  factory ServerResponse.fromJson(Map<String, dynamic> json) => _$ServerResponseFromJson(json);

  @JsonKey(name: 'is_success')
  final bool isSuccess;
  @JsonKey(name: 'result')
  final dynamic result;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'status_code')
  final int statusCode;
  @JsonKey(name: 'data')
  final bool? data;

  dynamic get response => result;

  Map<String, dynamic> toJson() => _$ServerResponseToJson(this);

  @override
  List<Object?> get props => <Object?>[
    isSuccess,
    result,
    message,
    statusCode,
    data,
  ];
}
