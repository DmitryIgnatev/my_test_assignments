class VendingMachineItem {
  final int number;
  final String status;
  final String type;
  final String position;
  final String busType;
  final String signalLevel;
  final int identifier;
  final String modem;

  VendingMachineItem(
      {required this.number,
      required this.status,
      required this.type,
      required this.position,
      required this.busType,
      required this.signalLevel,
      required this.identifier,
      required this.modem});
}
