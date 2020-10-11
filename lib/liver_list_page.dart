import 'package:flutter/material.dart';

import 'holo_repository.dart';
import 'stream_list_page.dart';

class LiverListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liver'),
      ),
      body: FutureBuilder(
        future: HoloRepository().getLiverList(),
        builder: (context, AsyncSnapshot<List<Liver>> snapshot) {
          if (snapshot.hasData) {
            return _buildLiverList(context, snapshot.data);
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _buildLiverList(BuildContext context, List<Liver> list) {
    return ListView.separated(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(list[index].diapName),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => StreamListPage()));
          },
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }
}
