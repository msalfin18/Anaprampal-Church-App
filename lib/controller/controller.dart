// home_screen_image_controller.dart

import 'dart:convert';
import 'package:anaprampalmtc/Constraints/APIs.dart';
import 'package:anaprampalmtc/models/models.dart';
import 'package:http/http.dart' as http;






// class HomeScreenImageController {
//   List<ImageModel> images = [];
//   String bottomImage = '';
//   bool success = false;

//   Future<void> fetchImages(String url) async {
//     try {
//       final response = await http.get(Uri.parse(url));
//       if (response.statusCode == 200) {
//         ResponseModel responseModel = ResponseModel.fromJson(json.decode(response.body));
//         images = responseModel.data;
//         bottomImage = responseModel.bottomImage;
//         success = responseModel.success;
//       } else {
//         throw Exception('Failed to load images');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
// }
// //////////





class HomeScreenImageController {
  List<HomeScreenImageModel> images = [];

  Future<void> fetchImages() async {
    try {
      final response = await http.get(Uri.parse(SLIDER_IMAGES_URL));

      if (response.statusCode == 200) {
        print(response.body);
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> imageData = data['data'];

        images = imageData.map((image) => HomeScreenImageModel.fromJson(image)).toList();
      } else {
        throw Exception('Failed to load images');
      }
    } catch (e) {
      // Handle the error, you can replace this with proper error UI or logging
      print('Error occurred: $e');
    }
  }
}


class BottomHomeimgController {
  late BottomHomeimgModel bottomImage;

  Future<void> fetchBottomImage() async {
    final response = await http.get(Uri.parse(SLIDER_IMAGES_URL));
    
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      bottomImage = BottomHomeimgModel.fromJson(data['image']);
    } else {
      throw Exception('Failed to load bottom image');
    }
  }
}



class WardController {
  List<WardModel> wardList = [];

  Future<void> getData() async {

    final urlw = Uri.parse(WARD_LIST_URL);

    try {
      final response = await http.get(urlw);
      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
       

        // Access the 'data' key in the decoded JSON
        if (decodedData['data'] is List) {
      
          wardList = (decodedData['data'] as List)
              .map<WardModel>((json) => WardModel.fromJson(json))
              .toList();
        } else {
          wardList = [
            WardModel.fromJson(decodedData['data'])
          ];
        }
      } else {
        print("Failed to load data: ${response.statusCode}");
      }
    } catch (error) {
      print("Error: $error");
    }
  }
}

class Parishdirectorycontroller {
  List<ParishdirectoryModel> parishdirectoryList = [];

  Future<void> getparishdirectory() async {

    final urlp = Uri.parse(PARISH_DIRECTORY_URL);

    try {
      final response = await http.get(urlp);
    
      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
       

        // Access the 'data' key in the decoded JSON
        if (decodedData['data'] is List) {
      
          parishdirectoryList = (decodedData['data'] as List)
              .map<ParishdirectoryModel>((json) => ParishdirectoryModel.fromJson(json))
              .toList();
        } else {
          parishdirectoryList = [
            ParishdirectoryModel.fromJson(decodedData['data'])
          ];
        }
      } else {
        print("Failed to load data: ${response.statusCode}");
      }
    } catch (error) {
      print("Error: $error");
    }
  }
}




// our parish 

// class BishopsController {
//   List<BishopModel> bishopsList = [];

//   Future<void> fetchbishopsdata() async {
//     try {
//       final response = await http.get(Uri.parse(BISHOPSANDOFFCIALS));

//       if (response.statusCode == 200) {

//         final Map<String, dynamic> data = json.decode(response.body);
//         final List<dynamic> bishopsData = data['data'];  // Access the data list directly

//         bishopsList = bishopsData
//             .map((json) => BishopModel.fromJson(json))
//             .toList();

      
//       } else {
//         throw Exception('Failed to load data');
//       }
//     } catch (e) {
//       print('Error occurred: $e');
//     }
//   }
// }




