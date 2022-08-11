import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_database/app/modules/api.dart';

import '../controllers/details_screen_controller.dart';

class DetailsScreenView extends GetView<DetailsScreenController> {
  Welcome? datas;
  @override
  final keys;
  final DetailsScreenController _detailsScreenController =
      Get.put(DetailsScreenController());
  DetailsScreenView({this.datas, this.keys});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(datas!.title!),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(children: [
          SizedBox(
            height: 250,
            child: Stack(
              children: [
                Positioned(
                    child: SizedBox(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    "https://image.tmdb.org/t/p/w500${datas!.backdropPath!}",
                    fit: BoxFit.cover,
                  ),
                )),
                Positioned(
                  bottom: 10,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      '⭐ Average Rating-${datas!.voteAverage}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                datas!.title ?? 'Not Loaded',
                style: const TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              "Release Date: ${datas!.releaseDate!.day.toString()}/${datas!.releaseDate!.month.toString()}/${datas!.releaseDate!.year.toString()}",
              style: const TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Description:',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          Row(
            children: [
              Flexible(
                  child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    datas!.overview.toString(),
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Watch-Trailers',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    await _detailsScreenController.openvideo(keys.toString());
                  },
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://image.tmdb.org/t/p/w500${datas!.posterPath}"),
                            fit: BoxFit.contain)),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
