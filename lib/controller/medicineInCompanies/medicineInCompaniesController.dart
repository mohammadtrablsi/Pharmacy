import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/view/screen/Auth/register.dart';
import 'package:pharmacy/view/screen/companies/companies.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../view/screen/comment/comment.dart';

class MedicineInCompaniesController extends GetxController {
  TextEditingController search = TextEditingController();
  SpeechToText speechToText = SpeechToText();
  final focusNode = FocusNode();
  bool speechEnabled = false;
  String lastWords = '';
  dynamic data;
  int indexOfTapBar = 0;
  String theNameOfFirstCompany = '';
  String searchValue = '';
  @override
  void onInit() async {
    initSpeech();
    data = Get.arguments[0]['data'];
    theNameOfFirstCompany = Get.arguments[0]['theNameOfFirstCompany'];
  }

  @override
  void onClose() {
    focusNode.unfocus();
    super.onClose();
  }

  void setSearchValue(String searchValue) {
    this.searchValue = searchValue;
    update();
  }

  void setIndexOfTapBar(indexOfTapBar) {
    this.indexOfTapBar = indexOfTapBar;
    update();
  }

  void initSpeech() async {
    try {
      speechEnabled = await speechToText.initialize();
      update();
    } catch (e) {
      print('Error initializing speech recognition: $e');
    }
  }

  void startListening() async {
    try {
      if (speechEnabled) {
        await speechToText.listen(
          onResult: onSpeechResult,
          localeId: 'ar',
        );
      } else {
        print('Speech recognition is not available');
      }
      update();
    } catch (e) {
      print('Error starting speech recognition: $e');
    }
  }

  void stopListening() async {
    await speechToText.stop();
    update();
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    lastWords = result.recognizedWords;
    search.text = lastWords;
    update();
  }

  List<Widget> pages = [
    const Register(),
    const Companies(),
    const Comment(),
  ];
  List<String> getNameOFTaps() {
    List<String> myData = [];
    for (int i = 0; i < data.length; i++) {
      myData.add(data[i]['name']);
    }
    myData.removeWhere((item) => item == theNameOfFirstCompany);
    print(
        '===============================================================================$theNameOfFirstCompany');
    myData.insert(0, theNameOfFirstCompany);
    return myData;
  }

  List<Widget> get taps => List.generate(
        getNameOFTaps().length,
        (index) => Tab(
          text: getNameOFTaps()[index],
        ),
      );

  Future<List<DocumentSnapshot>> fetchFireStore(
      String collectionName, bool withSearch) async {
    FirebaseFirestore fireStore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot;

    if (withSearch) {
      querySnapshot = await fireStore
          .collection(collectionName)
          .where('companyName', isEqualTo: getNameOFTaps()[indexOfTapBar])
          .where('fullName', isGreaterThanOrEqualTo: searchValue)
          .where('fullName',
              isLessThanOrEqualTo:
                  '$searchValue\uf8ff') // Append a high Unicode character to include all matching results
          .get();
    } else {
      querySnapshot = await fireStore
          .collection(collectionName)
          .where('companyName', isEqualTo: getNameOFTaps()[indexOfTapBar])
          .get();
    }

    return querySnapshot.docs;
  }
}
