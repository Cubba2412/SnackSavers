import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

double getTotalPrice(
  int quantity,
  double price,
) {
  // multiply quantity with price and return this as a double named totalPrice
  return quantity * price;
}

String generateRandomUidString() {
  const int len = 28;
  var r = math.Random.secure();
  const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  return List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
}

double geoDistance(
  LatLng point1,
  LatLng point2,
) {
  // calculate distance between 2 points
  // Haversine formula in latitude and longitude
  var p = math.pi / 180;
  var a = 0.5 -
      math.cos((point2.latitude - point1.latitude) * p) / 2 +
      math.cos(point1.latitude * p) *
          math.cos(point2.latitude * p) *
          (1 - math.cos((point2.longitude - point1.longitude) * p)) /
          2;
  return 12742 * math.asin(math.sqrt(a));
}

int doubleToCurrencySmallestUnit(double price) {
  var newNumber;
  if (price is int) {
    newNumber = price.toDouble();
  } else {
    newNumber = price;
  }
  var smallestCurrencyNumber = newNumber * 100;
  return smallestCurrencyNumber.toInt();
}

DateTime? addToTimeStamp(
  DateTime? timestamp,
  int? timeToAddInMin,
) {
  // Null safe add time to timestamp
  try {
    if (timestamp == null) {
      final addedTimestamp = DateTime.now();
      return addedTimestamp;
    } else {
      Duration toAdd = Duration(minutes: timeToAddInMin ?? 0);
      return timestamp.add(toAdd);
    }
  } catch (e) {
    print(e);
  }
}
