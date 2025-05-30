import 'package:anaprampalmtc/Constraints/background.dart';
import 'package:anaprampalmtc/Constraints/colors.dart';
import 'package:anaprampalmtc/Constraints/constands.dart';
import 'package:anaprampalmtc/controller/controller.dart';
import 'package:anaprampalmtc/Constraints/appbar.dart';
import 'package:anaprampalmtc/models/models.dart';
import 'package:flutter/material.dart';

class ViewAllFamily extends StatefulWidget {
  final String? parishWardName;

  ViewAllFamily({Key? key, this.parishWardName}) : super(key: key);

  @override
  State<ViewAllFamily> createState() => _ViewAllFamilyState();
}

class _ViewAllFamilyState extends State<ViewAllFamily> {
  final TextEditingController _searchController = TextEditingController();
  final Parishdirectorycontroller parishDirectoryController = Parishdirectorycontroller();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchDirectory();
  }

  Future<void> fetchDirectory() async {
    await parishDirectoryController.getparishdirectory();
    setState(() {
      isLoading = false;
    });
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() {}); // Rebuild UI to show the full list
  }

  bool _matchesSearchQuery(ParishdirectoryModel model) {
    String query = _searchController.text.toLowerCase();
    return model.familyName.toLowerCase().contains(query) ||
        model.prayerGroup.toLowerCase().contains(query) ||
        model.familyHead.toLowerCase().contains(query) ||
        model.mobile1.toLowerCase().contains(query);
  }

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: Scaffold(
        appBar: mtcappbar,
        body: Padding(
          padding: const EdgeInsets.all(padding *0.5),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _searchController,
                  onChanged: (query) {
                    setState(() {}); // Rebuild UI based on new search query
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: _clearSearch,
                    ),
                    hintText: "Search...",
                  ),
                ),
                const SizedBox(height: 10),
                isLoading
                    ? constcircularprogrssindicator
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: parishDirectoryController.parishdirectoryList.length,
                        itemBuilder: (context, index) {
                          ParishdirectoryModel parishdirectoryModel =
                              parishDirectoryController.parishdirectoryList[index];
          
                          // Skip items that don't match the search query
                          if (_searchController.text.isNotEmpty && !_matchesSearchQuery(parishdirectoryModel)) {
                            return const SizedBox();
                          }
          
                          return Card(
                            color: whitecolor,
                               shape: Border.all(style: BorderStyle.none),
                            child: SizedBox(
                              height: cardheight,
                              child: Center(
                                child: ListTile(
                                  tileColor: whitecolor,
                                  leading: CircleAvatar(
                                    radius: circleavatarradius,
                                    backgroundColor: Colors.grey,
                                    backgroundImage: parishdirectoryModel.familyPhoto1 != null &&
                                            parishdirectoryModel.familyPhoto1.isNotEmpty
                                        ? NetworkImage(parishdirectoryModel.familyPhoto1)
                                        : null,
                                    child: parishdirectoryModel.familyPhoto1 == null ||
                                            parishdirectoryModel.familyPhoto1.isEmpty
                                        ? const Icon(Icons.people, color: Colors.white)
                                        : null,
                                  ),
                                  title: Padding(
                                    padding: const EdgeInsets.only(left: padding+padding*0.7),
                                    child: ListView(
                                      physics: const NeverScrollableScrollPhysics(),
                                      children: [
                                        Text(parishdirectoryModel.prayerGroup),
                                        Text(parishdirectoryModel.familyName),
                                        Text(
                                          parishdirectoryModel.familyHead,
                                          style: const TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        Text(parishdirectoryModel.mobile1),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