class KaisthanasmithiController {
  List<KaisthanasmithiModel> KaisthanasmithiList = [];
 
  Future<void> fetchKaisthanasmithi() async {
    print('cotrller');
    try {
      final response = await http.get(Uri.parse(KAISTHANASAMITHI));

      if (response.statusCode == 200) {

        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> kaisthanasmithData = data['data'];

        // Properly map the fetched data to the model
        KaisthanasmithiList = kaisthanasmithData
            .map((item) => KaisthanasmithiModel.fromJson(item))
            .toList();
      } else {
        throw Exception('Failed to load images');
      }
    } catch (e) {

      print('Error occurred: $e');
    }
  }
}



class  ParishPriestController {
  List<ParishPriestModel> ParishPriestList = [];
 
  Future<void> fetchParishPriest ()async {
    
    try {
      final response = await http.get(Uri.parse(PARISHPRIEST));

      if (response.statusCode == 200) {

        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> ParishPriestData = data['data'];

        // Properly map the fetched data to the model
        ParishPriestList = ParishPriestData
            .map((priest) => ParishPriestModel.fromJson(priest))
            .toList();
      } else {
        throw Exception('Failed to load images');
      }
    } catch (e) {
      // Handle the error, you can replace this with proper error UI or logging
      print('Error occurred: $e');
    }
  }
}


class  SeminariansController {
  List<SemnariansModel> SeminarianstList = [];
 
  Future<void> fetchSeminariance ()async {
    
    try {
      final response = await http.get(Uri.parse(SEMINARIANS));

      if (response.statusCode == 200) {

        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> SeminariansData = data['data'];

        // Properly map the fetched data to the model
        SeminarianstList = SeminariansData
            .map((seminrians) => SemnariansModel.fromJson(seminrians))
            .toList();
      } else {
        throw Exception('Failed to load images');
      }
    } catch (e) {
      // Handle the error, you can replace this with proper error UI or logging
      print('Error occurred: $e');
    }
  }
}



class  EvenglistController {
  List<EvangelistModel> EvangelisttList = [];
 
  Future<void> fetchevengelist ()async {
    
    try {
      final response = await http.get(Uri.parse(EVANGELISTS));

      if (response.statusCode == 200) {

        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> EvangelistData = data['data'];

        // Properly map the fetched data to the model
        EvangelisttList = EvangelistData
            .map((evangelist) => EvangelistModel.fromJson(evangelist))
            .toList();
      } else {
        throw Exception('Failed to load images');
      }
    } catch (e) {
      // Handle the error, you can replace this with proper error UI or logging
      print('Error occurred: $e');
    }
  }
}




class  InstitutionandchapelsController {
  List<InstitutionandchapelsModel> InstitutionandchapelsList = [];
 
  Future<void> fetchinstitutionandchapels()async {
    
    try {
      final response = await http.get(Uri.parse(INSTITUTIONSANDCHAPELS));

      if (response.statusCode == 200) {
 
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> InstitutionandchapelsData = data['data'];

        // Properly map the fetched data to the model
        InstitutionandchapelsList = InstitutionandchapelsData
            .map((insandcahpls) => InstitutionandchapelsModel.fromJson(insandcahpls))
            .toList();
      } else {
        throw Exception('Failed to load images');
      }
    } catch (e) {
      // Handle the error, you can replace this with proper error UI or logging
      print('Error occurred: $e');
    }
  }
}


class  PresentVicarController {
  List<PresentVicarModel> PresentvicarList = [];
 
  Future<void> fetchPresentVicar()async {
    
    try {
      final response = await http.get(Uri.parse(PRESENT_VICAR));

      if (response.statusCode == 200) {
       
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> PresentvicarData = data['data'];

        // Properly map the fetched data to the model
        PresentvicarList = PresentvicarData
            .map((prstvcr) => PresentVicarModel.fromJson(prstvcr))
            .toList();
      } else {
        throw Exception('Failed to load images');
      }
    } catch (e) {
      // Handle the error, you can replace this with proper error UI or logging
      print('Error occurred: $e');
    }
  }
}




