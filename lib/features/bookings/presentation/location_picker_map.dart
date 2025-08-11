import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import '../../../core/design/design.dart';

class LocationPickerMap extends StatefulWidget {
  final double? initialLatitude;
  final double? initialLongitude;
  final Function(double latitude, double longitude, String address)
  onLocationSelected;
  final double height;
  final String? initialAddress;

  const LocationPickerMap({
    super.key,
    this.initialLatitude,
    this.initialLongitude,
    required this.onLocationSelected,
    this.height = 300,
    this.initialAddress,
  });

  @override
  State<LocationPickerMap> createState() => _LocationPickerMapState();
}

class _LocationPickerMapState extends State<LocationPickerMap> {
  MapController? _mapController;
  LatLng? _selectedLocation;
  String? _selectedAddress;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _initializeLocation();
  }

  Future<void> _initializeLocation() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Check if we have initial coordinates
      if (widget.initialLatitude != null && widget.initialLongitude != null) {
        _selectedLocation = LatLng(
          widget.initialLatitude!,
          widget.initialLongitude!,
        );
        _selectedAddress = widget.initialAddress;
      } else {
        // Get current location
        final position = await _getCurrentLocation();
        if (position != null) {
          _selectedLocation = LatLng(position.latitude, position.longitude);
          _selectedAddress = _getAddressFromLatLng(_selectedLocation!);
        } else {
          // Use a default location if current location fails
          _selectedLocation = const LatLng(37.7749, -122.4194); // San Francisco
          _selectedAddress = 'San Francisco, CA';
        }
      }
    } catch (e) {
      // If location access fails, use a default location
      _selectedLocation = const LatLng(37.7749, -122.4194); // San Francisco
      _selectedAddress = 'San Francisco, CA';
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<Position?> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    print("serviceEnabled: $serviceEnabled");
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return null;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return null;
    }

    try {
      return await Geolocator.getCurrentPosition();
    } catch (e) {
      return null;
    }
  }

  String _getAddressFromLatLng(LatLng latLng) {
    return '${latLng.latitude.toStringAsFixed(6)}, ${latLng.longitude.toStringAsFixed(6)}';
  }

  Future<void> _goToMyLocation() async {
    try {
      final position = await _getCurrentLocation();
      if (position != null) {
        final newLocation = LatLng(position.latitude, position.longitude);
        final address = _getAddressFromLatLng(newLocation);

        setState(() {
          _selectedLocation = newLocation;
          _selectedAddress = address;
        });

        // Animate map to new location
        _mapController?.move(newLocation, 15.0);

        // Notify parent of location change
        widget.onLocationSelected(
          newLocation.latitude,
          newLocation.longitude,
          address,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Unable to get current location'),
            backgroundColor: Colors.orange,
          ),
        );
      }
    } catch (e, s) {
      print(s);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error getting location'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _onMapTap(TapPosition tapPosition, LatLng latLng) {
    setState(() {
      _selectedLocation = latLng;
      _selectedAddress = _getAddressFromLatLng(latLng);
    });

    widget.onLocationSelected(
      latLng.latitude,
      latLng.longitude,
      _selectedAddress!,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Container(
        height: widget.height,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(
            DesignPrinciples.borderRadiusBase,
          ),
        ),
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    if (_selectedLocation == null) {
      return Container(
        height: widget.height,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(
            DesignPrinciples.borderRadiusBase,
          ),
        ),
        child: const Center(child: Text('Unable to load map')),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: widget.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  DesignPrinciples.borderRadiusBase,
                ),
                border: Border.all(color: Colors.grey[300]!, width: 1),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  DesignPrinciples.borderRadiusBase,
                ),
                child: FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    initialCenter: _selectedLocation!,
                    initialZoom: 15.0,
                    onTap: _onMapTap,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.cleaning_services_app',
                    ),
                    MarkerLayer(
                      markers:
                          _selectedLocation != null
                              ? [
                                Marker(
                                  point: _selectedLocation!,
                                  width: 40,
                                  height: 40,
                                  child: const Icon(
                                    Icons.location_on,
                                    color: Colors.red,
                                    size: 40,
                                  ),
                                ),
                              ]
                              : [],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 16,
              right: 16,
              child: FloatingActionButton.small(
                onPressed: _goToMyLocation,
                backgroundColor: Colors.white,
                foregroundColor: Colors.blue,
                child: const Icon(Icons.my_location),
              ),
            ),
          ],
        ),
        if (_selectedAddress != null) ...[
          const SizedBox(height: DesignPrinciples.spacing2),
          Container(
            padding: const EdgeInsets.all(DesignPrinciples.spacing3),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(
                DesignPrinciples.borderRadiusBase,
              ),
            ),
            child: Row(
              children: [
                const Icon(Icons.location_on, size: 16, color: Colors.grey),
                const SizedBox(width: DesignPrinciples.spacing2),
                Expanded(
                  child: Text(
                    _selectedAddress!,
                    style: const TextStyle(
                      fontSize: DesignPrinciples.fontSizeSm,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
