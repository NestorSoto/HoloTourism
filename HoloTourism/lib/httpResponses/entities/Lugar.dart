
import 'dart:ffi';

class Lugar{
  final Bool ok;
  final String nombre;
  final String latitud;
  final String longitud;

  const Lugar({
    required this.ok,
    required this.nombre,
    required this.latitud,
    required this.longitud
  });

  factory Lugar.fromJson(Map<String, dynamic> json) {
    return Lugar(
      ok: json['ok'],
      nombre: json['nombre'],
      latitud: json['latitud'],
      longitud: json['longitud'],
    );
  }


}