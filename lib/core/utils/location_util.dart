import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' as location_plugin;

class LocationUtil {
  static location_plugin.LocationData? _locationData;

  static location_plugin.LocationData? get locationData => _locationData;

  static Future<void> init() async {
    final location = location_plugin.Location();

    var serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    var permissionGranted = await location.hasPermission();
    if (permissionGranted == location_plugin.PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != location_plugin.PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
  }

  static Future<Map<String, double>?> addressToLatLng(String address) async {
    try {
      final locations = await locationFromAddress(address);
      if (locations.isEmpty) return null;

      return {
        'lat': locations.first.latitude,
        'lng': locations.first.longitude,
      };
    } catch (e) {
      return null;
    }
  }

  static Future<String?> latLngToAddress(double lat, double lng) async {
    try {
      final placeMarks = await placemarkFromCoordinates(lat, lng);
      if (placeMarks.isEmpty) return null;

      return 'placeMarks.first';
    } catch (e) {
      return null;
    }
  }
}
