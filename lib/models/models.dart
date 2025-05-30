
import 'package:anaprampalmtc/controller/controller.dart';

//..................................Homescreen...........................

class HomeScreenImageModel {
  final String id;
  final String imageName;
  final String title;
  final String status;

  HomeScreenImageModel({required this.id, required this.imageName, required this.title, required this.status});

  factory HomeScreenImageModel.fromJson(Map<String, dynamic> json) {
    return HomeScreenImageModel(
      id: json['id'],
      imageName: json['imagename'],
      title: json['title'],
      status: json['status'],
    );
  }
}


class BottomHomeimgModel {
  final String bottomImageUrl;

  BottomHomeimgModel({required this.bottomImageUrl});

  factory BottomHomeimgModel.fromJson(Map<String, dynamic> json) {
    return BottomHomeimgModel(
      bottomImageUrl: json['bottom'],  // Handling null values with default empty string
    );
  }
}









class WardModel {
  final String id;
  final String prayerGroup;
  final String authorizedPersonsDetails;
  final String regionName;
  final String wardImage;

  WardModel({
    required this.id,
    required this.prayerGroup,
    required this.authorizedPersonsDetails,
    required this.regionName,
    required this.wardImage,
  });

  factory WardModel.fromJson(Map<String, dynamic> json) {
    return WardModel(
      id: json['id'],
      prayerGroup: json['prayer_group'],
      authorizedPersonsDetails: json['authorized_persons_details'],
      regionName: json['region_name'],
      wardImage: json['ward_image'],
    );
  }
}




class ParishdirectoryModel {
 
    String id;
    String familyName;
    String familyHead;
    String prayerGroup;
    String landNo;
    String mobile1;
    String mobile2;
    String mailId;
    String familyPhoto1;
    String familyPhoto2;
    String slab;
    String monthlyAmount;
    String previousDue;
    String address;
    String presentAddress;
    String remark;
    String joinDate;
    String familyRefNo;
    String regionFamilyName;
    String regionFamilyHead;
    String status;
    String latitude;
    String longitude;

    ParishdirectoryModel({
        required this.id,
        required this.familyName,
        required this.familyHead,
        required this.prayerGroup,
        required this.landNo,
        required this.mobile1,
        required this.mobile2,
        required this.mailId,
        required this.familyPhoto1,
        required this.familyPhoto2,
        required this.slab,
        required this.monthlyAmount,
        required this.previousDue,
        required this.address,
        required this.presentAddress,
        required this.remark,
        required this.joinDate,
        required this.familyRefNo,
        required this.regionFamilyName,
        required this.regionFamilyHead,
        required this.status,
        required this.latitude,
        required this.longitude,
    });


  factory ParishdirectoryModel.fromJson(Map<String, dynamic> json) {
    
    return ParishdirectoryModel(
         id: json["id"],
        familyName: json["family_name"],
        familyHead: json["family_head"],
        prayerGroup: json["prayer_group"],
        landNo: json["land_no"],
        mobile1: json["mobile_1"],
        mobile2: json["mobile_2"],
        mailId: json["mail_id"],
        familyPhoto1: json["family_photo_1"],
        familyPhoto2: json["family_photo_2"],
        slab: json["slab"],
        monthlyAmount: json["monthly_amount"],
        previousDue: json["previous_due"],
        address: json["address"],
        presentAddress: json["present_address"],
        remark: json["remark"],
        joinDate: json["join_date"],
        familyRefNo: json["family_ref_no"],
        regionFamilyName: json["region_family_name"],
        regionFamilyHead: json["region_family_head"],
        status: json["status"],
        latitude: json["latitude"],
        longitude: json["Longitude"],
        
    );
  }
}





class BishopModel {
  final String id;
  final String groupName;
  final String position;
  final List<Member> members;

  BishopModel({
    required this.id,
    required this.groupName,
    required this.position,
    required this.members,
  });

  // Factory method to create a Group from JSON
  factory BishopModel.fromJson(Map<String, dynamic> json) {
    return BishopModel(
      id: json['id'],
      groupName: json['group_name'],
      position: json['position'],
      members: (json['members'] as List<dynamic>)
          .map((memberJson) => Member.fromJson(memberJson))
          .toList(),
    );
  }
}

class Member {
  final String id;
  final String groupName;
  final String name;
  final String contactNo;
  final String mailId;
  final DateTime? fromDate;
  final DateTime? toDate;
  final String remark;
  final String photo;
  final int attendance;
  final String role;
  final int position;

  Member({
    required this.id,
    required this.groupName,
    required this.name,
    required this.contactNo,
    required this.mailId,
    this.fromDate,
    this.toDate,
    required this.remark,
    required this.photo,
    required this.attendance,
    required this.role,
    required this.position,
  });

