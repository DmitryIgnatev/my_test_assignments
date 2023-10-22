import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pyrobyte_test/UI/pages/vending_machines/bottom_sheet/components/bottom_sheet_message.dart';
import 'package:pyrobyte_test/UI/pages/vending_machines/bottom_sheet/components/bottom_sheet_settings.dart';
import 'package:pyrobyte_test/UI/pages/vending_machines/bottom_sheet/components/bottom_sheet_top.dart';
import 'package:pyrobyte_test/UI/pages/vending_machines/bottom_sheet/components/cash_input.dart';
import 'package:pyrobyte_test/UI/pages/vending_machines/bottom_sheet/components/price_lists.dart';
import 'package:pyrobyte_test/UI/pages/vending_machines/bottom_sheet/components/save_change_button.dart';
import 'package:pyrobyte_test/states/bottom_sheet_state.dart';
import 'package:pyrobyte_test/utils/di.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  @override
  void dispose() {
    super.dispose();
    //when the card is minimized, the state is reset
    state.cleanState();
  }

  final state = serviceLocator<BottomSheetState>();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Observer(
        builder: (context) => DecoratedBox(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(16),
                      topLeft: Radius.circular(16)),
                  color: theme.cardColor),
              child: FractionallySizedBox(
                heightFactor: 0.85,
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        right: 20,
                        left: 20,
                        top: 20,
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: const SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            BottomSheetMessage(),
                            SizedBox(
                              height: 20,
                            ),
                            CashInput(),
                            SizedBox(
                              height: 20,
                            ),
                            BottomSheetSettings(),
                            SizedBox(
                              height: 15,
                            ),
                            PriceLists(),
                            SizedBox(
                              height: 100,
                            )
                          ],
                        ),
                      ),
                    ),
                    //Top of the bottom Sheet
                    //Not scrollable
                    //By pulling down on this, you can close the modalBottomsheet
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: theme.cardColor,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(16),
                            topLeft: Radius.circular(16)),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(20),
                        child: BottomSheetTop(),
                      ),
                    ),
                    //Save Settings button on botton of screen
                    const Align(
                        alignment: Alignment.bottomCenter,
                        child: SaveChangeButton())
                  ],
                ),
              ),
            ));
  }
}
