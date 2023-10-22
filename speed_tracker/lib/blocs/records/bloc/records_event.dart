part of 'records_bloc.dart';

abstract class RecordsEvent extends Equatable {
  const RecordsEvent();

  @override
  List<Object> get props => [];
}

class RecordsChangedEvent extends RecordsEvent {
  final List<RecordCSV> records;

  const RecordsChangedEvent({required this.records});
}

class SegmentsChangedEvent extends RecordsEvent {
  final List<Segment> segments;

  const SegmentsChangedEvent({required this.segments});
}

class UserSegmentsChangedEvent extends RecordsEvent {
  final List<Segment> userSegments;

  const UserSegmentsChangedEvent({required this.userSegments});
}

class UserSegmentsAddEvent extends RecordsEvent {
  final Segment userSegment;

  const UserSegmentsAddEvent({required this.userSegment});
  @override
  List<Object> get props => [userSegment];
}

class UserSegmentsDeleteEvent extends RecordsEvent {
  final Segment userSegment;

  const UserSegmentsDeleteEvent({required this.userSegment});

  @override
  List<Object> get props => [userSegment];
}
