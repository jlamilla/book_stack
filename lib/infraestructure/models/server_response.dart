class ServerResponse {
  ServerResponse({
    this.message,
    this.result,
    this.data,
    required this.isSuccess,
    required this.statusCode,
  });

  factory ServerResponse.fromJson(Map<String, dynamic> json) => ServerResponse(
        isSuccess: json['is_success'],
        result: json['result'],
        message: json['message'],
        statusCode: json['status_code'],
        data: json['data'],
      );

  bool isSuccess;
  dynamic result;
  String? message;
  int statusCode;
  bool? data;
  dynamic get response {
    return result;
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'is_success': isSuccess,
        'result': response,
        'message': message,
        'status_code': statusCode,
        'data': data
      };
}
