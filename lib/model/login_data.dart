

class UserData {
  UserData({
      this.username, 
      this.password, 
      this.devid, 
      this.deviceType,});

  UserData.fromJson(dynamic json) {
    username = json['username'];
    password = json['password'];
    devid = json['devid'];
    deviceType = json['deviceType'];
  }
  String? username;
  String? password;
  String? devid;
  String? deviceType;
UserData copyWith({  String? username,
  String? password,
  String? devid,
  String? deviceType,
}) => UserData(  username: username ?? this.username,
  password: password ?? this.password,
  devid: devid ?? this.devid,
  deviceType: deviceType ?? this.deviceType,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = username;
    map['password'] = password;
    map['devid'] = devid;
    map['deviceType'] = deviceType;
    return map;
  }

}