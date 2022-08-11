// To parse this JSON data, do
//
//     final videoModel = videoModelFromJson(jsonString);

// VideoModel videoModelFromJson(String str) =>
//     VideoModel.fromJson(json.decode(str));

// String videoModelToJson(VideoModel data) => json.encode(data.toJson());

// class VideoModel {
//   VideoModel({
//     this.id,
//     this.results,
//   });

//   String? id;
//   List<Result>? results;

//   factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
//         id: json["id"],
//         results:
//             List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "results": List<dynamic>.from(results!.map((x) => x.toJson())),
//       };
// }

class VideoModel {
  VideoModel({
    this.iso6391,
    this.iso31661,
    this.name,
    this.key,
    this.site,
    this.size,
    this.type,
    this.official,
    this.publishedAt,
    this.id,
  });

  String? iso6391;
  String? iso31661;
  String? name;
  String? key;
  String? site;
  int? size;
  String? type;
  bool? official;
  DateTime? publishedAt;
  String? id;

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        iso6391: json["iso_639_1"],
        iso31661: json["iso_3166_1"],
        name: json["name"],
        key: json["key"],
        site: json["site"],
        size: json["size"],
        type: json["type"],
        official: json["official"],
        publishedAt: DateTime.parse(json["published_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "iso_639_1": iso6391,
        "iso_3166_1": iso31661,
        "name": name,
        "key": key,
        "site": site,
        "size": size,
        "type": type,
        "official": official,
        "published_at": publishedAt!.toIso8601String(),
        "id": id,
      };
}
