import 'package:flutter/material.dart';

import '../models/band.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Band> bands = [
    Band(id: '1', name: 'Metallica', votes: 5),
    Band(id: '2', name: 'Scorpion', votes: 2),
    Band(id: '3', name: 'Queen', votes: 3),
    Band(id: '3', name: 'Bon Jovi', votes: 4),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: const Text(
          'BandNames',
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (context, i) => _bandTitle(bands[i]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewBand,
        elevation: 1,
        child: const Icon(Icons.add),
      ),
    );
  }

  ListTile _bandTitle(
      // int index
      Band band) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blue[200],
        child: Text(band.name!.substring(0, 2)),
      ),
      title: Text(band.name!),
      trailing: Text(
        '${band.votes!}',
        style: const TextStyle(fontSize: 20),
      ),
      onTap: () => print(band.name),
    );
  }

  addNewBand() {
    final textController = TextEditingController();
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('New Band Name:'),
            content: TextField(
              controller: textController,
            ),
            actions: [
              MaterialButton(
                  textColor: Colors.blue,
                  elevation: 5,
                  onPressed: () {
                    print(textController.text);
                  },
                  child: const Text('Add'))
            ],
          );
        });
  }
}