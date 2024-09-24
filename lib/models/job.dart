// To parse this JSON data, do
//
//     final job = jobFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Job> jobFromJson(String str) =>
    List<Job>.from(json.decode(str).map((x) => Job.fromJson(x)));

String jobToJson(List<Job> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Job {
  final int id;
  final String nama;
  final String alamat;
  final String deskripsi;
  final String rangeUpah;
  final String requestPekerjaan;
  final String type;
  final String image;

  Job({
    required this.id,
    required this.nama,
    required this.alamat,
    required this.deskripsi,
    required this.rangeUpah,
    required this.requestPekerjaan,
    required this.type,
    required this.image,
  });

  factory Job.fromJson(Map<String, dynamic> json) => Job(
        id: json["id"],
        nama: json["nama"],
        alamat: json["alamat"],
        deskripsi: json["deskripsi"],
        rangeUpah: json["range_upah"],
        requestPekerjaan: json["request_pekerjaan"],
        type: json["type"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "alamat": alamat,
        "deskripsi": deskripsi,
        "range_upah": rangeUpah,
        "request_pekerjaan": requestPekerjaan,
        "type": type,
        "image": image,
      };
}
