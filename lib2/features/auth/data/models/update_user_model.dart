

class UpdateUserModel {
  bool? status;
  String? message;
  DataUpdate? data;

  UpdateUserModel({
    this.status,
    this.message,
    this.data,
  });

  factory UpdateUserModel.fromJson(Map<String, dynamic> json) => UpdateUserModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : DataUpdate.fromJson(json["data"]),
  );


}

class DataUpdate {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;

  DataUpdate({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.points,
    this.credit,
    this.token,
  });

  factory DataUpdate.fromJson(Map<String, dynamic> json) => DataUpdate(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    image: json["image"],
    points: json["points"],
    credit: json["credit"],
    token: json["token"],
  );

}
