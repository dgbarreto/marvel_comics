class Creator {
  String? url;
  String? name;
  String? role;

  Creator({this.url, this.name, this.role});

  Creator.fromJson(Map<String, dynamic> json) {
    url = json["resourceURI"];
    name = json["name"];
    role = json["role"];
  }
}
