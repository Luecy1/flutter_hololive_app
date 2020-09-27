import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hololive_app/holo_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo Home Page'),
      ),
      body: FutureBuilder(
        future: HoloRepository().getOnce(),
        builder: (context, AsyncSnapshot<List<StreamItem>> snapshot) {
          if (snapshot.hasData) {
            return buildBody(snapshot.data);
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Widget buildBody(List<StreamItem> streamList) {
    return ListView.builder(
      itemCount: streamList.length,
      itemBuilder: (context, index) {
        final item = streamList[index];
        return ListTile(
          title: Text(item.title),
          subtitle: Text(item.description),
        );
      },
    );
  }
}
