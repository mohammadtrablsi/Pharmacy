import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ASearchController extends GetxController {
  TextEditingController search = TextEditingController();
  SpeechToText speechToText = SpeechToText();
  final focusNode = FocusNode();
  bool speechEnabled = false;
  String lastWords = '';
  String searchValue = '';

  @override
  void onInit() async {
    initSpeech();
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
          localeId: 'en_US', // localeId:  'ar',
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

  Future<List<DocumentSnapshot>> fetchFireStore(String collectionName) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot;

    querySnapshot = await firestore
        .collection(collectionName)
        .where('fullName', isGreaterThanOrEqualTo: searchValue)
        .where('fullName', isLessThanOrEqualTo: searchValue + '\uf8ff')
        .get();

    if (searchValue.isEmpty) {
      return [];
    } else {
      return querySnapshot.docs;
    }
  }
}
