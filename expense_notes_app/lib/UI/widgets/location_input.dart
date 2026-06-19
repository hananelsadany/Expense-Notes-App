import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key, required this.onLocationChanged});

  final Function(
    double? latitude,
    double? longitude,
    double? accuracy,
    DateTime? timestamp,
  )
  onLocationChanged;

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  double? _latitude;
  double? _longitude;
  double? _accuracy;
  DateTime? _timestamp;
  bool _isLoading = false;

  Future<void> _acquireLocation() async {
    setState(() => _isLoading = true);

    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _showSnack('Location services are disabled.');
      setState(() => _isLoading = false);
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _showSnack('Location permission denied.');
        setState(() => _isLoading = false);
        return;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      _showSnack('Location permission permanently denied.');
      setState(() => _isLoading = false);
      return;
    }

    final position = await Geolocator.getCurrentPosition();

    setState(() {
      _latitude = position.latitude;
      _longitude = position.longitude;
      _accuracy = position.accuracy;
      _timestamp = DateTime.now();
      _isLoading = false;
    });

    widget.onLocationChanged(_latitude, _longitude, _accuracy, _timestamp);
  }

  void _clearLocation() {
    setState(() {
      _latitude = null;
      _longitude = null;
      _accuracy = null;
      _timestamp = null;
    });
    widget.onLocationChanged(null, null, null, null);
  }

  void _showSnack(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_latitude != null && _longitude != null) {
      return Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.location_on, color: Colors.green, size: 18),
                const SizedBox(width: 6),
                const Text(
                  'Location Acquired',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close, size: 18),
                  onPressed: _clearLocation,
                ),
              ],
            ),
            Text('Lat: ${_latitude!.toStringAsFixed(6)}'),
            Text('Lng: ${_longitude!.toStringAsFixed(6)}'),
            if (_accuracy != null)
              Text('Accuracy: ${_accuracy!.toStringAsFixed(1)} m'),
          ],
        ),
      );
    }

    return ElevatedButton.icon(
      onPressed: _acquireLocation,
      icon: const Icon(Icons.my_location),
      label: const Text('Get Current Location'),
    );
  }
}
