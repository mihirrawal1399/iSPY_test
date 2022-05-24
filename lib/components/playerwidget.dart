import 'package:flutter/material.dart';

class playerWidget extends StatefulWidget {
  final bool isPlayerOnline;
  final String playerName;
  final String playerPoints;
  const playerWidget(
      {Key? key,
      required this.playerName,
      required this.playerPoints,
      required this.isPlayerOnline})
      : super(key: key);

  @override
  State<playerWidget> createState() => _playerWidgetState();
}

class _playerWidgetState extends State<playerWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Icon(
                    Icons.account_circle,
                    size: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.02,
                    right: MediaQuery.of(context).size.height * 0.005,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(MediaQuery.of(context).size.height * 0.002,
                                  MediaQuery.of(context).size.height * 0.002),
                              blurRadius: MediaQuery.of(context).size.height * 0.0015)
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.007),
                        child: widget.isPlayerOnline?
                        Icon(
                          Icons.wifi,
                          size: MediaQuery.of(context).size.height * 0.017,
                          color: Colors.green,
                        ):
                        Icon(
                          Icons.wifi_off,
                          size: MediaQuery.of(context).size.height * 0.017,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.playerName,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    Text(
                      "Points: " + widget.playerPoints.toString(),
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
