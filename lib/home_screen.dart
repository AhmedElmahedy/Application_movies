import 'package:app_movies/app_colors.dart';
import 'package:app_movies/browse/browse_tab.dart';
import 'package:app_movies/home/home_tab.dart';
import 'package:app_movies/my_theme_data.dart';
import 'package:app_movies/search/search_tab.dart';
import 'package:app_movies/watchlist/watch_list_tab.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
static const String routeName = 'Home Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
int selectCurrentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: MyThemeData.darkTheme.primaryColor),
        child: BottomNavigationBar(
          selectedItemColor: AppColors.yellowColor,
          currentIndex: selectCurrentIndex,
          onTap: (index) {
            selectCurrentIndex = index;
            setState(() {});
          },
          items:const [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/Icon Home.png')),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/Icon Search.png')),
                label: 'Search'),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/Icon Browse.png')),
                label: 'Browse'),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/Icon watchlist.png')),
                label: 'watchList'),
          ],
        ),
      ),
      body: tabs[selectCurrentIndex],
    );
  }
  List<Widget> tabs = [
    HomeTab(),SearchTab(),BrowseTab(),WatchListTab()
  ];
}
