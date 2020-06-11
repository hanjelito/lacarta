import 'dart:core';
import 'dart:math';
import 'package:geolocator/geolocator.dart';

class LocationProvider {
  int lat;
  int lng;

  LocationProvider({
    this.lat,
    this.lng,
  });
  LocationProvider.fromJsonMap(Map<String, dynamic> json) {
    lat = json['lat'] / 1;
    lng = json['lng'] / 1;
  }
}

class Coordinates {
  Coordinates() {
    getLocation();
  }
  getLocation() async {
    Position position = await Geolocator().getCurrentPosition();
    List<LocationProvider> items = new List();

    final coordinates = new LocationProvider.fromJsonMap({
      'lat': position.latitude,
      'lng': position.longitude,
    });
    items.add(coordinates);
  }
}





// getLatMeter() async {

//   var lat1 = lat;
//   var lng1 = lng;
//   var lat2 = position.longitude;
//   var lng2 = _locationData.latitude;
//   var p = 0.017453292519943295;
//   var c = cos;
//   var a = 0.5 -
//       c((lat2 - lat1) * p) / 2 +
//       c(lat1 * p) * c(lat2 * p) * (1 - c((lng2 - lng1) * p)) / 2;
//   var distanceBetween = 12742 * asin(sqrt(a));
//   distanceBetween = num.parse(distanceBetween.toStringAsFixed(2));
//   var roundedText = distanceBetween.toString() + ' km';

//   return roundedText;
// }

// Location location = new Location();

// bool _serviceEnabled;
// PermissionStatus _permissionGranted;

// _serviceEnabled = await location.serviceEnabled();
// if (!_serviceEnabled) {
//   _serviceEnabled = await location.requestService();
//   if (!_serviceEnabled) {
//     return;
//   }
// }

// _permissionGranted = await location.hasPermission();
// if (_permissionGranted == PermissionStatus.denied) {
//   _permissionGranted = await location.requestPermission();
//   if (_permissionGranted != PermissionStatus.granted) {
//     return;
//   }
