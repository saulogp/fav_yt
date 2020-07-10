import 'dart:convert';
import 'package:fav_yt/models/video.dart';
import 'package:http/http.dart' as http;
const API_KEY = "AIzaSyAnpCARqLBBbzkSmUjfBl91PcSJ3rlVSPI";
//"https://www.googleapis.com/youtube/v3/search?part=snippet&q=$_search&type=video&key=$API_KEY&maxResults=10&pageToken=$_nextToken"
//"http://suggestqueries.google.com/complete/search?hl=en&ds=yt&client=youtube&hjson=t&cp=1&q=$search&format=5&alt=json"

class Api{
  
  search(String search) async {
    String url = "https://www.googleapis.com/youtube/v3/search?part=snippet&q=$search&type=video&key=$API_KEY&maxResults=10";
    http.Response response = await http.get(url);

    decode(response);
    
  }

  List<Video> decode(http.Response response){
    if(response.statusCode == 200){
      var decoded = json.decode(response.body);
      List<Video> videos = decoded["items"].map<Video>(
        (map){
          return Video.fromJson(map);
        }
      ).toList();
      return videos;
    }else{
      throw Exception("Failed to load videos");
    }
  }
}