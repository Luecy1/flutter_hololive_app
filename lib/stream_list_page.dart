import 'package:flutter/material.dart';

import 'holo_repository.dart';

class StreamListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo Home Page'),
      ),
      body: FutureBuilder(
        future: HoloRepository().getStreamList("yukihanalamy"),
        builder: (context, AsyncSnapshot<List<StreamItem>> snapshot) {
          if (snapshot.hasData) {
            return buildBody(snapshot.data);
          } else {
            return Center(child: CircularProgressIndicator());
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
        return Card(
          margin: EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 16.0 / 9.0,
                  child: Image.network(
                    item.thumbnailHigh,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    item.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
