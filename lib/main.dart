import 'package:datakaryawan/koneksi.dart';
import 'package:datakaryawan/model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Karyawan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Data Karyawan'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Album> listAlbum = [];
  Koneksi koneksi = Koneksi();

  getData() async {
    listAlbum = await koneksi.getData();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.network(listAlbum[index].avatar),
                title: Text(listAlbum[index].name),
                subtitle: Text(listAlbum[index].address),
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemCount: listAlbum.length),
      ),
    );
  }
}
