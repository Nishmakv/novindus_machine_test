// To parse this JSON data, do
//
//     final BranchResponse = BranchResponseFromJson(jsonString);

import 'dart:convert';

List<BranchResponse> BranchResponseFromJson(String str) => List<BranchResponse>.from(json.decode(str).map((x) => BranchResponse.fromJson(x)));

String BranchResponseToJson(List<BranchResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BranchResponse {
    int id;
    String name;
    int patientsCount;
    String location;
    String phone;
    String mail;
    String address;
    String gst;
    bool isActive;

    BranchResponse({
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

    factory BranchResponse.fromJson(Map<String, dynamic> json) => BranchResponse(
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
