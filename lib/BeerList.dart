import 'package:beer_list/Beer.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

String url = 'https://api.punkapi.com/v2/beers';
Future<List<Beer>> getBeers() async {
  var resp = await http.get(url);
  return beerFromJson(resp.body);
}
