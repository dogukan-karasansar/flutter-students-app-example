import 'dart:math';

import 'package:basic_app/repesitory/Messages.dart';
import 'package:flutter/material.dart';

class MessagesPage extends StatefulWidget {
  final MessagesRepestories messagesRepestories;

  const MessagesPage(this.messagesRepestories, {Key? key}) : super(key: key);

  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {

  @override
  void initState() {
    widget.messagesRepestories.newMessagesCount = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mesajlar'),
        backgroundColor: const Color.fromRGBO(156, 15, 72, 1),
      ),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
              reverse: true,
              itemCount: widget.messagesRepestories.messages.length,
              itemBuilder: (context, index) {
                return MessageView(widget.messagesRepestories.messages[index]);
              }),
        ),
        DecoratedBox(
          decoration: BoxDecoration(border: Border.all()),
          child: Row(children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(25.0))),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                  )),
            )),
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: ElevatedButton(
                  onPressed: () {
                    print('Gönderildi');
                  },
                  child: const Text('Gönder')),
            )
          ]),
        ),
      ]),
    );
  }
}

class MessageView extends StatelessWidget {
  final Messages msj;

  const MessageView(
    this.msj, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          msj.sender == 'Dodo' ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: DecoratedBox(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              color: msj.sender == 'Dodo'
                  ? const Color.fromRGBO(249, 228, 212, 1)
                  : const Color.fromRGBO(214, 125, 62, 1),
              borderRadius: const BorderRadius.all(Radius.circular(14))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 16),
            child: Text(msj.text),
          ),
        ),
      ),
    );
  }
}
