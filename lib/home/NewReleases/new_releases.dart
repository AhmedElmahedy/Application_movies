import 'package:app_movies/api/api_manager.dart';
import 'package:app_movies/app_colors.dart';
import 'package:app_movies/home/NewReleases/new_releases_widget.dart';
import 'package:flutter/material.dart';

class NewReleases extends StatefulWidget {
  const NewReleases({super.key});

  @override
  State<NewReleases> createState() => _NewReleasesState();
}

class _NewReleasesState extends State<NewReleases> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getUpcoming(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(color: AppColors.yellowColor));
          } else if (snapshot.hasError) {
            return Column(
              children: [
                const Text('Something Went Wrong.'),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getUpcoming();
                      setState(() {});
                    },
                    child: const Text("Try Again"))
              ],
            );
          }

          /// server => success , error
          if (snapshot.data!.success == false) {
            return Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05),
              child: Column(
                children: [
                  Text(
                    snapshot.data!.statusMessage ?? 'UnKnown error',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        ApiManager.getUpcoming();
                        setState(() {});
                      },
                      child: const Text(
                        "Try Again Server",
                      ))
                ],
              ),
            );
          }
          var list = snapshot.data!.results!;
          return Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  var results = list[index];
                  return NewReleasesWidget(results: results);
                }),
          );
        });

    // return Row(
    //   children: [
    //     Stack(
    //       children: [
    //         Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: ClipRRect(
    //             borderRadius: BorderRadius.circular(6),
    //             child: Image.asset('assets/images/Image.png'),
    //           ),
    //         ),
    //         const Padding(
    //           padding: EdgeInsets.only(top: 5, left: 3),
    //           child: Icon(
    //             Icons.bookmark,
    //             color: AppColors.iconBookMarkColor,
    //           ),
    //         ),
    //         const Padding(
    //           padding: EdgeInsets.all(8.0),
    //           child: Icon(
    //             Icons.add,
    //             color: AppColors.whiteColor,
    //             size: 12,
    //           ),
    //         )
    //       ],
    //     )
    //   ],
    // );
  }
}
