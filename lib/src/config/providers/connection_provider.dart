import 'dart:io';

import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:string_validator/string_validator.dart';

class ConnectionProvider {
  static final ConnectionProvider _singleton = ConnectionProvider._internal();

  factory ConnectionProvider() {
    return _singleton;
  }

  ConnectionProvider._internal();

  static Future<bool> hasConnection({required String server}) async {
    return await InternetConnectionChecker.createInstance(
          addresses: await getAddressOptions(server),
          //  checkInterval: checkInterval,
          //  checkTimeout: defaultTimeout,
        ).connectionStatus ==
        InternetConnectionStatus.connected;
  }

  static Stream<InternetConnectionStatus> getConnectionStream(
      String server) async* {
    yield* InternetConnectionChecker.createInstance(
      addresses: await getAddressOptions(server),
      checkInterval: checkInterval,
      checkTimeout: defaultTimeout,
    ).onStatusChange;
  }

  static Future<List<AddressCheckOptions>> getAddressOptions(
      String server) async {
    String address = await _normalizeIpAddress(server);
    int? port;
    if (address.contains(':')) {
      port = int.parse(address.substring(address.indexOf(':') + 1));
      address = address.substring(0, address.indexOf(':'));
    }
    if (isFQDN(address)) {
      return List<AddressCheckOptions>.unmodifiable(
        <AddressCheckOptions>[
          AddressCheckOptions(
            hostname: address,
            port: port ?? 443,
          ),
        ],
      );
    } else {
      return List<AddressCheckOptions>.unmodifiable(
        <AddressCheckOptions>[
          AddressCheckOptions(
            address: InternetAddress(address, type: InternetAddressType.IPv4),
            port: port ?? 443,
          ),
        ],
      );
    }
  }

  static Future<String> _normalizeIpAddress(String server) async {
    server = server.replaceAll('https://', '');
    server = server.replaceAll('http://', '');
    return server;
    // String ipAddress;
    // if (isFQDN(server)) {
    //   ipAddress = (await InternetAddress.lookup(server)).first.address;
    // } else {
    //   ipAddress = server.substring(0, server.indexOf(':'));
    // }
    // return ipAddress;
  }

  static const Duration defaultTimeout = Duration(seconds: 3);
  static const Duration checkInterval = Duration(seconds: 3);
}
