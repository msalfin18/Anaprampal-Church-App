import 'package:anaprampalmtc/Constraints/APIs.dart';
import 'package:anaprampalmtc/Constraints/colors.dart';
import 'package:anaprampalmtc/Constraints/constands.dart';
import 'package:anaprampalmtc/controller/controller.dart';
import 'package:anaprampalmtc/Constraints/appbar.dart';
import 'package:anaprampalmtc/models/models.dart';
import 'package:anaprampalmtc/views/parishdirectory/member_details_screen.dart';
import 'package:flutter/material.dart';

class Parishdirectorydetailed extends StatefulWidget {
  String parishwardname;
  Parishdirectorydetailed({Key? key, required this.parishwardname})
      : super(key: key);

  @override
  State<Parishdirectorydetailed> createState() =>
      _ParishdirectorydetailedState();
}

class _ParishdirectorydetailedState extends State<Parishdirectorydetailed> {
  final TextEditingController _searchController = TextEditingController();
  final Parishdirectorycontroller parishdirectorycontroller =
      Parishdirectorycontroller();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchDirectory();
  }

  Future<void> fetchDirectory() async {
    await parishdirectorycontroller.getparishdirectory();
    setState(() {
      isLoading = false;
    });
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() {});
  }

  bool _isMatchingSearchQuery(ParishdirectoryModel model) {
    final query = _searchController.text.toLowerCase();
    return model.familyName.toLowerCase().contains(query) ||
           model.familyHead.toLowerCase().contains(query) ||
           model.prayerGroup.toLowerCase().contains(query) ||
           model.mobile1.toLowerCase().contains(query) ||
           model.mobile2.toLowerCase().contains(query) ||
           model.mailId.toLowerCase().contains(query) ||
           model.address.toLowerCase().contains(query) ||
           model.presentAddress.toLowerCase().contains(query) ||
           model.remark.toLowerCase().contains(query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  hintText: "Search",
                ),
              ),
             sizedboxten,
              isLoading
                  ? constcircularprogrssindicator
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount:
                          parishdirectorycontroller.parishdirectoryList.length,
                      itemBuilder: (context, index) {
                        ParishdirectoryModel parishdirectoryModel =
                            parishdirectorycontroller.parishdirectoryList[index];
        
                        // Filter by parish ward name and search query
                        if (parishdirectoryModel.prayerGroup.toLowerCase() !=
                            widget.parishwardname.toLowerCase()) {
                          return SizedBox();
                        }
        
                        if (_searchController.text.isNotEmpty &&
                            !_isMatchingSearchQuery(parishdirectoryModel)) {
                          return SizedBox();
                        }
        
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MemberDetailsScreen(
                                  id: parishdirectoryModel.id,
                                  familyName: parishdirectoryModel.familyName,
                                  familyHead: parishdirectoryModel.familyHead,
                                  prayerGroup: parishdirectoryModel.prayerGroup,
                                  landNo: parishdirectoryModel.landNo,
                                  mobile1: parishdirectoryModel.mobile1,
                                  mobile2: parishdirectoryModel.mobile2,
                                  mailId: parishdirectoryModel.mailId,
                                  familyPhoto1: parishdirectoryModel.familyPhoto1,
                                  familyPhoto2: parishdirectoryModel.familyPhoto2,
                                  slab: parishdirectoryModel.slab,
                                  monthlyAmount: parishdirectoryModel.monthlyAmount,
                                  previousDue: parishdirectoryModel.previousDue,
                                  address: parishdirectoryModel.address,
                                  presentAddress: parishdirectoryModel.presentAddress,
                                  remark: parishdirectoryModel.remark,
                                  joinDate: parishdirectoryModel.joinDate,
                                  familyRefNo: parishdirectoryModel.familyRefNo,
                                  regionFamilyName: parishdirectoryModel.regionFamilyName,
                                  regionFamilyHead: parishdirectoryModel.regionFamilyHead,
                                  status: parishdirectoryModel.status,
                                  latitude: parishdirectoryModel.latitude,
                                  longitude: parishdirectoryModel.longitude,
                                ),
                              ),
                            );
                          },
                          child: Card(
                          elevation: cardelevation,
                             shape: Border.all(style: BorderStyle.none),
                            child: SizedBox(
                              // height: cardheight,
                              child: Center(
                                child: ListTile(
                                   tileColor: whitecolor,
                                  leading: CircleAvatar(
                                    radius: circleavatarradius,
                                    backgroundColor: whitecolor,
                                    backgroundImage: parishdirectoryModel
                                                .familyPhoto1 !=
                                            null &&
                                        parishdirectoryModel.familyPhoto1.isNotEmpty
                                        ? NetworkImage('${FAMIMG}${parishdirectoryModel.familyPhoto1}')
                                        : null,
                                    child: parishdirectoryModel.familyPhoto1 == null ||
                                            parishdirectoryModel.familyPhoto1.isEmpty
                                        ? Icon(Icons.person, color: Colors.white)
                                        : null,
                                  ),
                                  title: Padding(
                                    padding: const EdgeInsets.only(left: padding+padding*0.7),
                                    child: ListView(
                                      physics: NeverScrollableScrollPhysics(),
                                      children: [
                                        
                                        Text(parishdirectoryModel.prayerGroup),
                                        Text(parishdirectoryModel.familyName),
                                        Text(
                                          parishdirectoryModel.familyHead,
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        Text(parishdirectoryModel.mobile1),
                                      ],
                                    ),
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
    );
  }
}
