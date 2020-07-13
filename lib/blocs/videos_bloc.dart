import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:fav_yt/api.dart';
import 'package:fav_yt/models/video.dart';

class VideoBloc implements BlocBase {
  Api api;
  List<Video> videos;

  final StreamController<List<Video>> _videosController =
      StreamController<List<Video>>();
  Stream get outVideo => _videosController.stream;

  final StreamController<String> _searchController = StreamController<String>();
  Sink get inSearch => _searchController.sink;

  VideoBloc() {
    api = Api();
    _searchController.stream.listen(_search);
  }

  void _search(String search) async {
    videos = await api.search(search);
    _videosController.sink.add(videos);
  }

  @override
  void dispose() {
    _videosController.close();
    _searchController.close();
  }

  @override
  void addListener(listener) {}

  @override
  bool get hasListeners => throw UnimplementedError();

  @override
  void notifyListeners() {}

  @override
  void removeListener(listener) {}
}
