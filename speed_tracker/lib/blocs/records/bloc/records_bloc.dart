import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/record_csv.dart';
import '../../../models/segments.dart';
part 'records_event.dart';
part 'records_state.dart';

class RecordsBloc extends Bloc<RecordsEvent, RecordsState> {
  RecordsBloc() : super(RecordsState.initial()) {
    on<RecordsChangedEvent>(_recordsChanged);
    on<SegmentsChangedEvent>(_segmentsChanged);
    on<UserSegmentsChangedEvent>(_userSegmentsChanged);
    on<UserSegmentsAddEvent>(_userSegmentAdd);
    on<UserSegmentsDeleteEvent>(_userSegmentDelete);
  }

  void _recordsChanged(RecordsChangedEvent event, Emitter<RecordsState> emit) {
    emit(state.copyWith(records: event.records));
  }

  void _segmentsChanged(
      SegmentsChangedEvent event, Emitter<RecordsState> emit) {
    emit(state.copyWith(segments: event.segments));
  }

  void _userSegmentsChanged(
      UserSegmentsChangedEvent event, Emitter<RecordsState> emit) {
    emit(state.copyWith(userSegments: event.userSegments));
  }

  ///
  void _userSegmentAdd(UserSegmentsAddEvent event, Emitter<RecordsState> emit) {
    // Adding a new item to the list
    List<Segment> updatedSegments = List.from(state.userSegments)
      ..add(event.userSegment);

    // Sorting the list by ID
    updatedSegments.sort((a, b) => a.id.compareTo(b.id));

    // Updating state with the sorted list
    emit(state.copyWith(userSegments: updatedSegments));
  }

  void _userSegmentDelete(
      UserSegmentsDeleteEvent event, Emitter<RecordsState> emit) {
    emit(state.copyWith(
        userSegments: List.from(state.userSegments)
          ..remove(event.userSegment)));
  }
}
