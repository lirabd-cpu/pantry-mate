import 'package:flutter/material.dart';
import '../db/database_helper.dart';
import '../models/item_model.dart';
import 'voice_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Item> items = [];

  @override
  void initState() {
    super.initState();
    loadItems();
  }

  void loadItems() async {
    items = await DatabaseHelper.instance.getItems();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pantry Mate")),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.mic),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const VoiceScreen()),
          );
          loadItems();
        },
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            child: ListTile(
              title: Text(item.name),
              subtitle: Text("${item.quantity} ${item.unit} • ${item.category}"),
            ),
          );
        },
      ),
    );
  }
}
