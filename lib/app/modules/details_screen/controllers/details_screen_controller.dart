import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:movie_database/app/modules/video_model.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreenController extends GetxController {
  //TODO: Implement DetailsScreenController

  final count = 0.obs;

  @override
  void onClose() {}
  // void increment() => count.value++;
  List<VideoModel> videoList = [];
  String? newValue;
  fetchVideoData(id, index) async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/movie/$id/videos?api_key=3f28f3393a61eee30e840d3aa265c0f9'));
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);

        Iterable maps = result["results"];

        videoList = maps.map((movie) => VideoModel.fromJson(movie)).toList();
        newValue = videoList[index].key;
        log(newValue!);
        return newValue!;

        // log(fetchedList[0].toString());
      } else {
        throw Exception("Failed to load movie");
      }
    } catch (e) {
      log(e.toString());
    }
  }

  openvideo(String key) {
    log(key.toString());

    launchUrl(Uri.parse("https://www.youtube.com/watch?v=$key"));
  }
}
