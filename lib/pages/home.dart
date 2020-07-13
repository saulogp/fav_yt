import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:fav_yt/blocs/videos_bloc.dart';
import 'package:fav_yt/delegate/data_search.dart';
import 'package:fav_yt/pages/widgets/videotile.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 35,
          child: Image.asset("images/logo-yt.png"),
        ),
        elevation: 0,
        backgroundColor: Colors.black,
        actions: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text("0"),
          ),
          IconButton(icon: Icon(Icons.star), onPressed: () {}),
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                String result =
                    await showSearch(context: context, delegate: DataSearch());
                if (result != null)
                  BlocProvider.of<VideoBloc>(context).inSearch.add(result);
              }),
        ],
      ),
      body: StreamBuilder(
        stream: BlocProvider.of<VideoBloc>(context).outVideos,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return VideoTile(snapshot.data[index]);
                });
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
