import 'package:autocare_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class oneChat extends StatefulWidget {
  final String name;
  final String lastMessage;
  final String time;
  final String imgURL;

  const oneChat(
      {
      // super.key,
      required this.name,
      required this.lastMessage,
      required this.time,
      required this.imgURL});

  @override
  State<oneChat> createState() => _oneChatState();
}

class _oneChatState extends State<oneChat> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).pushNamed(RouteManager.messages);
      },
      leading: ClipOval(
        // borderRadius: BorderRadius.circular(50),
        child: Image.asset(
          widget.imgURL,
          // height: 40,
          width: 50,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(widget.name),
      subtitle: Text(widget.lastMessage),
      trailing: Text(widget.time),
    );
  }
}