class  FormervicarController {
  List<FormerVicarModel> FomrervicarList = [];
 
  Future<void> fetchFormerVicar()async {
    
    try {
      final response = await http.get(Uri.parse(FORMER_VICAR));

      if (response.statusCode == 200) {
       
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> FomrervicarData = data['data'];

        // Properly map the fetched data to the model
             FomrervicarList = FomrervicarData
            .map((prstvcr) => FormerVicarModel.fromJson(prstvcr))
            .toList();
      } else {
        throw Exception('Failed to load images');
      }
    } catch (e) {
      // Handle the error, you can replace this with proper error UI or logging
      print('Error occurred: $e');
    }
  }
}



class  VicarmessageController {
  List<VicarMessageModel> vicarmessageList = [];
 
  Future<void> fetchVicarmessage()async {
    
    try {
      final response = await http.get(Uri.parse(VICARMESSAGE));

      if (response.statusCode == 200) {
       
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> VicarMessageData = data['data'];

        // Properly map the fetched data to the model
             vicarmessageList = VicarMessageData
            .map((vcrmsg) => VicarMessageModel.fromJson(vcrmsg))
            .toList();
      } else {
        throw Exception('Failed to load images');
      }
    } catch (e) {
      // Handle the error, you can replace this with proper error UI or logging
      print('Error occurred: $e');
    }
  }
}



class  NewsCategoriesController {
  List<NewsCategoriesModel> newscategoriesList = [];
 
  Future<void> fetchnewscategories()async {
    
    try {
      final response = await http.get(Uri.parse(EVENTCATEGORIES));

      if (response.statusCode == 200) {
       
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> newscategoriesData = data['data'];

        // Properly map the fetched data to the model
             newscategoriesList = newscategoriesData
            .map((news) => NewsCategoriesModel.fromJson(news))
            .toList();
      } else {
        throw Exception('Failed to load images');
      }
    } catch (e) {
      // Handle the error, you can replace this with proper error UI or logging
      print('Error occurred: $e');
    }
  }
}



class  AuditoriumListController {
  List<AuditoriumListmodel> auditoriumList = [];
 
  Future<void> fetchauditorium()async {
    
    try {
      final response = await http.get(Uri.parse(AUDITORIUM_LIST));

      if (response.statusCode == 200) {
       
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> auditoriumData = data['data'];

        // Properly map the fetched data to the model
             auditoriumList = auditoriumData
            .map((audlst) => AuditoriumListmodel.fromJson(audlst))
            .toList();
      } else {
        throw Exception('Failed to load images');
      }
    } catch (e) {
      // Handle the error, you can replace this with proper error UI or logging
      print('Error occurred: $e');
    }
  }
}



class PrayerreqListController {
  List<PrayerReqModel> prayerreqList = [];

  Future<void> fetchPrayerReq() async {
    try {
      final response = await http.get(Uri.parse(PRAYER_LIST));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> prayerReqData = data['data'];

        prayerreqList = prayerReqData
            .map((prayerReq) => PrayerReqModel.fromJson(prayerReq))
            .toList();
      } else {
        throw Exception('Failed to load prayer requests');
      }
    } catch (e) {

      print('Error occurred: $e');
    }
  }
}


class  AuditoriumViewController {
  List<AuditoriumViewModel> auditoriumviewList = [];
 
  Future<void> fetchauditoriumview()async {
    
    try {
      final response = await http.get(Uri.parse(AUDITORIUM_VIEW));

      if (response.statusCode == 200) {
        print(response.body);
       
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> auditoriumViewData = data['data'];

        // Properly map the fetched data to the model
             auditoriumviewList = auditoriumViewData
            .map((audview) => AuditoriumViewModel.fromJson(audview))
            .toList();
      } else {
        throw Exception('Failed to load images');
      }
    } catch (e) {

      print('Error occurred: $e');
    }
  }
}

class PrayerreqViewController {
  List<PrayerViewModel> prayerViewList = [];

