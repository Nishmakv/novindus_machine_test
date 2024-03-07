// To parse this JSON data, do
//
//     final getBranch = getBranchFromJson(jsonString);

import 'dart:convert';

List<GetBranch> getBranchFromJson(String str) => List<GetBranch>.from(json.decode(str).map((x) => GetBranch.fromJson(x)));

String getBranchToJson(List<GetBranch> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetBranch {
    int id;
    String name;
    int patientsCount;
    String location;
    String phone;
    String mail;
    String address;
    String gst;
    bool isActive;

    GetBranch({
        required this.id,
        required this.name,
        required this.patientsCount,
        required this.location,
        required this.phone,
        required this.mail,
        required this.address,
        required this.gst,
        required this.isActive,
    });

    factory GetBranch.fromJson(Map<String, dynamic> json) => GetBranch(
        id: json["id"],
        name: json["name"],
        patientsCount: json["patients_count"],
        location: json["location"],
        phone: json["phone"],
        mail: json["mail"],
        address: json["address"],
        gst: json["gst"],
        isActive: json["is_active"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "patients_count": patientsCount,
        "location": location,
        "phone": phone,
        "mail": mail,
        "address": address,
        "gst": gst,
        "is_active": isActive,
    };
}
