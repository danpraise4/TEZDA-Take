import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';


class LocationService extends ChangeNotifier {
  static final LocationService _instance = LocationService._internal();

  factory LocationService() {
    return _instance;
  }

  LocationService._internal();

  Position? _currentPosition;
  Position? get currentPosition => _currentPosition;

  Future<void> initialize() async {
    await _checkPermission();
    _listenToLocationChanges();
    await _getLastKnownPosition();
  }

  Future<void> _checkPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }
  }

  void _listenToLocationChanges() {
    Geolocator.getPositionStream().listen((Position position) {
      _currentPosition = position;
      notifyListeners();
    });
  }

  Future<void> _getLastKnownPosition() async {
    try {
      _currentPosition = await Geolocator.getLastKnownPosition();
      notifyListeners();
    } catch (e) {
      debugPrint('Error getting last known position: $e');
    }
  }
}
