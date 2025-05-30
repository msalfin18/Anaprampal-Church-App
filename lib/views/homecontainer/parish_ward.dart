import 'package:anaprampalmtc/Constraints/colors.dart';
import 'package:anaprampalmtc/Constraints/constands.dart';
import 'package:anaprampalmtc/controller/controller.dart';
import 'package:anaprampalmtc/Constraints/appbar.dart';
import 'package:anaprampalmtc/models/models.dart';
import 'package:anaprampalmtc/views/parishdirectory/parishdirectorydetailed.dart';
import 'package:anaprampalmtc/views/parishdirectory/viewallfamily.dart';
import 'package:flutter/material.dart';

class ParihDirectoryScreen extends StatefulWidget {
  const ParihDirectoryScreen({super.key});

  @override
  State<ParihDirectoryScreen> createState() => _ParihDirectoryScreenState();
}

class _ParihDirectoryScreenState extends State<ParihDirectoryScreen> {
  bool isLoading = true;
  final WardController wardcontroller = WardController();
  final TextEditingController _searchController = TextEditingController();
  List<WardModel> _filteredWardList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
    _searchController.addListener(_filterList);
  }

  Future<void> fetchData() async {
    await wardcontroller.getData();
    setState(() {
      _filteredWardList = wardcontroller.wardList;
      isLoading = false;
    });
  }

  void _filterList() {
    String searchText = _searchController.text.toLowerCase();
    setState(() {
      _filteredWardList = wardcontroller.wardList
          .where((ward) => ward.prayerGroup.toLowerCase().contains(searchText))
          .toList();
    });
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() {
      _filteredWardList = wardcontroller.wardList; // Reset to full list
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterList);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themecolor,
        title: const Text(
          "Parish Ward",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: isLoading
          ?  Center(child: constcircularprogrssindicator)
          : Padding(
            padding: const EdgeInsets.all(padding * 0.5),
            child: Column(
              children: [
                sizedboxtw,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: padding * 1),
                  child: TextFormField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: _clearSearch,
                      ),
                      hintText: "Search name",
                    ),
                  ),
                ),
                const SizedBox(height: 12.0), // Space between search and button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ViewAllFamily()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: themecolor,
                      shadowColor: Colors.transparent,
                      elevation: 0,
                      side: const BorderSide(color: Colors.white, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    child: const Text(
                      'VIEW ALL FAMILY',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _filteredWardList.length,
                    itemBuilder: (context, index) {
                      WardModel wardModel = _filteredWardList[index];
                      return Card(
                        elevation: 2,
                        shape: Border.all(style: BorderStyle.none),
                        child: ListTile(
                          
                          tileColor: Colors.white,
                          title: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: padding),
                            child: Text(wardModel.prayerGroup.toUpperCase()),
                          ),
                          trailing:  Padding(
                            padding: const EdgeInsets.symmetric(horizontal: padding * 0.3),
                            child: Icon(Icons.keyboard_arrow_right,color: themecolor,),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Parishdirectorydetailed(
                                  parishwardname: wardModel.prayerGroup,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
