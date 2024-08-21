import 'package:app_movies/app_colors.dart';
import 'package:flutter/material.dart';

class MoreLikeThis extends StatelessWidget {
  const MoreLikeThis({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Stack(
          children: [
            /// Image
            Padding(
              padding: const EdgeInsets.only(top:8 ,left:8 ,right: 8),
              child: Image.asset('assets/images/Image.png',
                height: MediaQuery.of(context).size.height *0.15,),
            ),
            /// Icon Book mark
            const Padding(
              padding: EdgeInsets.only(
                  top: 5,left: 3
              ),
              child: Icon(Icons.bookmark,
                color: AppColors.iconBookMarkColor,),
            ),
            /// Icon add
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.add,
                color: AppColors.whiteColor,
                size: 12,),
            )
          ],
        ),
        Container(
          decoration: BoxDecoration(
              color: AppColors.iconBookMarkColor,
              borderRadius: BorderRadius.circular(4)),
          height: MediaQuery.of(context).size.height *0.1,
          width: MediaQuery.of(context).size.width *0.21,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("7.7",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: 10
                  ),),
                Text("Deadpool 2",style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 10
                ),),
                Text("2018  R  1h 59m",style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 8
                ),),
              ],
            ),
          ),
        )
      ],
    );
  }
}