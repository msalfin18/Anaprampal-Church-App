// constants.dart
const String WER_SERVER_URL = "https://qahalpro.com/anaprampalmtc/API/";
const String MAIN_API_URL = "${WER_SERVER_URL}api.php";


//............HOMEPAGE.............................................................................................................................

final String SLIDER_IMAGES_URL = MAIN_API_URL+"?function=slider";

const String IMAGE_SLIDER_URL = "${WER_SERVER_URL}../app_slider/uploads/";

const String OTP_URL = "${WER_SERVER_URL}otp.php";


//.............. OUR PARISH ...........................................................................................................................

const String HISTORYWEBVIEW =	'${WER_SERVER_URL}history.php';

const String  BISHOPSANDOFFCIALS = '${MAIN_API_URL}?function=churchGroups' ; 

const String KAISTHANASAMITHI = '${MAIN_API_URL}?function=kaisthana_samithi';

const String PARISHPRIEST= '${MAIN_API_URL}?function=parish_priest';

const String  EVANGELISTS ='${MAIN_API_URL}?function=Evangelists';

const String SEMINARIANS ='${MAIN_API_URL}?function=Seminarians';

const String INSTITUTIONSANDCHAPELS ='${MAIN_API_URL}?function=institutions';

                              // our parish images //

      const String IMAGE_KAISTHANA_SAMITHI_URL = WER_SERVER_URL+"../app_kaisthana_samithi/uploads/";

      const String  IMAGE_PARISH_PRIEST_URL = WER_SERVER_URL+"../app_parish_priest/uploads/";
 
      const String IMAGE_SEMINARIANS_URL = WER_SERVER_URL+"../app_sem/uploads/";

      const String IMAGE_INSTITUTION_URL = WER_SERVER_URL+"../app_institutions/uploads/";

//...................PARISH WARD............................................................................................................................

const String WARD_LIST_URL = "${MAIN_API_URL}?function=prayer_group";

const String PARISH_DIRECTORY_URL = "${MAIN_API_URL}?function=family_details";

const String MEMBER_DETAILS_URL = "${MAIN_API_URL}?function=family_all";

const String FAMIMG = "${WER_SERVER_URL}../family_creation/uploads/";



//......................Parish Vicar......................................................................................................................................................

    const String PRESENT_VICAR = "${MAIN_API_URL}?function=vicarCS";

    const String FORMER_VICAR = "${MAIN_API_URL}?function=vicarA";

     const String VICARMESSAGE = "${MAIN_API_URL}?function=vicar_message";

    const String PROGRAMWEBVIEW =	'${WER_SERVER_URL}vicar_schedule.php';


                    //....  parish Vicar Images  ....//

    const String IMAGE_VICAR_URL = WER_SERVER_URL+ "../app_vicar/uploads/";

    const String IMAGE_COMITTEE_URL = WER_SERVER_URL+"../group_member/uploads/";  // bishops and officials



//...................... News events ........................................................................................................
 
    const String EVENTCATEGORIES = "${MAIN_API_URL}?function=categoryNews";

    const String EVENTS =	'${WER_SERVER_URL}vicar_schedule.php';

    const String  NEWSEVENTS = 	MAIN_API_URL+"?function=newsEvent" ;	// familyId	  cid




//.......................... Request booking ............................................................................................

const String AUDITORIUM_BOOKING = "${MAIN_API_URL}?function=audi_insert";

const String AUDITORIUM_LIST = "${MAIN_API_URL}?function=audi_list";

const String PRAYER_REQUEST = "${MAIN_API_URL}?function=prayer_insert";

const String PRAYER_LIST = "${MAIN_API_URL}?function=prayer_purpose";





                 // my req //

const String AUDITORIUM_VIEW = "${MAIN_API_URL}?function=audi_select";

const String PRAYER_VIEW = "${MAIN_API_URL}?function=prayer_select";

const String AUDITORIUM_CALENDER = "${WER_SERVER_URL}api_audi/calender.php";   //WEBVIEW



//....................................GALLERY..................................................................................................................

const String IMAGE_GALLERY_LIST= "${MAIN_API_URL}?function=categoryGallery&type=image";

const String VIDEO_GALLERY_LIST = "${MAIN_API_URL}?function=categoryGallery&type=video";

const String GALLERY_IMAGES= "${MAIN_API_URL}?function=Gallery&category_id="  ;

const String GALLERY_VIDEOS = MAIN_API_URL+"?function=Video&category_id="  ;

const String DOWNLOAD_FILES = "${MAIN_API_URL}?function=downloads";
		

                 
                              // IMAGES & VIDEOS//
                              
      const String IMAGE_GALLERY_URL = WER_SERVER_URL+"../app_image/uploads/";           





//.....................................parish contact.......................................................................................

               const PARISH_CONTACT = 	MAIN_API_URL+"?function=churchSettings";




//.................................BDAY AND EVENTS ...........................................................................................

                        const String CALENDER = MAIN_API_URL+"?function=birthday" ;				



  const String  DUE_DETAILS = 	WER_SERVER_URL+"due.php"	;		//fid

  const String PREVIOUS_DUE =	WER_SERVER_URL+"previous.php"			;


//...........................Settings.................................................................................................


     const LOCATION_SET = 	MAIN_API_URL+"?function=locationUpdates";
    
      const PHOTO_UPDATE = 	MAIN_API_URL+"?function=photo_upload";


                    //...........settings webview .........
 const String FEEDBACK =	'${WER_SERVER_URL}feedback.php';

const String TERMSANDCONDITIONS =	'${WER_SERVER_URL}terms.php';

const String PRIVACYPOLICY=	'${WER_SERVER_URL}policy.php';





// https://qahalpro.com/anaprampalmtc/API/../app_image/uploads/2020-12-14-08-31-41WhatsAppImage2020-11-13at1.15.31PM.jpeg

  // https://qahalpro.com/anaprampalmtc/API/previous.php


// https://qahalpro.com/anaprampalmtc/API/api.php?function=slider/2020-12-14-08-30-11WhatsAppImage2020-11-02at7.19.10PM.jpeg,

// https://qahalpro.com/anaprampalmtc/API/api.php?function=categoryGallery&type=video"


// https://qahalpro.com/anaprampalmtc/app_slider/uploads/2020-12-14-08-28-45WhatsApp%20Image%202020-10-24%20at%209.44.39%20AM.jpeg

// https://qahalpro.com/anaprampalmtc/API/api.php?function=churchSettings

// https://qahalpro.com/anaprampalmtc/API/api.php?function=vicarCS

// https://qahalpro.com/anaprampalmtc/API/api.php?function=birthday

