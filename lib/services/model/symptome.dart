import 'dart:convert';

List<Symptome> symptomeFromJson(String str) => List<Symptome>.from(json.decode(str).map((x) => Symptome.fromJson(x)));

String symptomeToJson(List<Symptome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Symptome {
  Symptome({
    required this.id,
    required this.bezeichnung,
  });

  int id;
  String bezeichnung;

  factory Symptome.fromJson(Map<String, dynamic> json) => Symptome(
    id: json["id"],
    bezeichnung: json["bezeichnung"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "bezeichnung": bezeichnung,
  };
}
