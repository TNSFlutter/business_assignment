import 'package:assignment_march_2024/models/business.dart';
import 'package:assignment_march_2024/services/api_service.dart';
import 'package:flutter/foundation.dart';

class BusinessViewModel extends ChangeNotifier {
  final YelpService _yelpService = YelpService();
  late List<Businesses> _businesses;

  List<Businesses> get businesses => _businesses;

  Future<void> fetchBusinesses() async {
    try {
      _businesses = await _yelpService.getBusinesses();
      if (kDebugMode) {
        print('Received businesses: $_businesses');
      }

      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}