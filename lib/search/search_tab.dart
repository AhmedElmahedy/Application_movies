import 'package:app_movies/app_colors.dart';
import 'package:flutter/material.dart';

import 'custom_search_widget.dart';

class SearchTab extends StatelessWidget {

  @override
 Widget build(BuildContext context) {
  var mediaQuery = MediaQuery.of(context).size;
 return Scaffold(
   backgroundColor: AppColors.background,
     body: Column(

      children: [
        SizedBox(height: mediaQuery.height * 0.08),
        const SearchWidget(
           hint: "Search",

         ),
         Expanded(
           child: Column(

             mainAxisAlignment: MainAxisAlignment.center,

             children: [
              Image.asset(
                 "assets/images/local_movies.png",
               ),
              const Text(
                "No movies found",
                style: TextStyle(color: AppColors.whiteColor, height: 2.5),
               )
             ],
          ),
         ),
       ],
    ),
  );
   }
 }
