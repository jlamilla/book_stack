class ServerResponse {
  bool isSuccess;
  dynamic result;
  String? message;
  int statusCode;
  bool? data;

  ServerResponse({
    this.message,
    this.result,
    this.data,
    required this.isSuccess,
    required this.statusCode,
  });

  dynamic get response {
    return result;
  }

  Map<String, dynamic> toJson() => {
        "is_success": isSuccess,
        "result": response,
        "message": message,
        "status_code": statusCode,
        "data": data
      };

  factory ServerResponse.fromJson(Map<String, dynamic> json) => ServerResponse(
        isSuccess: json["is_success"],
        result: json["result"],
        message: json["message"],
        statusCode: json["status_code"],
        data: json["data"],
      );

  @override
  String toString() {
    return 'ServerResponse(isSuccess: $isSuccess, result: $result, message: $message, statusCode: $statusCode, data: $data)';
  }
}
