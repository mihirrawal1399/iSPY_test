import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ispy/components/playerwidget.dart';

class PlayersList extends StatefulWidget {
  final String userName;

  String? name;
  String? playerpoints;
  String? online;

  const PlayersList(
      {Key? key,
      required this.userName,
      this.name,
      this.playerpoints,
      this.online})
      : super(key: key);

  PlayersList.fromJson(Map<String, dynamic> json, this.userName) {
    name = json['name'];
    playerpoints = json['playerpoints'];
    online = json['online'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['playerpoints'] = this.playerpoints;
    data['online'] = this.online;
    return data;
  }

  Future<List<PlayersList>> ReadJsonData() async {
    //read json file
    final jsondata = await rootBundle.loadString('./lib/players.json');
    //decode json data as list
    final list = json.decode(jsondata) as List<dynamic>;
    //map json and initialize using DataModel
    return list.map((e) => PlayersList.fromJson(e)).toList();
  }

  @override
  State<PlayersList> createState() => _PlayersListState();
}

class _PlayersListState extends State<PlayersList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome " + widget.userName),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              width: MediaQuery.of(context).size.width * 1,
              color: Colors.lightBlueAccent,
              child: const Text(
                "Select any online player to start",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            playerWidget(
                playerName: "Mihir", playerPoints: 23, isPlayerOnline: false),
            playerWidget(
                playerName: "Beurus", playerPoints: 21, isPlayerOnline: true)
          ],
        ),
      ),
    );
  }
}
