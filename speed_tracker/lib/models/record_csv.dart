/// class for working with information from CSV files
class RecordCSV {
  final int id;
  final double latitude;
  final double longitude;
  final DateTime dateTime;

  RecordCSV(this.id, this.latitude, this.longitude, this.dateTime);

  // Method for creating an object from a CSV by string
  static RecordCSV fromCsv(String csvRow) {
    List<dynamic> fields = csvRow.split(',');

    int id = int.parse(fields[0]);

    double latitude = double.parse(fields[1].replaceAll(RegExp("['\"]"), ""));
    double longitude = double.parse(fields[2].replaceAll(RegExp("['\"]"), ""));
    DateTime dateTime = DateTime.parse(fields[3]);

    return RecordCSV(id, latitude, longitude, dateTime);
  }
}