  // Factory method to create a Member from JSON
  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      id: json['id'],
      groupName: json['group_name'],
      name: json['name'],
      contactNo: json['contact_no'],
      mailId: json['mail_id'],
      fromDate: _parseDate(json['from_date']),
      toDate: _parseDate(json['to_date']),
      remark: json['remark'],
      photo: json['photo'] ,
      attendance: int.parse(json['attendance'] ),
      role: json['role'],
      position: int.parse(json['position']),
    );
  }

  // Helper method to parse date strings to DateTime
  static DateTime? _parseDate(String dateString) {
    try {
      return dateString.isNotEmpty ? DateTime.parse(dateString) : null;
    } catch (_) {
      return null;
    }
  }
}

class DataModel {
  final List<BishopModel> data;

  DataModel({required this.data});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      data: (json['data'] as List<dynamic>)
          .map((groupJson) => BishopModel.fromJson(groupJson))
          .toList(),
    );
  }
}



class KaisthanasmithiModel {
    String id;
    String name;
    String contactNo;
    String mailId;
    DateTime fromDate;
    DateTime toDate;
    String remark;
    String photo;
    String role;
    String position;
  KaisthanasmithiModel({


       required this.id,
        required this.name,
        required this.contactNo,
        required this.mailId,
        required this.fromDate,
        required this.toDate,
        required this.remark,
        required this.photo,
        required this.role,
        required this.position,
      
      });

  factory KaisthanasmithiModel.fromJson(Map<String, dynamic> json) {
    return KaisthanasmithiModel(
        id: json["id"],
        name: json["name"],
        contactNo: json["contact_no"],
        mailId: json["mail_id"],
        fromDate: DateTime.parse(json["from_date"]),
        toDate: DateTime.parse(json["to_date"]),
        remark: (json["remark"]),
        photo: json["photo"],
        role: json["role"],
        position: json["position"],
    );
  }
}




class ParishPriestModel {
     String id;
    String parishPriestName;
    String address;
    String landNo;
    String mobile;
    String mailId;
    String parishPriestPhoto;
    String position;

  ParishPriestModel({


        required this.id,
        required this.parishPriestName,
        required this.address,
        required this.landNo,
        required this.mobile,
        required this.mailId,
        required this.parishPriestPhoto,
        required this.position,
      
      });

  factory ParishPriestModel.fromJson(Map<String, dynamic> json) {
    return ParishPriestModel(

        id: json["id"],
        parishPriestName: json["parish_priest_name"],
        address: json["address"],
        landNo: json["land_no"],
        mobile: json["mobile"],
        mailId: json["mail_id"],
        parishPriestPhoto: json["parish_priest_photo"],
        position: json["position"],
    );
  }
}


class SemnariansModel {
    String id;
    String groupName;
    String name;
    String address;
    String landNo;
    String mobile;
    String mailId;
    String photo;
    String position;
  SemnariansModel({


        required this.id,
        required this.groupName,
        required this.name,
        required this.address,
        required this.landNo,
        required this.mobile,
        required this.mailId,
        required this.photo,
        required this.position,
      
      });

  factory SemnariansModel.fromJson(Map<String, dynamic> json) {
    return SemnariansModel(

        id: json["id"],
        groupName: json["group_name"],
        name: json["name"],
        address: json["address"],
        landNo: json["land_no"],
        mobile: json["mobile"],
        mailId: json["mail_id"],
        photo: json["photo"],
        position: json["position"],
    );
  }
}



class EvangelistModel {
    String id;
    String groupName;
    String name;
    String address;
    String landNo;
    String mobile;
    String mailId;
    String photo;
    String position;


  EvangelistModel({

        required this.id,
        required this.groupName,
        required this.name,
        required this.address,
        required this.landNo,
        required this.mobile,
        required this.mailId,
        required this.photo,
        required this.position,
      
      });

  factory EvangelistModel.fromJson(Map<String, dynamic> json) {
    return EvangelistModel(

        id: json["id"],
        groupName: json["group_name"],
        name: json["name"],
        address: json["address"],
        landNo: json["land_no"],
        mobile: json["mobile"],
        mailId: json["mail_id"],
        photo: json["photo"],
        position: json["position"],
    );
  }
}




class InstitutionandchapelsModel {
    String id;
    String name;
    String landNo;
    String mobile;
    String mailId;
    String photo;
    String category;
    String address;
    String descriptions;



  InstitutionandchapelsModel({

        required this.id,
        required this.name,
        required this.landNo,
        required this.mobile,
        required this.mailId,
        required this.photo,
        required this.category,
        required this.address,
        required this.descriptions,
      
      });

