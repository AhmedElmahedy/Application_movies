import 'package:app_movies/app_colors.dart';
import 'package:app_movies/home/details/details_screen.dart';
import 'package:app_movies/home/names_movies.dart';
import 'package:app_movies/home/new_releases.dart';
import 'package:app_movies/home/recommended.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          /// top Screen
          Expanded(
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return DetailsScreen();
                }));
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.36,
                color: AppColors.background,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 20,
                    itemBuilder: (context , int index){
                      return NamesMovies();
                    })
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,),
          /// center screen (New Releases)
          Container(
            height: MediaQuery.of(context).size.height * 0.210989010989011,
            color: AppColors.heavyMetalColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8 ,top: 5),
                  child: Text('New Releases ',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: 15
                    ),),
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 20,
                      itemBuilder: (context,index) {
                        return  NewReleases();
                      },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,),
          /// bottom screen
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            color: AppColors.heavyMetalColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 6 ,top: 5),
                  child: Text("Recommended",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: 15
                    ),),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 20,
                    scrollDirection: Axis.horizontal,
                      itemBuilder: (context ,index){
                        return Recommended();
                      }),
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}


