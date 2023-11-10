import 'dart:async';

import 'package:carrier_info/carrier_info.dart';
import 'package:flutter/services.dart';

class CarrierInfo {
  static const MethodChannel _channel =
      const MethodChannel('plugins.chizi.tech/carrier_info');

  /// Get carrier data from android device
  static Future<AndroidCarrierData?> getAndroidInfo() async {
    Map? map = await _channel.invokeMethod('getAndroidInfo');
    if(map != null) {
      return AndroidCarrierData.fromMap(map);
    } else {
      return null;
    }
  }

  /// Get all carrier data ios device
  static Future<IosCarrierData?> getIosInfo() async {
    Map? map = await _channel.invokeMethod('getIosInfo');
    if(map != null) {
      return IosCarrierData.fromMap(map);
    } else {
      return null;
    }
  }
}
