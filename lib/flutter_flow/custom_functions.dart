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
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String returnProfileGreeting(DateTime timestamp) {
  // return "morning" if it is morning, "afternoon" if afternoon and "night" if it is night
  var hour = timestamp.hour;
  if (hour >= 0 && hour < 12) {
    return "Good Morning,";
  } else if (hour >= 12 && hour < 17) {
    return "Good Afternoon,";
  } else {
    return "Good Night,";
  }
}

DateTime convertToTimestamp(
  DateTime inputDate,
  String inputTime,
) {
  try {
    final timeParts = inputTime.split(':');
    if (timeParts.length != 2) {
      throw FormatException('Invalid time format');
    }

    final hours = int.parse(timeParts[0]);
    final minutes = int.parse(timeParts[1]);

    return DateTime(
      inputDate.year,
      inputDate.month,
      inputDate.day,
      hours,
      minutes,
    );
  } catch (e) {
    throw Exception('Error with date');
  }
}

String? locationChange(LatLng? location) {
  if (location == null) {
    return null; // Return null if location is null
  }

  // Extract latitude and longitude from the LatLng object
  final lat = location.latitude;
  final long = location.longitude;

  // Return as a list of latitude and longitude
  return '<iframe src="https://www.google.com/maps/embed?pb=!1m13!1m8!1m3!1d134178.03184951612!2d${long}!3d${lat}!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zM8KwMTgnNTUuMSJOIDEwMsKwMjUnMDYuMCJF!5e0!3m2!1sen!2smy!4v1734589081910!5m2!1sen!2smy" width="400" height="300" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>';
}

String? timeAgo(DateTime? timestamp) {
  if (timestamp == null) return "Unknown Time";

  final Duration diff = DateTime.now().difference(timestamp);

  if (diff.inSeconds < 60) {
    return "${diff.inSeconds}s";
  } else if (diff.inMinutes < 60) {
    return "${diff.inMinutes}m";
  } else if (diff.inHours < 24) {
    return "${diff.inHours}h";
  } else if (diff.inDays < 7) {
    return "${diff.inDays}d";
  } else if (diff.inDays < 30) {
    return "${(diff.inDays / 7).floor()}w";
  } else {
    return "${(diff.inDays / 30).floor()}M";
  }
}
