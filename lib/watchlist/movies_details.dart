import 'package:flutter/material.dart';
import 'package:app_movies/watchlist/watch_list_tab.dart';

class MoviesDetails extends StatelessWidget {


  String MovieTitle;
  int index;

  MoviesDetails({required this.MovieTitle,required this.index});


  @override
  Widget build(BuildContext context) {
    return
      Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width*0.2,
            height:MediaQuery.of(context).size.width*0.12,
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/Watchlist_image.png",
                  fit: BoxFit.fill,
                  width: 200,
                  height: 120,
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Icon(
                    Icons.check_box_rounded,
                    size: 40,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(MovieTitle),
              Text(
                'Title',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                "Release Date",
                style: TextStyle(color: Colors.white54),
              ),
              SizedBox(height: 10),

            ],
          ),
        ],
      );



  }
}
