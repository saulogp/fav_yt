import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:fav_yt/blocs/videos_bloc.dart';
import 'package:fav_yt/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        blocs: VideoBloc(),
        child: MaterialApp(
          title: "Favoritos do YT",
          home: Home(),
          debugShowCheckedModeBanner: false,
        ));
  }
}