  factory InstitutionandchapelsModel.fromJson(Map<String, dynamic> json) {
    return InstitutionandchapelsModel(
        id: json["id"],
        name: json["name"],
        landNo: json["land_no"],
        mobile: json["mobile"],
        mailId: json["mail_id"],
        photo: json["photo"],
        category: json["category"],
        address: json["address"],
        descriptions:json["descriptions"],
    );
  }
}



class PresentVicarModel {
    String id;
    String vicarName;
    String vicarChurch;
    String address;
    String vicarMessage;
    String landNo;
    String mobile;
    String mailId;
    String startDate;
    String endDate;
    String status;
    String vicarPhoto;

  PresentVicarModel({
        required this.id,
        required this.vicarName,
        required this.vicarChurch,
        required this.address,
        required this.vicarMessage,
        required this.landNo,
        required this.mobile,
        required this.mailId,
        required this.startDate,
        required this.endDate,
        required this.status,
        required this.vicarPhoto,
      
      });

  factory PresentVicarModel.fromJson(Map<String, dynamic> json) {
    return PresentVicarModel(
        id: json["id"],
        vicarName: json["vicar_name"],
        vicarChurch: json["vicar_church"],
        address: json["address"],
        vicarMessage: json["vicar_message"],
        landNo: json["land_no"],
        mobile: json["mobile"],
        mailId: json["mail_id"],
        startDate: json["start_date"],
        endDate: json["end_date"],
        status: json["status"],
        vicarPhoto: json["vicar_photo"],
    );
  }
}




class VicarMessageModel {
    String id;
    String vicarName;
    String publishDate;
    String title;
    String description;
    String status;

  VicarMessageModel({
        required this.id,
        required this.vicarName,
        required this.publishDate,
        required this.title,
        required this.description,
        required this.status,
      
      });

  factory VicarMessageModel.fromJson(Map<String, dynamic> json) {
    return VicarMessageModel(
        id: json["id"],
        vicarName: json["vicar_name"],
        publishDate: json["publish_date"],
        title: json["title"],
        description: json["description"],
        status: json["status"],
    );
  }
}


//former 


class FormerVicarModel {
    String id;
    String vicarName;
    String vicarChurch;
    String address;
    String vicarMessage;
    String landNo;
    String mobile;
    String mailId;
    String startDate;
    String endDate;
    String status;
    String vicarPhoto;

  FormerVicarModel({

            required this.id,
        required this.vicarName,
        required this.vicarChurch,
        required this.address,
        required this.vicarMessage,
        required this.landNo,
        required this.mobile,
        required this.mailId,
        required this.startDate,
        required this.endDate,
        required this.status,
        required this.vicarPhoto,

      
      });

  factory FormerVicarModel.fromJson(Map<String, dynamic> json) {
    return FormerVicarModel(

        id: json["id"],
        vicarName: json["vicar_name"],
        vicarChurch: json["vicar_church"],
        address: json["address"],
        vicarMessage: json["vicar_message"],
        landNo: json["land_no"],
        mobile: json["mobile"],
        mailId: json["mail_id"],
        startDate: json["start_date"],
        endDate: json["end_date"],
        status: json["status"],
        vicarPhoto: json["vicar_photo"],
  
    );
  }
}



class NewsCategoriesModel {
    String id;
    String name;
    String position;


  NewsCategoriesModel({

       required this.id,
        required this.name,
        required this.position,
      
      });

  factory NewsCategoriesModel.fromJson(Map<String, dynamic> json) {
    return NewsCategoriesModel(
        id: json["id"],
        name: json["name"],
        position: json["position"],
  
    );
  }
}


class AuditoriumListmodel {

    String name;

    AuditoriumListmodel({
        required this.name,
    });
    factory AuditoriumListmodel.fromJson(Map<String, dynamic> json) => AuditoriumListmodel(
        name: json["name"],
    );

}





class PrayerReqModel {
  PrayerReqModel();

    factory PrayerReqModel.fromJson(Map<String, dynamic> json) => PrayerReqModel(
    );

    Map<String, dynamic> toJson() => {
    };
}



class AuditoriumViewModel {
    String id;
    String family;
    String firstName;
    String lastName;
    String address;
    String mobile;
    String email;
    String audiName;
    String purpose;
    String bookingDate;
    String bookingTime;
    String status;

    AuditoriumViewModel({
        required this.id,
        required this.family,
        required this.firstName,
        required this.lastName,
        required this.address,
        required this.mobile,
        required this.email,
        required this.audiName,
        required this.purpose,
        required this.bookingDate,
        required this.bookingTime,
        required this.status,
    });

    factory AuditoriumViewModel.fromJson(Map<String, dynamic> json) => AuditoriumViewModel(
        id: json["id"],
        family: json["family"],
        firstName: json["first_name"],
        lastName:json["last_name"],
        address: json["address"],
        mobile: json["mobile"],
        email:json["email"],
        audiName: json["audi_name"],
        purpose:json["purpose"],
        bookingDate: json["booking_date"],
        bookingTime:json["booking_time"],
        status: json["status"]
    );
}



