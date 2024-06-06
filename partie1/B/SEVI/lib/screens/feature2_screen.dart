import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Feature2Screen extends StatefulWidget {
  @override
  _Feature2ScreenState createState() => _Feature2ScreenState();
}

class _Feature2ScreenState extends State<Feature2Screen> {
  final String apiKey = '88093b848386ab3bf06cd21358b5ae91';
  final String baseUrl = 'https://api.themoviedb.org/3';
  List movies = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchMovies();
  }

  Future<void> _fetchMovies() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/movie/popular?api_key=$apiKey'));
      if (response.statusCode == 200) {
        setState(() {
          movies = json.decode(response.body)['results'];
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = 'Échec du chargement des films';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Une erreur est survenue : $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Films Populaires'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text(errorMessage))
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemCount: movies.length,
                  itemBuilder: (BuildContext context, int index) {
                    var movie = movies[index];
                    var posterPath = 'https://image.tmdb.org/t/p/w500${movie['poster_path']}';
                    return Card(
                      child: Column(
                        children: <Widget>[
                          Image.network(posterPath),
                          Text(movie['title']),
                        ],
                      ),
                    );
                  },
                ),
    );
  }
}
