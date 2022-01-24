class MessagesRepestories {
  final List<Messages> messages = [
    Messages(
        'Naber', 'Miko', DateTime.now().subtract(const Duration(minutes: 1))),
    Messages(
        'Naber', 'Miko', DateTime.now().subtract(const Duration(minutes: 2))),
    Messages('aberdodod', 'Miko',
        DateTime.now().subtract(const Duration(minutes: 3))),
    Messages(
        'dodocuk', 'Miko', DateTime.now().subtract(const Duration(minutes: 4))),
    Messages(
        'dodo', 'Miko', DateTime.now().subtract(const Duration(minutes: 5))),
    Messages('iyi kurbağa senden naber', 'Dodo', DateTime.now()),
  ].reversed.toList();

  int newMessagesCount = 4;
}

class Messages {
  String text;
  String sender;
  DateTime time;

  Messages(this.text, this.sender, this.time);
}
