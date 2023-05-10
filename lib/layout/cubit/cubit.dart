import 'dart:async';
import 'dart:core';
import 'dart:io';

import 'package:background_fetch/background_fetch.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/layout/cubit/states.dart';
import 'package:graduation_project_app/models/user.dart';
import 'package:graduation_project_app/modules/Profile/profile_screen.dart';
import 'package:graduation_project_app/modules/Ticket/allTickets.dart';
import 'package:graduation_project_app/modules/Ticket/timeFuns.dart';
import 'package:graduation_project_app/network/local/shared_pref.dart';
import 'package:graduation_project_app/shared/variables.dart';
import 'package:image_picker/image_picker.dart';
import 'package:graduation_project_app/modules/live_location/checkTrain.dart';
import 'package:intl/intl.dart';
import '../../modules/home_screen/home_screen.dart';

class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(MainIntialState());
  static String? uId;
  static UserModel? model;
  static MainCubit get(context) => BlocProvider.of(context);

  int currentindex = 0;
  final screens = [
    const HomeScreen(),
    CheckTrain(
        date: dateTicket, isFromHome: true, station: station, trainNump: Train),
    const TicketsView(),
    const ProfileScreen(),
  ];
  void changeNavbarIndex(index) {
    currentindex = index;
    emit(ChangeNavBarState());
  }

  Future<void> userGetData() async {
    emit(getUserLoadingState());
    print('=======================');
    uId = await casheHelper.getData(key: 'uId');
    String? start = uId?.substring(0, 3);
    print(uId);
    FirebaseFirestore.instance
        .collection('users')
        .doc(start)
        .collection('numbers')
        .doc(uId)
        .snapshots()
        .listen((event) {
      // event.data();
      model = UserModel.fromJason(event.data()!);
      print(model);
      emit(getUserSucessState());
    });

//     emit(getUserLoadingState());
//     uId = await casheHelper.getData(key: 'uId');
//     print('mahaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
//     print(uId);
//     String ?start=uId?.substring(0,3);
//     FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
// //doc(start).collection('numbers').
//       print(value.data());
//       model = UserModel.fromJason(value.data()!);
//       emit(getUserSucessState());
//       print('name is ' + model!.name!);
//     }).catchError((error) {
//       print(error.toString());
//       emit(getUserErrorState(error));
//     });
  }

////////////////////////////////////////////////
//////////////////////////////////////
  File? profileImage;

  Future<void> getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      profileImage = File(image.path);
      emit(profilePickedImageProfileSucessState());
    } else {
      print('no image selected');
      emit(profilePickedImageProfileErrortate());
    }
  }

///////////////////////////////////////upload////////////////////
  Future<void> uploadImage({
    required String name,
    required String email,
    required String phone,
    required BuildContext context,
  }) async {
    emit(updateUserLoadingState());
     String? start = model!.uId!.substring(0, 3);
    FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        // emit(uploadProfileSucessState());
        print('photo is' + value);

   
        updateUser(
          editedName: name,
          editedEmail: email,
          editedPhone: phone,
          image: value,
          context: context
        );
      }).catchError((error) {
        emit(uploadProfileErrorState(error));
      });
    }).catchError((error) {
      emit(uploadProfileErrorState(error));
    });
  }

  ////////////////////////////////////////////
  Future<void> updateUser({
    required String editedName,
    required String editedEmail,
    required String editedPhone,
    required BuildContext context,
    String? image,
  }) async {
    UserModel modeldata = UserModel(
      uId: model!.uId!,
      name: editedName,
      email: editedEmail,
      image: image ?? model!.image!,
      bill: model!.bill!,
    );
    String? start = model!.uId!.substring(0, 3);

    FirebaseFirestore.instance
        .collection('users')
        .doc(start)
        .collection('numbers')
        .doc(model?.uId)
        .update(modeldata.toMap())
        .then((value) {
      userGetData().then((value) => Navigator.pop(context));
      
    }).catchError((error) {
      emit(updateUserErrorState(error));
    });
  }

