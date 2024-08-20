import 'package:app_movies/app_colors.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        child: Column(
          children: [
            /// top Screen
            Container(
              height: MediaQuery.of(context).size.height * 0.36,
              color: AppColors.background,
              child: Stack(
                children:[
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: Image.asset('assets/images/Image_test.png',
                     width: double.infinity,
                    fit: BoxFit.fill,),
                  ),
                  Container(
                    child: Image.asset('assets/images/Image.png',
                    fit: BoxFit.fill,),
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    height: MediaQuery.of(context).size.height * 0.3,
                    margin: EdgeInsets.only(
                        top:MediaQuery.of(context).size.height * 0.12,
                        left:  MediaQuery.of(context).size.height * 0.02,
                        right: MediaQuery.of(context).size.width * 0.6,),
                    // color: AppColors.whiteColor,
                  ),
                  /// text name movies
                  Padding(
                    padding:  EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.26,
                      left: MediaQuery.of(context).size.height * 0.20
                    ),
                    child: Text('Dora and the lost city of gold',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: AppColors.whiteColor
                    )),
                  ),
                  /// Text time movies
                  Padding(
                    padding:  EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.3,
                        left: MediaQuery.of(context).size.height * 0.20
                    ),
                    child: Text('2019  PG-13  2h 7m',
                      style: Theme.of(context).textTheme.titleSmall
                          ?.copyWith(color: AppColors.whiteColor
                      )
                    ),
                  ),
             ] ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,),
            /// center screen
            Container(
              height: MediaQuery.of(context).size.height * 0.210989010989011,
              color: AppColors.heavyMetalColor,
              child: Row(
                children: [],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,),
            /// bottom screen
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              color: AppColors.heavyMetalColor,
              child: Row(
                children: [

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
