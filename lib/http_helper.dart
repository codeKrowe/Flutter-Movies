import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:io';

import 'movie.dart';

// Concurrency is what happens when two or more tasks can start, run, and complete in overlapping time periods.

/*

* Common asynchronous scenarios:

 - Retrieving data from the web
 - Reading and writing data to a file
 - Reading and writing to a local database”

*/

class HttpHelper {
  // Personal API key, in future put details in vault.
  final String urlKey = 'api_key=816aa71a30ea7d4fab87c1acbbf44b24';
  final String urlBase = 'https://api.themoviedb.org/3/movie';
  final String urlUpcoming = '/upcoming?';
  final String urlLanguage = '&language=en-US';
  final String urlSearchBase =
      'https://api.themoviedb.org/3/search/movie?api_key=816aa71a30ea7d4fab87c1acbbf44b24&query=';

  // A Future is used to represent a potential value, or error, that will be available at some time in the future.
  Future<List> getUpcoming() async {
    final String upcoming = urlBase + urlUpcoming + urlKey + urlLanguage;

    /*
    * The await keyword, which only works in functions marked as async, waits for a Future to complete.
    * It won't go to the next line of its thread until it completes this line,
    * behaving a lot like synchronous code, but remember,
    * this happens on a secondary line of execution, so it won't stop the UI thread.
    * */
    http.Response result = await http.get(Uri.parse(upcoming));

    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      return null;
    }
  }

  Future<List> findMovies(String title) async {
    final String query = urlSearchBase + title;
    http.Response result = await http.get(Uri.parse(query));
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      return null;
    }
  }
}
