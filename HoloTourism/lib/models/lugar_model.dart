import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LugarModel extends Equatable{
  final bool ok;
  final String nombre;
  final String latitud;
  final String longitud;

  const LugarModel({
    required this.ok,
    required this.nombre,
    required this.latitud,
    required this.longitud
  });

  @override
  List<Object?> get props => [
    ok,
    nombre,
    latitud,
    longitud,
  ];

  factory LugarModel.fromJson(Map<String, dynamic> json) {
    return LugarModel(
      ok: json['ok'],
      nombre: json['nombre'],
      latitud: json['latitud'].toString(),
      longitud: json['longitud'].toString(),
    );
  }

  bool get _ok => ok;
  String get _nombre => nombre;
  String get _latitud => latitud;
  String get _longitud => longitud;

}