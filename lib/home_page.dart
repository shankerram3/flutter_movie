import 'package:flutter/material.dart';
import 'package:flutter_movie_db/models/Models.dart';
import 'package:flutter_movie_db/service/api_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_movie_db/utils/text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String readAccessKey =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1MTBmZGViMmMyOGUyNjBhMDQ0ODI3NGVlMDMyMmIxMiIsInN1YiI6IjYyN2NkMGMxZmQxNDBiMDA1M2FjZDdjMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.6Zl67V4fhvXwkxDdnVrxAmvuxoXfsGxLIKljRgUmoKw';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      drawer: Drawer(
        child: ListView(
          children: const [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://www.rd.com/wp-content/uploads/2021/01/GettyImages-588935825.jpg'),
              ),
              accountName: Text('Ram Sankar hk'),
              accountEmail: Text('shankerram3@gmail.com'),
              decoration: BoxDecoration(color: Colors.deepPurple),
            ),
            ListTile(
              title: Text('first item'),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const ModText(text: 'MOVIE APP',),
      ),
      body: FutureBuilder(
        future: HttpService().getTrending(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal:8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                    crossAxisCount: 2),
                itemCount: (snapshot.data as Model).results?.length ?? 0,
                itemBuilder: (context, index) => Card(
                  color: Colors.indigoAccent,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                     shape: const RoundedRectangleBorder(borderRadius:BorderRadius.all(Radius.circular(5.0)) ),
                  child: Column(
                    children: [
                      CachedNetworkImage(

                          fit: BoxFit.cover,
                          imageUrl:
                              "https://image.tmdb.org/t/p/w500${(snapshot.data as Model).results?[index].backdropPath ?? ""}"),
                      const SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text((snapshot.data as Model)
                                .results?[index]
                                .originalTitle ??
                            ""),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
