import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_database/app/modules/api.dart';
import 'package:movie_database/app/modules/details_screen/controllers/details_screen_controller.dart';
import 'package:movie_database/app/modules/details_screen/views/details_screen_view.dart';

import '../controllers/home_screen_controller.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  final HomeScreenController _homeScreenController =
      Get.put(HomeScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Color.fromARGB(180, 36, 36, 36),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Color.fromARGB(99, 255, 255, 255),
                child: ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.supervised_user_circle_outlined,
                    color: Colors.white,
                  ),
                  title: Text(
                    'User Profile',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Color.fromARGB(99, 255, 255, 255),
                child: ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.privacy_tip,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Privacy Policy',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Color.fromARGB(99, 255, 255, 255),
                child: ListTile(
                  onTap: () async {
                    await _homeScreenController.logout();
                  },
                  leading: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Sign-Out',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(180, 36, 36, 36),
        title: Text('Movie-Database'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: FutureBuilder<List<Welcome>>(
            future: _homeScreenController.fetchData(),
            builder: (context, snapshot) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisExtent: 320),
                itemBuilder: (context, int index) {
                  return Stack(
                    children: [
                      Container(
                        color: Colors.black,
                        child: Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Container(
                              height: 320,
                              width: MediaQuery.of(context).size.width / 2,
                              child: InkWell(
                                onTap: () async {
                                  final keysss = await DetailsScreenController()
                                      .fetchVideoData(
                                          snapshot.data![index].id, index);
                                  Get.to(DetailsScreenView(
                                    keys: keysss.toString(),
                                    datas: _homeScreenController
                                        .fetchedList[index],
                                  ));
                                },
                                child: Image.network(
                                    "https://image.tmdb.org/t/p/w500${_homeScreenController.fetchedList[index].posterPath}",
                                    fit: BoxFit.cover, frameBuilder: (context,
                                        child, frame, wasSynchronouslyLoaded) {
                                  return child;
                                }, loadingBuilder:
                                        (context, child, loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  } else {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                }),
                              ),
                            )),
                      ),
                      Positioned(
                        left: 2,
                        top: 290,
                        child: Container(
                          height: 30,
                          color: Color.fromARGB(125, 181, 172, 172),
                          width: MediaQuery.of(context).size.width / 2,
                          child: Center(
                            child: Text(
                              _homeScreenController.fetchedList[index].title!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
                itemCount: _homeScreenController.fetchedList.length,
              );
            }),
      ),
    );
  }
}
