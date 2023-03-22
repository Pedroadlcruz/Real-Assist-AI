import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkInfoService {
  NetworkInfoService({Connectivity? connectivity})
      : _connectivity = connectivity ?? Connectivity();

  final Connectivity _connectivity;

  /// Check if the device has wifi or mobile data
  Future<bool> get isConnected async {
    final result = await _connectivity.checkConnectivity();

    return result == ConnectivityResult.wifi ||
        result == ConnectivityResult.mobile;
  }
}
