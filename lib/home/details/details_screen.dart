import 'package:app_movies/api/api_manager.dart';
import 'package:app_movies/app_colors.dart';
import 'package:app_movies/home/details/more_like_this.dart';
import 'package:app_movies/model/ResponseUpcomingSuccess.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Results results ;
  DetailsScreen({required this.results
  });
  @override
  Widget build(BuildContext context) {

    String baseUrl = 'https://image.tmdb.org/t/p/w500';
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        foregroundColor: AppColors.whiteColor,
        backgroundColor: AppColors.background,
        centerTitle: true,
        title: Text(
          results.title ?? '',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 20),
        ),
      ),
      body: Column(children: [
        /// Top screen
        SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CachedNetworkImage(
                imageUrl: results.backdropPath != null ?
                "$baseUrl${results.backdropPath}":'',
                placeholder: (context, url) => const
                    Center(child: CircularProgressIndicator(color: AppColors.yellowColor)),
                errorWidget: (context, url, error) => const
                    Center(child: Icon(Icons.error, color: AppColors.yellowColor)),
              ),











              /// Center Screen
              Padding(
                padding:  const EdgeInsets.symmetric(horizontal: 6),
                child: Text(results.title ?? '',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontSize: 18
                ),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Text(results.releaseDate ?? '',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: 10,
                      color: AppColors.silverColor
                    )),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: CachedNetworkImage(
                        imageUrl: results.posterPath != null ? "$baseUrl${results.posterPath}" : '',
                      placeholder: (context, url) => Center(child: CircularProgressIndicator(color: AppColors.yellowColor)),
                      errorWidget: (context, url, error) => Center(child: Icon(Icons.error, color: AppColors.yellowColor)),
                      height: MediaQuery.of(context).size.height * 0.23,
                      width: MediaQuery.of(context).size.width * 0.25,
                      fit: BoxFit.fill,
                    )
                  ),
                  SizedBox(
                    width:MediaQuery.of(context).size.width *0.7,
                    height: MediaQuery.of(context).size.height *0.25,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border:  Border.all(width: 1,
                                    color: AppColors.iconBookMarkColor),
                                  ),
                                  child: Text(results.originalTitle ?? '',
                                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontSize: 10,
                                    color: AppColors.silverColor
                                  ),
                                  textAlign: TextAlign.center,),
                                ),
                              ],
                            ),
                          ),
                          Text(results.overview ?? '',
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontSize: 13,
                            color: AppColors.silverColor
                          ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star_rounded,
                              color: AppColors.yellowColor,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("7.7",
                                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                  fontSize: 18
                                ),),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        /// Bottom screen
        Container(
          height: MediaQuery.of(context).size.height * 0.3,
          color: AppColors.heavyMetalColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 6, top: 5),
                child: Text(
                  "More Like This",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontSize: 15),
                ),
              ),
              
              FutureBuilder(
                  future: ApiManager.getSimilarMovies(results.id ?? 0), 
                  builder: (context , snapshot){
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return CircularProgressIndicator();
                    }else if (snapshot.hasError){
                      return Column(
                        children: [
                          Text('Something Went Wrong'),
                          ElevatedButton(onPressed: (){},
                              child: Text("Try again"))
                        ],
                      );
                    }if(snapshot.data!.success == false){
                      return Column(
                        children: [
                          Text('Error: ${snapshot.data!.statusMessage}'),
                          ElevatedButton(onPressed: (){},
                              child: Text("Try again Server"))
                        ],
                      );
                    }
                    var similarList = snapshot.data!.results!;
                    return Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: similarList.length,
                          itemBuilder: (context , index){
                          var similar = similarList[index];
                            return MoreLikeThis(similar: similar);
                          }),
                    );
                  })
            ],
          ),
        )
      ]),
    );
  }
}
// Image.asset(
// 'assets/images/Image.png',
// height: MediaQuery.of(context).size.height * 0.23,
// width: MediaQuery.of(context).size.width * 0.25,
// fit: BoxFit.fill,
// ),



// Expanded(
//   child: ListView.builder(
//     scrollDirection: Axis.horizontal,
//     itemCount: 20,
//       itemBuilder: (context, index) {
//         return MoreLikeThis();
//       }),
// )