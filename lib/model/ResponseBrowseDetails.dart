class ResponseBrowseDetails {
  ResponseBrowseDetails({
      this.genres,
  this.status_message,
  this.success,
  this.status_code});

  ResponseBrowseDetails.fromJson(dynamic json) {
    success = json['success'];
    status_code = json['status_code'];
    status_message = json['status_message'];
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(Genres.fromJson(v));
      });
    }
  }
  int? status_code;
  String? status_message;
  bool? success;
  List<Genres>? genres;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (genres != null) {
      map['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Genres {
  Genres({
      this.id, 
      this.name,});

  Genres.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  int? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}