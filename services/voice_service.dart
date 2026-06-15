import 'package:speech_to_text/speech_to_text.dart';

class VoiceService {
  static final SpeechToText _speech = SpeechToText();

  static Future<String> listen() async {
    bool available = await _speech.initialize();
    if (!available) return "";

    String result = "";

    await _speech.listen(
      onResult: (val) {
        result = val.recognizedWords;
      },
      listenFor: const Duration(seconds: 5),
    );

    await Future.delayed(const Duration(seconds: 5));
    await _speech.stop();

    return result;
  }
}
