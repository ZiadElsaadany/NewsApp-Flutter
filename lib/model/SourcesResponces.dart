import 'Sources.dart';
class SourcesResponces {
  String ? status;
  List<Sources> ? sources;
  String ? message  ;
  String ? code;

  SourcesResponces({
      this.status, 
      this.sources,
     this.message ,
    this.code
  } );

  SourcesResponces.fromJson(dynamic json) {
    status = json['status'];
    if (json['sources'] != null) {
      sources = [];
      json['sources'].forEach(
              (v)
          {
        sources?.add(Sources.fromJson(v));
      });}
    code = json['code']  ;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (sources != null) {
      map['sources'] = sources!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}