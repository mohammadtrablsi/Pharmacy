import 'package:get/get.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechToTextController extends GetxController {
  SpeechToText speechToText = SpeechToText();
  bool speechEnabled = false;
  String lastWords = '';
  var controllerOfTextField;

  @override
  void onInit() {
    initSpeech();
    super.onInit();
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
          localeId: 'en_US',
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
    controllerOfTextField.text = lastWords;
    update();
  }

  void setControllerOfTextField(var controllerOfTextField) {
    this.controllerOfTextField = controllerOfTextField;
    update();
  }
}
