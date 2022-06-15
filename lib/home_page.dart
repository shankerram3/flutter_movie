import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List trendingMovies = [];
  final String apikey = '510fdeb2c28e260a0448274ee0322b12';
  final String readAccessKey ='eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1MTBmZGViMmMyOGUyNjBhMDQ0ODI3NGVlMDMyMmIxMiIsInN1YiI6IjYyN2NkMGMxZmQxNDBiMDA1M2FjZDdjMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.6Zl67V4fhvXwkxDdnVrxAmvuxoXfsGxLIKljRgUmoKw';
  
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter movie App'),
      ),
    );
  }
}
