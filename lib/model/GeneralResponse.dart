/// guid : 0
/// code : 34
/// info : "Invalid username."
/// data : null

class GeneralResponse {
  GeneralResponse({
      this.guid, 
      this.code, 
      this.info, 
      this.data,});

  GeneralResponse.fromJson(dynamic json) {
    guid = json['guid'];
    code = json['code'];
    info = json['info'];
    data = json['data'];
  }
  num? guid;
  num? code;
  String? info;
  dynamic data;
GeneralResponse copyWith({  num? guid,
  num? code,
  String? info,
  dynamic data,
}) => GeneralResponse(  guid: guid ?? this.guid,
  code: code ?? this.code,
  info: info ?? this.info,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['guid'] = guid;
    map['code'] = code;
    map['info'] = info;
    map['data'] = data;
    return map;
  }

}