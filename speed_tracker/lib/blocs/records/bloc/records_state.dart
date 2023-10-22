part of 'records_bloc.dart';

class RecordsState extends Equatable {
  final List<RecordCSV> records;
  final List<Segment> segments;
  final List<Segment> userSegments;
  const RecordsState(
      {required this.records,
      required this.segments,
      required this.userSegments});

  factory RecordsState.initial() =>
      const RecordsState(records: [], segments: [], userSegments: []);

  RecordsState copyWith(
      {List<RecordCSV>? records,
      List<Segment>? segments,
      List<Segment>? userSegments}) {
    return RecordsState(
        records: records ?? this.records,
        segments: segments ?? this.segments,
        userSegments: userSegments ?? this.userSegments);
  }

  @override
  List<Object> get props => [records, segments, userSegments];
}
