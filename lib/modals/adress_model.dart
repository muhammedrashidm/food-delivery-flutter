// To parse this JSON data, do
//
//     final addressModal = addressModalFromJson(jsonString);

import 'dart:convert';

AddressModal addressModalFromJson(String str) => AddressModal.fromJson(json.decode(str));

String addressModalToJson(AddressModal data) => json.encode(data.toJson());

class AddressModal {
  int? _id;
  late String _addressType;
  String? _contactPersonName;
  String? _contactPhoneNumber;
  late String _address;
  late String _latitude;
  late String _longitude;

  AddressModal({
    id,
    required addressType,
    contactPersonName,
     contactPhoneNumber,
    address,
    latitude,
    longitude,}
  ){
    _id=id;
    _addressType = addressType;
    _contactPersonName=contactPersonName;
    _contactPhoneNumber=contactPhoneNumber;
    _address=address;
    _latitude=latitude;
    _longitude=longitude;
  }

  String get address=>_address;
  String get addressType=>_addressType;
  String? get contactPhoneNumber=>_contactPhoneNumber;
  String? get contactPersonName=>_contactPersonName;
  String? get latitude =>_latitude;
  String? get longitude =>_longitude;




   AddressModal.fromJson(Map<String, dynamic> json)  {
         _id= json["id"];
         _addressType= json["address_type"]??"";
         _contactPersonName=json["contact_person_name"]??"";
         _contactPhoneNumber= json["contact_person_number"]??"";
         _address= json["address"];
         _latitude= json["latitude"];
         _longitude= json["longitude"];
       }

  Map<String, dynamic> toJson() => {
    "id": _id,
    "address_type":  _addressType,
    "contact_person_name":  _contactPersonName,
    "contact_person_number":  _contactPhoneNumber,
    "address": _address,
    "latitude":  _latitude,
    "longitude":  _longitude,
  };
}
