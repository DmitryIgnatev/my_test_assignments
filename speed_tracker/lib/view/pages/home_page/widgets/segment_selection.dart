import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/records/bloc/records_bloc.dart';
import '../../../../models/segments.dart';

class SegmentSelection extends StatefulWidget {
  const SegmentSelection({super.key});

  @override
  State<SegmentSelection> createState() => _SegmentSelectionState();
}

class _SegmentSelectionState extends State<SegmentSelection> {
  int? hoveredIndex;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecordsBloc, RecordsState>(builder: (context, state) {
      return Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Row(children: [
            const Text(
              "Отрезок времени:",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 24,
              ),
            ),
            Expanded(
                child: SizedBox(
              height: 35,
              child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: state.segments.length,
                  itemBuilder: (BuildContext context, int index) {
                    var segment = state.segments[index];
                    bool isUserSegment = state.userSegments
                        .any((userSegment) => userSegment.id == segment.id);
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: InkWell(
                        onHover: (value) {
                          setState(() {
                            value ? hoveredIndex = index : hoveredIndex = null;
                          });
                        },
                        onTap: () {
                          if (!isUserSegment) {
                            //! Adding new segments to userSegments list
                            context.read<RecordsBloc>().add(
                                UserSegmentsAddEvent(userSegment: segment));
                          } else {
                            if (state.userSegments.length > 1) {
                              //! Removing an element from userSegments that has the same id as the element in the Segments list
                              Segment selectedSegment =
                                  state.segments[index]; // user tapped element
                              Segment?
                                  userSegmentToRemove; //element, that we must remove from state.userSegments list

                              // Search for an item from the userSegments list that has the same id
                              for (var userSegment in state.userSegments) {
                                if (userSegment.id == selectedSegment.id) {
                                  userSegmentToRemove = userSegment;
                                  break;
                                }
                              }
                              // Removing an element from userSegments if such an element is found
                              if (userSegmentToRemove != null) {
                                context.read<RecordsBloc>().add(
                                    UserSegmentsDeleteEvent(
                                        userSegment: userSegmentToRemove));
                              }
                            }
                          }
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                color: Colors.transparent,
                                border: Border.all(
                                    color: hoveredIndex == index
                                        ? const Color.fromARGB(255, 3, 87, 244)
                                        : isUserSegment
                                            ? Colors.blue
                                            : Colors.grey)),
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${state.segments[index].timeMin}",
                                style: TextStyle(
                                    color: isUserSegment
                                        ? hoveredIndex == index
                                            ? const Color.fromARGB(
                                                255, 3, 87, 244)
                                            : Colors.blue
                                        : Colors.grey),
                              ),
                            ))),
                      ),
                    );
                  }),
            ))
          ]));
    });
  }
}