class PrayerViewModel {
  PrayerViewModel();

    factory PrayerViewModel.fromJson(Map<String, dynamic> json) => PrayerViewModel(
    );

    Map<String, dynamic> toJson() => {
    };
}

class ImagecategoryModel {
  String id;
  String type;
  String categoryName;

  ImagecategoryModel({
    required this.id,
    required this.type,
    required this.categoryName,
  });

  factory ImagecategoryModel.fromJson(Map<String, dynamic> json) {
    return ImagecategoryModel(
      id: json["id"] ,
      type: json["type"] ,
      categoryName: json["category_name"] ,
    );
  }
}

class VideoCategoryModel {
    String id;
    String type;
    String categoryName;

    VideoCategoryModel({
        required this.id,
        required this.type,
        required this.categoryName,
    });

    factory VideoCategoryModel.fromJson(Map<String, dynamic> json) => VideoCategoryModel(
        id: json["id"],
        type: json["type"],
        categoryName: json["category_name"],
    );

}


class DownloadFilesModel {
    String id;
    String title;
    String file;

    DownloadFilesModel({
        required this.id,
        required this.title,
        required this.file,
    });

    factory DownloadFilesModel.fromJson(Map<String, dynamic> json) => DownloadFilesModel(
        id: json["id"],
        title: json["title"],
        file: json["file"],
    );
}




class ParishContactModel {
  String id;
  String churchName;
  String address;
  String landNo;
  String mobile1;
  String mobile2;
  String mailId;
  String lat;
  String lon;
  String diocese;
  String webUrl;
  String location;
  String image;
  String backupMailId;
  String regionBillFormat;
  List<ChurchTime> time;

  ParishContactModel({
    required this.id,
    required this.churchName,
    required this.address,
    required this.landNo,
    required this.mobile1,
    required this.mobile2,
    required this.mailId,
    required this.lat,
    required this.lon,
    required this.diocese,
    required this.webUrl,
    required this.location,
    required this.image,
    required this.backupMailId,
    required this.regionBillFormat,
    required this.time,
  });

  factory ParishContactModel.fromJson(Map<String, dynamic> json) {
    return ParishContactModel(
      id: json['id'],
      churchName: json['church_name'],
      address: json['address'],
      landNo: json['land_no'],
      mobile1: json['mobile_1'],
      mobile2: json['mobile_2'],
      mailId: json['mail_id'],
      lat: json['lat'],
      lon: json['lon'],
      diocese: json['diocese'],
      webUrl: json['web_url'],
      location: json['location'],
      image: json['image'],
      backupMailId: json['backup_mail_id'],
      regionBillFormat: json['region_bill_format'],
      time: (json['Time'] as List<dynamic>)
          .map((item) => ChurchTime.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'church_name': churchName,
      'address': address,
      'land_no': landNo,
      'mobile_1': mobile1,
      'mobile_2': mobile2,
      'mail_id': mailId,
      'lat': lat,
      'lon': lon,
      'diocese': diocese,
      'web_url': webUrl,
      'location': location,
      'image': image,
      'backup_mail_id': backupMailId,
      'region_bill_format': regionBillFormat,
      'Time': time.map((item) => item.toJson()).toList(),
    };
  }
}

class ChurchTime {
  String id;
  String title;
  String timing;
  String position;
  String status;

  ChurchTime({
    required this.id,
    required this.title,
    required this.timing,
    required this.position,
    required this.status,
  });

  factory ChurchTime.fromJson(Map<String, dynamic> json) {
    return ChurchTime(
      id: json['id'],
      title: json['title'],
      timing: json['timing'],
      position: json['position'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'timing': timing,
      'position': position,
      'status': status,
    };
  }
}



  class Birthday {
  final String id;
  final String familyId;
  final DateTime bdate;
  final DateTime? anndate; // Nullable
  final String name;
  final String aname;
  final String fname;
  final String? mobile; // Nullable

  Birthday({
    required this.id,
    required this.familyId,
    required this.bdate,
    this.anndate, // Nullable
    required this.name,
    required this.aname,
    required this.fname,
    this.mobile, // Nullable
  });

  // Factory method to parse JSON
  factory Birthday.fromJson(Map<String, dynamic> json) {
    return Birthday(
      id: json['id'] ?? '',
      familyId: json['family_id'] ?? '',
      bdate: DateTime.parse(json['bdate']),
      anndate: json['Anndate'] != null && json['Anndate'] != '0000-00-00'
          ? DateTime.parse(json['Anndate'])
          : null,
      name: json['name'] ?? '',
      aname: json['aname'] ?? '',
      fname: json['fname'] ?? '',
      mobile: json['mobile'], // Nullable
    );
  }
}
