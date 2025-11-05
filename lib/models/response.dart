class Response<T> {
  final String status;
  final String message;
  final T data;

  Response({required this.status, required this.message, required this.data});

  factory Response.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json) fromJsonT,
      ) {
    return Response(
      status: json['status'] ?? "",
      message: json['message'] ?? "",
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) {
    return {'result': status, 'message': message, 'data': toJsonT(data)};
  }
}