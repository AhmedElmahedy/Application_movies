import 'package:app_movies/app_colors.dart';
import 'package:app_movies/home/details/more_like_this.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        foregroundColor: AppColors.whiteColor,
        backgroundColor: AppColors.background,
        title: Text(
          "Dora and the lost city of gold",
          style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 20),
        ),
      ),
      body: Column(children: [
        /// Top screen
        Container(
          height: MediaQuery.of(context).size.height * 0.55,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset("assets/images/Image_test.png",
              fit: BoxFit.fill,),
              Padding(
                padding:  const EdgeInsets.symmetric(horizontal: 6),
                child: Text('Dora and the lost city of gold',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontSize: 18
                ),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Text('2019  PG-13  2h 7m',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: 10,
                      color: AppColors.silverColor
                    )),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Image.asset(
                      'assets/images/Image.png',
                      height: MediaQuery.of(context).size.height * 0.23,
                      width: MediaQuery.of(context).size.width * 0.25,
                      fit: BoxFit.fill,
                    ),
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
                                  child: Text("Action",
                                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontSize: 10
                                  ),
                                  textAlign: TextAlign.center,),

                                ),
                              ],
                            ),
                          ),
                          Text("Having spent most of her life exploring the jungle,"
                              " nothing could prepare Dora for her most dangerous adventure yet"
                              " — high school. ",
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontSize: 13
                          ),),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("7.7",
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontSize: 18
                            ),),
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
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                    itemBuilder: (context, index) {
                      return MoreLikeThis();
                    }),
              )

            ],
          ),
        )
      ]),
    );
  }
}
