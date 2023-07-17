import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class DirectGeocoding extends Equatable {
  final String name;
  final double lat;
  final double lon;
  final String country;
  DirectGeocoding({
    required this.name,
    required this.lat,
    required this.lon,
    required this.country,
  });

  factory DirectGeocoding.fromJson(List<dynamic> json) {
    final Map<String, dynamic> data = json[0];

    return DirectGeocoding(
        name: data['name'],
        lat: data['lat'],
        lon: data['lon'],
        country: data['country']);
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [name, lat, lon, country];
}