//   Future<void> update() async {
//     String dateTobBeDeleted =
//         newDateTime(DateTime.now().toString(), "23:59:59");
//     final Map<String, dynamic> deletes = {
//       dateTobBeDeleted: FieldValue.delete(),
//     };
//     List<bool> seats = List.filled(48, false);
//     String dateTobBeSet = newDateTime(
//         DateTime.now().add(const Duration(days: 7)).toString(), "23:59:59");
//     final Map<String, dynamic> sets = {
//       dateTobBeSet: seats,
//     };
//     FirebaseFirestore.instance
// .collection("trains")
//         .doc("2dRl1WJljsXJpNrn9KYB")
//         .collection("seats")
//         .get().then((value) {value.docs.forEach((element) { element.update(deletes)
//         .then((value) {
//       FirebaseFirestore.instance
//         .collection("trains")
//           .doc("2dRl1WJljsXJpNrn9KYB")
//           .collection("seats")
//           .set(sets, SetOptions(merge: true));
//     })})})
//         .catchError((error) {
//       ResetSeatsErrorState(error.toString());
//     });
//   }

//   Future<void> resetSeats() async {
//     bool isexist = false;
//     bool isexpired = false;
//     FirebaseFirestore.instance
//     .collection("trains")
//         .doc("2dRl1WJljsXJpNrn9KYB")
//         .collection("seats")
//         .get()
//         .then((value) {
//        value.docs.forEach((element) {isexist = element.data().containsKey(newDateTime(DateTime.now().toString(), "23:59:59"));
//       if (isexist) {
//         isexpired = expired(
//             DateTime.parse(newDateTime(DateTime.now().toString(), "23:59:59")));
//       }
//     });}).catchError((error) {
//      emit(CheckSeatsErrorState(error.toString())) ;
//     });

