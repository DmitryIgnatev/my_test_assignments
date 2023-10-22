import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pyrobyte_test/UI/components/bordered_button.dart';
import 'package:pyrobyte_test/UI/components/custom_text_input.dart';
import 'package:pyrobyte_test/states/bottom_sheet_state.dart';
import 'package:pyrobyte_test/utils/di.dart';
import 'package:pyrobyte_test/utils/theme/theme.dart';

class PriceLists extends StatefulWidget {
  const PriceLists({super.key});

  @override
  State<PriceLists> createState() => _PriceListsState();
}

class _PriceListsState extends State<PriceLists> {
  final state = serviceLocator<BottomSheetState>();
  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    return Observer(
        builder: (context) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(localization!.price_lists,
                    style: theme.textTheme.titleMedium),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: width * 0.6,
                      child: Text(
                        localization.last_synchronization,
                        style:
                            theme.extension<CardFonts>()!.additionalInfoMedium,
                      ),
                    ),
                    Text('1 час назад',
                        style:
                            theme.extension<CardFonts>()!.additionalInfoMedium)
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      '#',
                      style: theme
                          .extension<BottomSheetFonts>()!
                          .supportingTextSmall,
                    ),
                    const SizedBox(
                      width: 56,
                    ),
                    Text(
                      localization.price,
                      style: theme
                          .extension<BottomSheetFonts>()!
                          .supportingTextSmall,
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.priceList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            children: [
                              const SizedBox(
                                  width: 56, child: CustomTextInput()),
                              const SizedBox(
                                width: 10,
                              ),
                              const SizedBox(
                                  width: 104, child: CustomTextInput()),
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  state.deletePriceList(index);
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(40)),
                                      color:
                                          Color.fromRGBO(249, 120, 121, 0.08)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(13),
                                    child: SvgPicture.asset(
                                      'assets/icons/close_pink.svg',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: 15,
                ),
                BorderedButton(
                  onTap: state.addNewPrice,
                  borderColor: theme.primaryColor,
                  child: SizedBox(
                    width: width,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          localization.input_line,
                          textAlign: TextAlign.center,
                          style: theme
                              .extension<BorderButtonFonts>()!
                              .borderedButtonSmall,
                        )),
                  ),
                ),
              ],
            ));
  }
}
