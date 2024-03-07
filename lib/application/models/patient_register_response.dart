class PatientRegisterRequest {
    String name;
    String executive;
    String address;
    String phone;
    String location;
    String branch;
    String treatments;
    int totalAmount;
    int discountAmount;
    String payment;
    double advanceAmount;
    double balanceAmount;
    String male;
    String female;
    String dateNdTime;

    PatientRegisterRequest({
        required this.name,
        required this.executive,
        required this.address,
        required this.phone,
        required this.location,
        required this.branch,
        required this.treatments,
        required this.totalAmount,
        required this.discountAmount,
        required this.payment,
        required this.advanceAmount,
        required this.balanceAmount,
        required this.male,
        required this.female,
        required this.dateNdTime,
    });

    factory PatientRegisterRequest.fromJson(Map<String, dynamic> json) => PatientRegisterRequest(
        name: json["name"],
        executive: json["executive"],
        address: json["address"],
        phone: json["phone"],
        location: json["location"],
        branch: json["branch"],
        treatments: json["treatments"],
        totalAmount: json["total_amount"],
        discountAmount: json["discount_amount"],
        payment: json["payment"],
        advanceAmount: json["advance_amount"]?.toDouble(),
        balanceAmount: json["balance_amount"]?.toDouble(),
        male: json["male"],
        female: json["female"],
        dateNdTime: json["date_nd_time"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "executive": executive,
        "address": address,
        "phone": phone,
        "location": location,
        "branch": branch,
        "treatments": treatments,
        "total_amount": totalAmount,
        "discount_amount": discountAmount,
        "payment": payment,
        "advance_amount": advanceAmount,
        "balance_amount": balanceAmount,
        "male": male,
        "female": female,
        "date_nd_time": dateNdTime,
    };

    Map<String, dynamic> toMap() {
        return {
            "name": name,
            "executive": executive,
            "address": address,
            "phone": phone,
            "location": location,
            "branch": branch,
            "treatments": treatments,
            "total_amount": totalAmount,
            "discount_amount": discountAmount,
            "payment": payment,
            "advance_amount": advanceAmount,
            "balance_amount": balanceAmount,
            "male": male,
            "female": female,
            "date_nd_time": dateNdTime,
        };
    }
}
