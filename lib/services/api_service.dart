import 'package:assignment_march_2024/models/business.dart';
import 'package:assignment_march_2024/services/config.dart';
import 'package:assignment_march_2024/services/network_util.dart';

class YelpService {

  final NetworkUtil networkUtil = NetworkUtil(baseUrl: AppConfig.baseUrl,);


  Future<List<Businesses>> getBusinesses() async {
    try {

      final Map<String, dynamic> response = await networkUtil.get(
        'businesses/search?location=${"NYC"}',
        headers: {
          'Authorization': AppConfig.apiKey,
        },
      );
      final List<dynamic> businesses = response['businesses'];
       print(businesses);
      return businesses.map((business) {
        return Businesses.fromJson(business); // Use Businesses.fromJson here
      }).toList();
    } catch (e) {
      throw Exception('Failed to load businesses: $e');
    }
  }

}

