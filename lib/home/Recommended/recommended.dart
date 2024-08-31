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
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              color: AppColors.yellowColor,
            ));
          } else if (snapshot.hasError) {
            return Column(
              children: [
                const Text("Something went wrong"),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getRecommended();
                      setState(() {});
                    },
                    child: const Text("Try Again"))
              ],
            );
          }

          /// server => Success , Error
          if (snapshot.data!.success == false) {
            return Column(
              children: [
                Text(snapshot.data!.statusMessage ?? 'UnKnown error'),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getRecommended();
                      setState(() {});
                    },
                    child: const Text("Try Again Server"))
              ],
            );
          }
          var list = snapshot.data!.results!;
          return Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return RecommendedWidget(results: list[index]);
                }),
          );
        });
  }
}
