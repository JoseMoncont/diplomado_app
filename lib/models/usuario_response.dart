// To parse this JSON data, do
//
//     final usuarioResponse = usuarioResponseFromJson(jsonString);

import 'dart:convert';

List<UsuarioResponse> usuarioResponseFromJson(String str) =>
    List<UsuarioResponse>.from(
        json.decode(str).map((x) => UsuarioResponse.fromJson(x)));

String usuarioResponseToJson(List<UsuarioResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UsuarioResponse {
  int? id;
  String? uid;
  String? password;
  String? firstName;
  String? lastName;
  String? username;
  String? email;
  String? avatar;
  String? gender;
  String? phoneNumber;
  String? socialInsuranceNumber;
  DateTime? dateOfBirth;
  Employment? employment;
  Address? address;
  CreditCard? creditCard;
  Subscription? subscription;

  UsuarioResponse({
    this.id,
    this.uid,
    this.password,
    this.firstName,
    this.lastName,
    this.username,
    this.email,
    this.avatar,
    this.gender,
    this.phoneNumber,
    this.socialInsuranceNumber,
    this.dateOfBirth,
    this.employment,
    this.address,
    this.creditCard,
    this.subscription,
  });

  factory UsuarioResponse.fromJson(String str) =>
      UsuarioResponse.fromMap(json.decode(str));

  factory UsuarioResponse.fromMap(Map<String, dynamic> json) => UsuarioResponse(
        id: json["id"],
        uid: json["uid"],
        password: json["password"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        username: json["username"],
        email: json["email"],
        avatar: json["avatar"],
        gender: json["gender"],
        phoneNumber: json["phone_number"],
        socialInsuranceNumber: json["social_insurance_number"],
        dateOfBirth: json["date_of_birth"] == null
            ? null
            : DateTime.parse(json["date_of_birth"]),
        employment: json["employment"] == null
            ? null
            : Employment.fromJson(json["employment"]),
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        creditCard: json["credit_card"] == null
            ? null
            : CreditCard.fromJson(json["credit_card"]),
        subscription: json["subscription"] == null
            ? null
            : Subscription.fromJson(json["subscription"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uid": uid,
        "password": password,
        "first_name": firstName,
        "last_name": lastName,
        "username": username,
        "email": email,
        "avatar": avatar,
        "gender": gender,
        "phone_number": phoneNumber,
        "social_insurance_number": socialInsuranceNumber,
        "date_of_birth":
            "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
        "employment": employment?.toJson(),
        "address": address?.toJson(),
        "credit_card": creditCard?.toJson(),
        "subscription": subscription?.toJson(),
      };
}

class Address {
  String? city;
  String? streetName;
  String? streetAddress;
  String? zipCode;
  String? state;
  String? country;
  Coordinates? coordinates;

  Address({
    this.city,
    this.streetName,
    this.streetAddress,
    this.zipCode,
    this.state,
    this.country,
    this.coordinates,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        city: json["city"],
        streetName: json["street_name"],
        streetAddress: json["street_address"],
        zipCode: json["zip_code"],
        state: json["state"],
        country: json["country"],
        coordinates: json["coordinates"] == null
            ? null
            : Coordinates.fromJson(json["coordinates"]),
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "street_name": streetName,
        "street_address": streetAddress,
        "zip_code": zipCode,
        "state": state,
        "country": country,
        "coordinates": coordinates?.toJson(),
      };
}

class Coordinates {
  double? lat;
  double? lng;

  Coordinates({
    this.lat,
    this.lng,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

class CreditCard {
  String? ccNumber;

  CreditCard({
    this.ccNumber,
  });

  factory CreditCard.fromJson(Map<String, dynamic> json) => CreditCard(
        ccNumber: json["cc_number"],
      );

  Map<String, dynamic> toJson() => {
        "cc_number": ccNumber,
      };
}

class Employment {
  String? title;
  String? keySkill;

  Employment({
    this.title,
    this.keySkill,
  });

  factory Employment.fromJson(Map<String, dynamic> json) => Employment(
        title: json["title"],
        keySkill: json["key_skill"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "key_skill": keySkill,
      };
}

class Subscription {
  String? plan;
  String? status;
  String? paymentMethod;
  String? term;

  Subscription({
    this.plan,
    this.status,
    this.paymentMethod,
    this.term,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
        plan: json["plan"],
        status: json["status"],
        paymentMethod: json["payment_method"],
        term: json["term"],
      );

  Map<String, dynamic> toJson() => {
        "plan": plan,
        "status": status,
        "payment_method": paymentMethod,
        "term": term,
      };
}
