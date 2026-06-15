import 'package:flutter/material.dart';
import '../services/voice_service.dart';
import '../utils/parser.dart';
import '../db/database_helper.dart';
import '../models/item_model.dart';

class VoiceScreen extends StatefulWidget {
  const VoiceScreen({super.key});

  @override
  State<VoiceScreen> createState() => _VoiceScreenState();
}

class _VoiceScreenState extends State<VoiceScreen> {
  String text = "";
  bool listening = false;

  Future<void> startListening() async {
    setState(() => listening = true);

    text = await VoiceService.listen();

    final data = Parser.parse(text);

    await DatabaseHelper.instance.insertItem(
      Item(
        name: data["item"],
        quantity: data["quantity"],
        unit: data["unit"],
        category: data["category"],
        date: DateTime.now().toString(),
      ),
    );

    setState(() => listening = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Voice Input")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(listening ? "Listening..." : "Tap mic"),
            const SizedBox(height: 20),
            IconButton(
              icon: const Icon(Icons.mic, size: 60),
              onPressed: startListening,
            ),
            const SizedBox(height: 20),
            Text(text),
          ],
        ),
      ),
    );
  }
}
