import 'dart:convert';

import 'package:food_delivery/data/repositories/location_repo.dart';
import 'package:food_delivery/modals/response_modal.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../modals/adress_model.dart';

class LocationController extends GetxController implements GetxService {
  final LocationRepo locationRepo;

  LocationController({required this.locationRepo});

  List<AddressModal> get addressList => _addressList;

  bool _isLoading = false;
  late Position _position;
  late Position _pickPosition;

  bool get isLoading => _isLoading;
  Position get position => _position;
  Position get pickPosition => _pickPosition;

  Placemark _placeMark = Placemark();
  Placemark _pickedPlaceMark = Placemark();

  Placemark get placeMark => _placeMark;
  Placemark get pickedPlaceMark => _pickedPlaceMark;

  List<AddressModal> _addressList = [];
  late List<AddressModal> _allAddressList;
  List<AddressModal> get allAddressList => _allAddressList;

  List<String> _addressTypeList = ["home", "office", "others"];
  List<String> get addressTypeList => _addressTypeList;
  int _addressTypeIndex = 0;
  int get addressTypeIndex => _addressTypeIndex;

  bool _updateAdressData = true;
  bool _changeAdress = true;

  late GoogleMapController _googleMapController;
  void setMapController(GoogleMapController googleMapController) {
    _googleMapController = googleMapController;
    update();
  }

  void updatePosition(CameraPosition cameraPosition, bool fromAddress) async {
    if (_updateAdressData) {
      _isLoading = true;
      update();
      try {
        if (fromAddress) {
          _position = Position(
              longitude: cameraPosition.target.longitude,
              latitude: cameraPosition.target.latitude,
              timestamp: DateTime.now(),
              accuracy: 1,
              altitude: 1,
              heading: 1,
              speed: 1,
              speedAccuracy: 1);
        } else {
          _pickPosition = Position(
              longitude: cameraPosition.target.longitude,
              latitude: cameraPosition.target.latitude,
              timestamp: DateTime.now(),
              accuracy: 1,
              altitude: 1,
              heading: 1,
              speed: 1,
              speedAccuracy: 1);
        }
        if (_changeAdress) {
          String _address = await getAddressFromGeocode(LatLng(
              cameraPosition.target.latitude, cameraPosition.target.longitude));
          fromAddress
              ? _placeMark = Placemark(name: _address)
              : _pickedPlaceMark = Placemark(name: _address);
        }
      } catch (e) {
        print(e);
      }
    }
    update();
  }

  Future<String> getAddressFromGeocode(LatLng latLng) async {
    String _address = "Unknown Location";

    Response response = await locationRepo.getAddressFromGeocode(latLng);
    if (response.body["status"] == "OK") {
      _address = response.body["results"][0]["formatted_address"].toString();
    } else {
      print("Error geting google api");
    }
    return _address;
  }

  late Map<String, dynamic> _getAddress;
  Map get getAddress => _getAddress;
  AddressModal getUserAddressFromLocStore() {
    late AddressModal _adressModal;
    _getAddress = jsonDecode(locationRepo.getUserAddressFromLocStore());
    try {
      _adressModal = AddressModal.fromJson(
          jsonDecode(locationRepo.getUserAddressFromLocStore()));
    } catch (e) {
      print(e);
    }
    return _adressModal;
  }

  void setAddressTypeIndex(int index) {
    _addressTypeIndex = index;
    update();
  }

  Future<ResponseModal> addAddress(AddressModal addressModal) async {
    _isLoading = true;
    update();
    Response response = await locationRepo.addAddress(addressModal);
    ResponseModal responseModal;
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response);

      await getAddressList();
      var message = response.statusText;

      responseModal = ResponseModal(message.toString(), true);
      await saveUserAddress(addressModal);
    } else {
      print(response.body);
      print('cant asve address');
      responseModal = ResponseModal(response.statusText.toString(), false);
    }
    update();
    return responseModal;
  }

  Future<void> getAddressList() async {
    Response response = await locationRepo.getAllAddress();
    if (response.statusCode == 200) {
      _addressList = [];
      _allAddressList = [];
      response.body.forEach((address) {
        _addressList.add(AddressModal.fromJson(address));
        _allAddressList.add(AddressModal.fromJson(address));
      });
    } else {
      _addressList = [];
      _allAddressList = [];
    }
    update();
  }

  saveUserAddress(AddressModal addressModal) async {
    String userAddress = jsonEncode(addressModal.toJson());
    return await locationRepo.saveToLocal(userAddress);
  }

  void clearAdress() {
    _addressList = [];
    _allAddressList = [];
    update();
  }
}
