import 'dart:io';

import '../errors/failures.dart';

class ConnectivityService {
  Future<Failure?> hasConnection() async {
    try {
      final result = await InternetAddress.lookup(
        'google.com',
      ).timeout(const Duration(seconds: 5));
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return null;
      } else {
        return const NoInternetFailure();
      }
    } catch (_) {
      return const NoInternetFailure();
    }
  }
}
