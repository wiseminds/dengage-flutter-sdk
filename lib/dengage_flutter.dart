import 'dart:async'; 

import 'package:flutter/services.dart';

class DengageFlutter {
  static const MethodChannel _channel = const MethodChannel('dengage_flutter');
static const EventChannel eventChannel = EventChannel("com.dengage.flutter/onNotificationClicked");

  // iOS only
  static Future<bool?> setIntegerationKey(String key) async {
    return await _channel
        .invokeMethod("dEngage#setIntegerationKey", {'key': key});
  }

  static Future<bool?> setContactKey(String contactKey) async {
    return await _channel
        .invokeMethod("dEngage#setContactKey", {'contactKey': contactKey});
  }

  // iOS only
  static Future<void> promptForPushNotifications() async {
    return await _channel.invokeMethod("dEngage#promptForPushNotifications");
  }

  // iOS only
  static Future<bool?> promptForPushNotificationsWithPromise() async {
    return await _channel.invokeMethod("dEngage#promptForPushNotifications");
  }

  static Future<void> setUserPermission(bool hasPermission) async {
    return await _channel.invokeMethod(
        "dEngage#setUserPermission", {'hasPermission': hasPermission});
  }

  // iOS only
  static Future<void> registerForRemoteNotifications(bool enabled) async {
    return await _channel.invokeMethod(
        "dEngage#registerForRemoteNotifications", {'enabled': enabled});
  }

  static Future<String?> getToken() {
    return _channel.invokeMethod("dEngage#getToken");
  }

  static Future<String?> getContactKey() {
    return _channel.invokeMethod("dEngage#getContactKey");
  }

  static Future<void> setToken(String token) {
    return _channel.invokeMethod("dEngage#setToken", {'token': token});
  }

  // android only
  static Future<bool?> setHuaweiIntegrationKey(String key) async {
    return await _channel
        .invokeMethod("dEngage#setHuaweiIntegrationKey", {'key': key});
  }

  // android only
  static Future<bool?> setFirebaseIntegrationKey(String key) async {
    return await _channel
        .invokeMethod("dEngage#setFirebaseIntegrationKey", {'key': key});
  }

  static Future<bool?> setLogStatus(bool isVisible) async {
    return await _channel
        .invokeMethod("dEngage#setLogStatus", {'isVisible': isVisible});
  }

  // android Only
  static Future<bool?> getUserPermission() async {
    return _channel.invokeMethod("dEngage#getUserPermission");
  }

  // android only
  static Future<Map<String, dynamic>?> getSubscription() async {
    return _channel.invokeMethod("dEngage#getSubscription");
  }

  static Future<Map<String, dynamic>> handleNotificationActionBlock() async {
    // todo: handling callback.
    return {};
  }

  static Future<void> pageView(Map<String, dynamic> data) async {
    return await _channel.invokeMethod("dEngage#pageView", {'data': data});
  }

  static Future<void> addToCart(Map<String, dynamic> data) async {
    return await _channel.invokeMethod("dEngage#addToCart", {'data': data});
  }

  static Future<void> removeFromCart(Map<String, dynamic> data) async {
    return await _channel
        .invokeMethod("dEngage#removeFromCart", {'data': data});
  }

  static Future<void> viewCart(Map<String, dynamic> data) async {
    return await _channel.invokeMethod("dEngage#viewCart", {'data': data});
  }

  static Future<void> beginCheckout(Map<String, dynamic> data) async {
    return await _channel.invokeMethod("dEngage#beginCheckout", {'data': data});
  }

  static Future<void> placeOrder(Map<String, dynamic> data) async {
    return await _channel.invokeMethod("dEngage#placeOrder", {'data': data});
  }

  static Future<void> cancelOrder(Map<String, dynamic> data) async {
    return await _channel.invokeMethod("dEngage#cancelOrder", {'data': data});
  }

  static Future<void> addToWishList(Map<String, dynamic> data) async {
    return await _channel.invokeMethod("dEngage#addToWishList", {'data': data});
  }

  static Future<void> removeFromWishList(Map<String, dynamic> data) async {
    return await _channel
        .invokeMethod("dEngage#removeFromWishList", {'data': data});
  }

  static Future<void> search(Map<String, dynamic> data) async {
    return await _channel.invokeMethod("dEngage#search", {'data': data});
  }

  static Future<void> sendDeviceEvent(
      String tableName, Map<String, dynamic> data) async {
    return await _channel.invokeMethod(
        "dEngage#sendDeviceEvent", {'tableName': tableName, 'data': data});
  }

  static Future<void> getInboxMessages(int offset, int limit) async {
    return await _channel.invokeMethod(
        "dEngage#getInboxMessages", {'offset': offset, 'limit': limit});
  }

  static Future<void> deleteInboxMessage(int id) async {
    return await _channel
        .invokeMethod("dEngage#deleteInboxMessage", {'id': id});
  }

  static Future<void> setInboxMessageAsClicked(int id) async {
    return await _channel
        .invokeMethod("dEngage#setInboxMessageAsClicked", {'id': id});
  }

  static Future<void> setNavigation() async {
    return await _channel.invokeMethod("dEngage#setNavigation");
  }

  static Future<void> setNavigationWithName(String screenName) async {
    return await _channel.invokeMethod(
        "dEngage#setNavigationWithName", {'screenName': screenName});
  }
}