  Future<void> fetchPrayerview() async {
    try {
      final response = await http.get(Uri.parse(PRAYER_VIEW));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> prayerviewData = data['data'];

        prayerViewList = prayerviewData
            .map((prayerview) => PrayerViewModel.fromJson(prayerview))
            .toList();
      } else {
        throw Exception('Failed to load prayer requests');
      }
    } catch (e) {

      print('Error occurred: $e');
    }
  }
}



class  ImagesCategoryController {
  List<ImagecategoryModel> imagecategoryList = [];
 Future<void> fetchImagecategory() async {
  try {
    final response = await http.get(Uri.parse(IMAGE_GALLERY_LIST));

    if (response.statusCode == 200) {
      print(response.body);

      final Map<String, dynamic> data = json.decode(response.body);
      
      // Iterate through the list of lists and extract the data
      final List<dynamic> ImagescategoryData = [];
      for (var categoryList in data['data']) {
        // categoryList is a list, so you can add the content directly to ImagescategoryData
        ImagescategoryData.addAll(categoryList);
      }

      imagecategoryList = ImagescategoryData
          .map((img) => ImagecategoryModel.fromJson(img))
          .toList();
    } else {
      throw Exception('Failed to load images');
    }
  } catch (e) {
    print('Error occurred: $e');
  }
}

}




class videoCategoryController {
  List<VideoCategoryModel> videocategoryList = [];
 Future<void> fetchVideocategory() async {
  try {
    final response = await http.get(Uri.parse(VIDEO_GALLERY_LIST));

    if (response.statusCode == 200) {
      print(response.body);

      final Map<String, dynamic> data = json.decode(response.body);
      
      // Iterate through the list of lists and extract the data
      final List<dynamic> VideocategoryData = [];
      for (var videoList in data['data']) {
        // categoryList is a list, so you can add the content directly to ImagescategoryData
        VideocategoryData.addAll(videoList);
      }

      videocategoryList = VideocategoryData
          .map((vdo) => VideoCategoryModel.fromJson(vdo))
          .toList();
    } else {
      throw Exception('Failed to load images');
    }
  } catch (e) {
    print('Error occurred: $e');
  }
}

}



class  DownloadFilesController {
  List<DownloadFilesModel> downloadFilesList = [];
 
  Future<void> fetchdownloadfiles()async {
    
    try {
      final response = await http.get(Uri.parse(DOWNLOAD_FILES));

      if (response.statusCode == 200) {
       
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> downloadfilesData = data['data'];

        // Properly map the fetched data to the model
             downloadFilesList = downloadfilesData
            .map((file) => DownloadFilesModel.fromJson(file))
            .toList();
      } else {
        throw Exception('Failed to load images');
      }
    } catch (e) {
      // Handle the error, you can replace this with proper error UI or logging
      print('Error occurred: $e');
    }
  }
}


class  ParishContactController {
  List<ParishContactModel> parishcontactList = [];
 
  Future<void> fetchchparishcontact()async {
    
    try {
      final response = await http.get(Uri.parse(PARISH_CONTACT));

      if (response.statusCode == 200) {

        print("Parish contact : $response");
       
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> aprishcontactData = data['data'];

        // Properly map the fetched data to the model
             parishcontactList = aprishcontactData
            .map((prc) => ParishContactModel.fromJson(prc))
            .toList();
      } else {
        throw Exception('Failed to load images');
      }
    } catch (e) {
      // Handle the error, you can replace this with proper error UI or logging
      print('Error occurred: $e');
    }
  }
}


class BirthdayController {
  final String apiUrl = "https://qahalpro.com/anaprampalmtc/API/api.php?function=birthday";

  List<Birthday> birthdayList = [];

  // Fetch data from the API
  Future<void> fetchBirthdays() async {
   
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
 
        final List<dynamic> data = json.decode(response.body)['bday'];
        birthdayList = data.map((json) => Birthday.fromJson(json)).toList();

        print(birthdayList);
      } else {
        throw Exception('Failed to load birthdays');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}

