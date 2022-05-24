import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ispy/components/playerwidget.dart';

class PlayersList extends StatefulWidget {
  String userName;
  String? name;
  String? playerpoints;
  bool? online;

  PlayersList(
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

  // Future<List<PlayersList>> ReadJsonData() async {
  //   //read json file
  //   final jsondata = await rootBundle.loadString('./lib/players.json');
  //   //decode json data as list
  //   final list = json.decode(jsondata) as List<dynamic>;
  //   //map json and initialize using DataModel
  //   return list.map((e) => PlayersList.fromJson(e, userName)).toList();
  // }

  @override
  State<PlayersList> createState() => _PlayersListState();
}

class _PlayersListState extends State<PlayersList> {

  late ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    ReadJsonData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome " + widget.userName),
      ),
      backgroundColor: Colors.white,
      body: Container(
        //height: MediaQuery.of(context).size.height * 0.95,
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
            FutureBuilder(
              future: ReadJsonData(),
              builder: (context, data){
                if (data.hasError) {
                  return Center(child: Text("${data.error}"),);
                } else if (data.hasData){
                  var items = data.data as List<PlayersList>;
                  return Expanded(
                    child: ListView.builder(

                        controller: _controller,
                      //shrinkWrap: true,
                      itemCount: items == null ? 0 : items.length,
                        itemBuilder: (context, index) {
                        return playerWidget(playerName: items[index].name!, playerPoints: items[index].playerpoints!, isPlayerOnline: items[index].online!);
                        }
                    ),
                  );
                } else {
                  return Text("Loading...");
                  // return Center(
                  //   child: CircularProgressIndicator(),
                  // );
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Future<List<PlayersList>> ReadJsonData() async {
    //read json file
    final jsondata = await rootBundle.loadString('./lib/assets/players.json');
    //decode json data as list
    final list = json.decode(jsondata) as List<dynamic>;
    //map json and initialize using DataModel
    return list.map((e) => PlayersList.fromJson(e,widget.userName)).toList();
  }

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {//you can do anything here
      });
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {//you can do anything here
      });
    }
  }

}


