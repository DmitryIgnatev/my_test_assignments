class EventItem {
  final String time;
  final String message;
  final String? info;

  EventItem({
    required this.time,
    required this.message,
    this.info,
  });
}
