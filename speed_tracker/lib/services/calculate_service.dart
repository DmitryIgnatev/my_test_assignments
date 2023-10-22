import 'dart:math';

import '../models/segments.dart';

class CalculateService {

  // Радиус Земли в километрах
  /// Radius of the Earth in kilometers
  double earthRadius = 6371.0;
  
  // Функция для перевода градусов в радианы
  /// Function for converting degrees to radians
  double toRadians(double degrees) {
    return degrees * pi / 180.0;
  }
  
  // Функция для расчета расстояния между двумя точками по широте и долготе
  /// Function for calculating the distance between two points in latitude and longitude
  double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    double phi1 = toRadians(lat1);
    double phi2 = toRadians(lat2);
    double deltaPhi = toRadians(lat2 - lat1);
    double deltaLambda = toRadians(lon2 - lon1);

    double a = sin(deltaPhi / 2) * sin(deltaPhi / 2) +
        cos(phi1) * cos(phi2) * sin(deltaLambda / 2) * sin(deltaLambda / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    double distance = earthRadius * c;

    return distance;
  }

   /// Calculation of the average speed for each segment
  static double calculateAverageSpeed(Segment segment) {
    // Расчет средней скорости для каждого сегмента
    double averageSpeed = segment.distanceKM / (segment.timeMin / 60);
    return averageSpeed;
  }

}
