import 'package:app_movies/home/NameMovies/name_widget.dart';
import 'package:app_movies/model/ResponsePopularSuccess.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ItemsNameMovies extends StatelessWidget {
  List<Results> resultsList;

  ItemsNameMovies({super.key, required this.resultsList});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items:
            resultsList.map((result) => NameWidget(results: result)).toList(),
        options: CarouselOptions(
            viewportFraction: 1, autoPlay: true, height: double.infinity));
  }
}
