import 'package:app_movies/api/api_manager.dart';
import 'package:app_movies/app_colors.dart';
import 'package:app_movies/home/Recommended/recommended_widget.dart';
import 'package:flutter/material.dart';

class Recommended extends StatefulWidget {
  const Recommended({super.key});

  @override
  State<Recommended> createState() => _RecommendedState();
}

class _RecommendedState extends State<Recommended> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getRecommended(),
        builder: (context , snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(color: AppColors.yellowColor,));
          }
          else if(snapshot.hasError){
            return Column(
              children: [
                Text("Something went wrong"),
                ElevatedButton(onPressed: (){
                  ApiManager.getRecommended();
                  setState(() {

                  });
                },
                    child: Text("Try Again"))
              ],
            );
          }
          /// server => Success , Error
          if(snapshot.data!.success == false){
            return Column(
              children: [
                Text(snapshot.data!.statusMessage ?? 'UnKnown error'),
                ElevatedButton(onPressed: (){
                  ApiManager.getRecommended();
                  setState(() {
                  });
                },
                    child: Text("Try Again Server"))
              ],
            );
          }
          var list = snapshot.data!.results!;
          return Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
                itemCount: list.length,
                itemBuilder: (context , index){
                  return  RecommendedWidget(results: list[index]);
                }
            ),
          );
        });



    // return  Column(
    //   children: [
    //     Stack(
    //       children: [
    //         /// Image
    //         Padding(
    //           padding: const EdgeInsets.only(top:8 ,left:8 ,right: 8),
    //           child: Image.asset('assets/images/Image.png',
    //             height: MediaQuery.of(context).size.height *0.15,),
    //         ),
    //         /// Icon Book mark
    //         const Padding(
    //           padding: EdgeInsets.only(
    //               top: 5,left: 3
    //           ),
    //           child: Icon(Icons.bookmark,
    //             color: AppColors.iconBookMarkColor,),
    //         ),
    //         /// Icon add
    //         const Padding(
    //           padding: EdgeInsets.all(8.0),
    //           child: Icon(Icons.add,
    //             color: AppColors.whiteColor,
    //             size: 12,),
    //         )
    //       ],
    //     ),
    //     Container(
    //       decoration: BoxDecoration(
    //           color: AppColors.iconBookMarkColor,
    //           borderRadius: BorderRadius.circular(4)),
    //       height: MediaQuery.of(context).size.height *0.1,
    //       width: MediaQuery.of(context).size.width *0.21,
    //       child: Padding(
    //         padding: const EdgeInsets.all(4.0),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.stretch,
    //           children: [
    //             Text("7.7",
    //               style: Theme.of(context).textTheme.titleSmall?.copyWith(
    //                   fontSize: 10
    //               ),),
    //             Text("Deadpool 2",style: Theme.of(context).textTheme.titleSmall?.copyWith(
    //                 fontSize: 10
    //             ),),
    //             Text("2018  R  1h 59m",style: Theme.of(context).textTheme.titleSmall?.copyWith(
    //                 fontSize: 8
    //             ),),
    //           ],
    //         ),
    //       ),
    //     )
    //   ],
    // );
  }
}