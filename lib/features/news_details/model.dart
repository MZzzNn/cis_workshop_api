class NewsDetailsModel {
  int status;
  Data data;

  NewsDetailsModel({this.status, this.data});

  NewsDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int id;
  String title;
  String desc;
  int views;
  String image;
  String createAt;
  List<Sources> sources;

  Data(
      {this.id,
        this.title,
        this.desc,
        this.views,
        this.image,
        this.createAt,
        this.sources});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    desc = json['desc'];
    views = json['views'];
    image = json['image'];
    createAt = json['create_at'];
    if (json['sources'] != null) {
      sources = new List<Sources>();
      json['sources'].forEach((v) {
        sources.add(new Sources.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['desc'] = this.desc;
    data['views'] = this.views;
    data['image'] = this.image;
    data['create_at'] = this.createAt;
    if (this.sources != null) {
      data['sources'] = this.sources.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sources {
  int id;
  String image;
  String url;

  Sources({this.id, this.image, this.url});

  Sources.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['url'] = this.url;
    return data;
  }
}