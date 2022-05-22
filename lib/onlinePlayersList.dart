import 'package:flutter/material.dart';

class PlayersList extends StatefulWidget {
  final String name,password;

  const PlayersList({Key? key, required this.name, required this.password}) : super(key: key);

  @override
  State<PlayersList> createState() => _PlayersListState();
}

class _PlayersListState extends State<PlayersList> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("List of online players"),);
  }
}
