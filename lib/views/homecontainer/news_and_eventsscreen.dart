import 'package:anaprampalmtc/Constraints/appbar.dart';
import 'package:anaprampalmtc/Constraints/constands.dart';
import 'package:anaprampalmtc/components/homescreencomponents.dart';
import 'package:anaprampalmtc/controller/controller.dart';
import 'package:anaprampalmtc/models/models.dart';
import 'package:anaprampalmtc/views/NewsandEvnts/funaraldetails.dart';
import 'package:anaprampalmtc/views/NewsandEvnts/generalnews.dart';
import 'package:anaprampalmtc/views/NewsandEvnts/lectionaryscreen.dart';
import 'package:anaprampalmtc/views/NewsandEvnts/newsletter.dart';
import 'package:anaprampalmtc/views/NewsandEvnts/recentdeaths.dart';
import 'package:anaprampalmtc/views/NewsandEvnts/wishes.dart';
import 'package:flutter/material.dart';
import 'package:anaprampalmtc/Constraints/colors.dart';

class NewsandEvents extends StatefulWidget {
  NewsandEvents({super.key});

  @override
  State<NewsandEvents> createState() => _NewsandEventsState();
}

class _NewsandEventsState extends State<NewsandEvents> {
  final NewsCategoriesController _newsCategoriesController = NewsCategoriesController();

  bool _isLoading = true; // Loading state

  @override
  void initState() {
    super.initState();
    fetchnewscategoriesfunction();
  }

  Future<void> fetchnewscategoriesfunction() async {
    await _newsCategoriesController.fetchnewscategories();
    setState(() {
      _isLoading = false; // Update loading state
    });
  }

  final List<Widget Function()> newsNavigationPages = [
    () => GeneralNewsScreen(),
    () => Recentdeaths(),
    () => WishesScreen(),
    () => NewsLetterScreen(),
    () => Funaraldetails(),
    () => Lectionaryscreen(), // Added Lectionary
  ];
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: themecolor,
      title: Text('News & Events'),
    ),
    body: _isLoading
        ? Center(child: constcircularprogrssindicator)
        : Padding(
            padding: const EdgeInsets.all(padding * 0.3),
            child: ListView.builder(
              itemCount: _newsCategoriesController.newscategoriesList.length + 1, 
              itemBuilder: (context, index) {
                if (index == _newsCategoriesController.newscategoriesList.length) {
             
                  return Card(
                    elevation: cardelevation,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ListTile(
                      tileColor: Colors.white,
                      title: Text(
                        'LECTIONARY',
                        style: boldname,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Lectionaryscreen(), 
                          ),
                        );
                      },
                    ),
                  );
                }

                NewsCategoriesModel newsCategoriesModel =
                    _newsCategoriesController.newscategoriesList[index];
                return Card(
                  elevation: cardelevation,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ListTile(
                    tileColor: Colors.white,
                    title: Text(
                      newsCategoriesModel.name.toUpperCase(),
                      style: boldname,
                    ),
                    onTap: () {
                      if (index < newsNavigationPages.length) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => newsNavigationPages[index](),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Page not available')),
                        );
                      }
                    },
                  ),
                );
              },
            ),
          ),
  );
}
}