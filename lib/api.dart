import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

List list = List();

Future<List> getVideos() async {
  final response = await http.get(
      'https://my-json-server.typicode.com/bluesky93128/tiktok_mock_db/videos');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    list = json.decode(response.body);
    return list;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Video {
  final String description;
  final String sources;
  final String title;
  final String subtitle;
  final String thumb;

  Video({this.description, this.sources, this.title, this.subtitle, this.thumb});

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      description: json['description'],
      sources: json['sources'],
      title: json['title'],
      subtitle: json['subtitle'],
      thumb: json['thumb'],
    );
  }
}