//     if (isexpired) {
//       update().then((value) {
//         emit(ResetSeatsSuccessState());
//       }).catchError((error) {
//         emit(ResetSeatsErrorState(error.toString()));
//       });
//     }
//   }
  int num = 0;
  bool isexist = false;
  bool isexpired = false;
  List trainsDocs = [
    '2dRl1WJljsXJpNrn9KYB',
    'Ch6XjXxzROUKj43a5514',
    'GJKZ8iQI7y0gH5xygXHv',
    'Hqxznuod9XaQenF75gRK',
    'IPg76Z4TtDCiLVQHTtEq',
    'JRFxN6jiIpQZ8QTcvCVt',
    'OYWMTz9e7yENbM0LOyc2',
    'QSyYEPvr85riNoFYBPZJ',
    'XkhKKO2QTJ6XDNfpDXya',
    'g5rWOLNbdr6NLEPJrpbQ',
    'jIL4UEv90x7ESzT0ksXV',
    'jevKCjY8iFVkwpxhjw0n',
    'rA23Dfb4AeaZ1Ds2jvQQ',
    'sBEBaFUWFaiSNcw1TJDu',
    'sGqWFjS3syqizW4EZlVY',
    'tn2ILzqjjm3GtYtPgrwj',
    'wEdjQtfgZagcN02PRRfY'
  ];

  List seatsDocs = [
    'Lzmj2kh4n6gIQMQwu4sU',
    '2I3TxQ3Hmrs4cpwfmQhH',
    'E4JoMZ6FG8TLm2X0c0P9',
    '7IOuOuiw9T8CKJMp2dJs',
    'fs079fI3PfQVS0t14Saa',
    '5LVpUMFAX7J71K6dRGUk',
    'xgEm60qwGjGDLsyUO1ys',
    'faDKArN2aDCadrGkjdaM',
    'jN6mjR4pYLFVcfcnKiD1',
    'THjer230pI2XGH6RYM88',
    'ddOsqyTkKaHcNBbWgr3c',
    'oYbH8TEE6g2gS3LeRMDN',
    'Gwfj4FfVbagjYOQwTMuj',
    '5gyu1fqQDcI1vF3nMTBo',
    'lQEdJABW6W3tuIG4YPcS',
    'HOTPNqurtcnu0cDZR0Yg',
    'rW4sjMbEc4Qxo6fJ6UpF'
  ];

  List seatsUpdate = List.filled(48, false);

  // Future<void> checkExpiredDate() async {
  //   await FirebaseFirestore.instance
  //       .collection("trains")
  //       .doc(trainsDocs[0])
  //       .collection("seats")
  //       .doc(seatsDocs[0])
  //       .get()
  //       .then((value) {
  //     isexist = value
  //         .data()!
  //         .containsKey(newDateTime(DateTime.now().toString(), "23:59:59"));
  //     // print("isexist");
  //     // print(isexist);
  //     if (isexist) {
  //       isexpired = expired(
  //           DateTime.parse(newDateTime(DateTime.now().toString(), "23:00:00")));
  //       // print("isexpired");
  //       // print(isexpired);
  //     }
  //   });
  // }
  List fieldsNames = [];
  List expiredFields = [];
  List daysOfExpiredDates = [];
  Future<void> checkExpiredDate() async {
    fieldsNames = [];
    expiredFields = [];
    daysOfExpiredDates = [];
    await FirebaseFirestore.instance
        .collection("trains")
        .doc(trainsDocs[0])
        .collection("seats")
        .doc(seatsDocs[0])
        .get()
        .then((value) async {
      if (value.exists) {
        Map<String, dynamic> data = value.data()!;
        fieldsNames = data.keys.toList();
        //get the expired fields
        for (var j = 0; j < fieldsNames.length; j++) {
          isexpired =
              expired(DateTime.parse(newDateTime(fieldsNames[j], "23:00:00")));
          if (isexpired) {
            expiredFields.add(fieldsNames[j]);
            daysOfExpiredDates.add(DateFormat('EEEE')
                .format(DateTime.parse(newDateTime(fieldsNames[j], "23:00:00")))
                .substring(0, 3));
            print(daysOfExpiredDates);
          }
        }
        // Set<dynamic> itemSet = expiredFields.toSet();
        // expiredFields = itemSet.toList();
      }
      // emit(CheckExpiredDateSuccesState());
    }).catchError((error) {
      emit(CheckExpiredDateErrorState(error.toString()));
    });
  }

  Future<void> update() async {
    //اكتبي هنا يا ندود
    // ده كود الماب بتاعة التاريخ الللي هيتمسح واللي هيتحط اللي هتديها لفانكشن
    // update(deletes) / set(sets, SetOptions(merge: true))
    //1-Delete Expired fields
    for (var i = 0; i < expiredFields.length; i++) {
      final Map<String, dynamic> deletes = {
        expiredFields[i]: FieldValue.delete(),
      };
      for (var j = 0; j < trainsDocs.length; j++) {
        await FirebaseFirestore.instance
            .collection('trains')
            .doc(trainsDocs[j])
            .collection('seats')
            .doc(seatsDocs[j])
            .update(deletes)
            .whenComplete(() {
          // print('Field deleted');
        });
      }
    }
    //2-Add the new fields
    for (var i = 0; i < expiredFields.length; i++) {
      var fullDate = DateTime.now().add(Duration(days: 7 - i));
      var date = fullDate.toString().split(" ").first;
      for (var j = 0; j < trainsDocs.length; j++) {
        await FirebaseFirestore.instance
            .collection('trains')
            .doc(trainsDocs[j])
            .collection('seats')
            .doc(seatsDocs[j])
            .set({date: seatsUpdate}, SetOptions(merge: true)).then((value) {
          // print('Field added');
          // print(date);
        }).catchError((error) {
          print(error.toString());
        });
      }
    }
    //3-Reset days of expired fields
    for (var i = 0; i < daysOfExpiredDates.length; i++) {
      // print(daysOfExpiredDates);
      for (var j = 0; j < trainsDocs.length; j++) {
        await FirebaseFirestore.instance
            .collection('trains')
            .doc(trainsDocs[j])
            .update({'available.${daysOfExpiredDates[i]}': '48'}).then((value) {
          // print(daysOfExpiredDates);

          // print('Field added');
          // print(date);
        }).catchError((error) {
          print(error.toString());
        });
      }
    }

    // String dateTobBeDeleted =
    //     newDateTime(DateTime.now().toString(), "23:59:59");
    // final Map<String, dynamic> deletes = {
    //   dateTobBeDeleted: FieldValue.delete(),
    // };
    // String dateToBeSet = newDateTime(
    //     DateTime.now().add(const Duration(days: 7)).toString(), "23:59:59");
    // final Map<String, dynamic> sets = {
    //   dateToBeSet: seatsUpdate,
    // };

    //   for (var i = 0; i < trainsDocs.length; i++) {
    //   await FirebaseFirestore.instance
    //       .collection('trains')
    //       .doc(trainsDocs[i])
    //       .collection('seats')
    //       .doc(seatsDocs[i])
    //       .set(sets, SetOptions(merge: true))
    //       .then((value) {
    //     // print('Field added');
    //   }).catchError((error) {
    //     print(error.toString());
    //   });
    // }
    // for (var i = 0; i < trainsDocs.length; i++) {
    //   await FirebaseFirestore.instance
    //       .collection('trains')
    //       .doc(trainsDocs[i])
    //       .collection('seats')
    //       .doc(seatsDocs[i])
    //       .update(deletes)
    //       .whenComplete(() {
    //     // print('Field deleted');
    //   });
    // }
    // for (var i = 0; i < trainsDocs.length; i++) {
    //   await FirebaseFirestore.instance
    //       .collection('trains')
    //       .doc(trainsDocs[i])
    //       .collection('seats')
    //       .doc(seatsDocs[i])
    //       .set(sets, SetOptions(merge: true))
    //       .then((value) {
    //     // print('Field added');
    //   }).catchError((error) {
    //     print(error.toString());
    //   });
    // }
  }

  Future<void> resetSeats() async {
    checkExpiredDate().then((value) async {
      // print("isexist & isexpired");
      // print(isexist & isexpired);
      //كملي هنا بقا ياندود بعد ماتظبطي الفانكشن اللي فوق
      // اعملي ليستيتين بقا فيهم عنوايين الدوكس بتاعة الترينز والسيتس وظبطي الدنيا يعني انه يعمل فور لوب
      // على فانكشن ال update
      // ويديها كل مرة الاندكس بتاع عنوان الترين والسيتس
      // print(expiredFields);
      if (expiredFields.isNotEmpty) {
        // print('i am not an empty list');
        update();
      } else {
        print('انتي حد في الجمدان منه.');
      }
      print('thhhheeee liiiisssttt iiiissss $expiredFields');
      emit(CheckExpiredDateSuccesState());
    }).catchError((error) {
      emit(CheckExpiredDateErrorState(error.toString()));
    });
  }

  Future<void> initPlatformState() async {
    // Configure BackgroundFetch.
    int status = await BackgroundFetch.configure(
        BackgroundFetchConfig(
          minimumFetchInterval: 15,
          forceAlarmManager: false,
          stopOnTerminate: false,
          startOnBoot: true,
          enableHeadless: true,
          requiresBatteryNotLow: false,
          requiresCharging: false,
          requiresStorageNotLow: false,
          requiresDeviceIdle: false,
          requiredNetworkType: NetworkType.NONE,
        ),
        onBackgroundFetch,
        onBackgroundFetchTimeout);
    BackgroundFetch.scheduleTask(TaskConfig(
        taskId: "flutter_background_fetch",
        delay: 1000,
        periodic: true,
        stopOnTerminate: false,
        enableHeadless: true));
    print('==============Done===============');
  }

  int no = 4;
  void onBackgroundFetch(String taskId) async {
    print("[BackgroundFetch] Event received $taskId");
    var fullDate = DateTime.now().subtract(Duration(days: no));
    var date = fullDate.toString().split(" ").first;
    // print(date);
    for (var i = 0; i < trainsDocs.length; i++) {
      await FirebaseFirestore.instance
          .collection('trains')
          .doc(trainsDocs[i])
          .collection('seats')
          .doc(seatsDocs[i])
          .set({date: seatsUpdate}, SetOptions(merge: true)).then((value) {
        // print('Field added');
        // print(date);
      }).catchError((error) {
        print(error.toString());
      });
    }
    no++;
    // resetSeats();
  }

  void onBackgroundFetchTimeout(String taskId) async {
    print("[BackgroundFetch] TASK TIMEOUT taskId: $taskId");
    BackgroundFetch.finish(taskId);
  }

  //function to delete all seats fields
  void deleteAllFields() async {
    for (var i = 0; i < trainsDocs.length; i++) {
      var collection = await FirebaseFirestore.instance
          .collection('trains')
          .doc(trainsDocs[i])
          .collection('seats');
      var docSnapshot = await collection.doc(seatsDocs[i]).get();
      if (docSnapshot.exists) {
        Map<String, dynamic> data = docSnapshot.data()!;
        List fieldsNames = data.keys.toList();
        for (var j = 0; j < fieldsNames.length; j++) {
          await FirebaseFirestore.instance
              .collection('trains')
              .doc(trainsDocs[i])
              .collection('seats')
              .doc(seatsDocs[i])
              .update({fieldsNames[j]: FieldValue.delete()}).whenComplete(() {
            // print('Field deleted');
          });
        }
      }
    }
  }

  // function to add previous dates
  void previousDates() async {
    int sub = 7;
    for (var i = sub; i >= 0; i--) {
      var fullDate = DateTime.now().subtract(Duration(days: i));
      var date = fullDate.toString().split(" ").first;
      // print(date);
      for (var i = 0; i < trainsDocs.length; i++) {
        await FirebaseFirestore.instance
            .collection('trains')
            .doc(trainsDocs[i])
            .collection('seats')
            .doc(seatsDocs[i])
            .set({date: seatsUpdate}, SetOptions(merge: true)).then((value) {
          // print('Field added');
          // print(date);
        }).catchError((error) {
          print(error.toString());
        });
      }
    }
  }

  void addOnePreviousField() async {
    var fullDate = DateTime.now().subtract(Duration(days: 1));
    var date = fullDate.toString().split(" ").first;
    // print(date);
    for (var i = 0; i < trainsDocs.length; i++) {
      await FirebaseFirestore.instance
          .collection('trains')
          .doc(trainsDocs[i])
          .collection('seats')
          .doc(seatsDocs[i])
          .set({date: seatsUpdate}, SetOptions(merge: true)).then((value) {
        // print('Field added');
        // print(date);
      }).catchError((error) {
        print(error.toString());
      });
    }
  }

  void addFutureFields() async {
    for (var i = 0; i < 7; i++) {
      var fullDate = DateTime.now().add(Duration(days: 7 - i));
      var date = fullDate.toString().split(" ").first;
      for (var i = 0; i < trainsDocs.length; i++) {
        await FirebaseFirestore.instance
            .collection('trains')
            .doc(trainsDocs[i])
            .collection('seats')
            .doc(seatsDocs[i])
            .set({date: seatsUpdate}, SetOptions(merge: true)).then((value) {
          // print('Field added');
          // print(date);
        }).catchError((error) {
          print(error.toString());
        });
      }
    }
  }

  Map<String, dynamic> availableDays = {
    'Fri': '48',
    'Sat': '48',
    'Sun': '48',
    'Mon': '48',
    'Tue': '48',
    'Wed': '48',
    'Thu': '48',
  };

  void available() async {
    for (var j = 0; j < trainsDocs.length; j++) {
      await FirebaseFirestore.instance
          .collection('trains')
          .doc(trainsDocs[j])
          .update({'available': availableDays}).then((value) {
        print(daysOfExpiredDates);

        // print('Field added');
        // print(date);
      }).catchError((error) {
        print(error.toString());
      });
    }
  }


}


