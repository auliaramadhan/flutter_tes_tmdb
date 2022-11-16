/// guid : 0
/// code : 34
/// info : "Invalid username."
/// data : null

class GeneralRequest {
  GeneralRequest({
    this.guid,
    this.code,
    this.info,
    this.data,
    this.statusCode,
    this.statusMessage,
  });

  GeneralRequest.fromJson(dynamic json) {
    guid = json['guid'];
    code = json['code'];
    info = json['info'];
    data = json['data'];
    statusCode = json['statusCode'];
    statusMessage = json['statusMessage'];
  }
  String? guid;
  String? code;
  String? info;
  dynamic data;
  String? statusCode;
  String? statusMessage;
  GeneralRequest copyWith({
    String? guid,
    String? code,
    String? info,
    String? statusCode,
    String? statusMessage,
    dynamic data,
  }) =>
      GeneralRequest(
        guid: guid ?? this.guid,
        code: code ?? this.code,
        info: info ?? this.info,
        data: data ?? this.data,
        statusCode:statusCode ?? this.statusCode,
        statusMessage:statusMessage ?? this.statusMessage,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['guid'] = guid;
    map['code'] = code;
    map['info'] = info;
    map['data'] = data;
    map['statusCode'] = statusCode;
    map['statusMessage'] = statusMessage;
    return map;
  }
}
