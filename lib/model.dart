import 'dart:convert';

class Album {
  final String id;
  final String name;
  final String address;
  final String avatar;

  const Album({
    required this.id,
    required this.name,
    required this.address,
    required this.avatar,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      avatar: json['avatar'],
    );
  }
}
