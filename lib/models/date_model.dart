import 'package:cloud_firestore/cloud_firestore.dart';

const dateModelTimeStamp = 'timestamp';
const dateModelDay = 'day';
const dateModelMonth = 'month';
const dateModelYear = 'year';

class DateModel {
  Timestamp timestamp;
  int day, month, year;

  DateModel({
    required this.timestamp,
    required this.day,
    required this.month,
    required this.year,
  });

  toMap() => {
        dateModelTimeStamp: timestamp,
        dateModelDay: day,
        dateModelMonth: month,
        dateModelYear: year,
      };

  factory DateModel.fromMap(Map<String, dynamic> map) => DateModel(
        timestamp: map[dateModelTimeStamp],
        day: map[dateModelDay],
        month: map[dateModelMonth],
        year: map[dateModelYear],
      );
}
