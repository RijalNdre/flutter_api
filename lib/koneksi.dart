import 'dart:convert';
import 'package:datakaryawan/model.dart';
import 'package:http/http.dart' as http;

class Koneksi {
  final _baseUrl = 'https://646cc0367b42c06c3b2bf147.mockapi.io/karyawan';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<Album> album = it.map((e) => Album.fromJson(e)).toList();
        return album;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
