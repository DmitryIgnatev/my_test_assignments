import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pyrobyte_test/UI/pages/vending_machines/components/info_title.dart';
import 'package:pyrobyte_test/domain/models/vending_machine_item.dart';
import 'package:pyrobyte_test/utils/theme/theme.dart';

class VendingMachineInfo extends StatelessWidget {
  const VendingMachineInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          color: theme.cardColor),
      child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                  width: width,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16, right: 8),
                    child: Text(
                      vendingMachineItem.type,
                      textAlign: TextAlign.end,
                      style: theme.textTheme.displaySmall,
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 16, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${vendingMachineItem.number}',
                      style: theme.textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                              color: tmnRedPink,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          localization!.doesnt_work,
                          style: theme.textTheme.titleSmall,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      vendingMachineItem.position,
                      style: theme.textTheme.displaySmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: 1,
            width: width,
            color: theme.scaffoldBackgroundColor,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                InfoTitle(
                  name: localization.bus_type,
                  status: vendingMachineItem.busType,
                ),
                InfoTitle(
                  name: localization.signal_level,
                  status: vendingMachineItem.signalLevel,
                ),
                InfoTitle(
                  name: localization.identifier,
                  status: '${vendingMachineItem.identifier}',
                ),
                InfoTitle(
                  name: localization.modem,
                  status: vendingMachineItem.modem,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final vendingMachineItem = VendingMachineItem(
    number: 54467345,
    status: 'Не работает',
    type: 'Снековый',
    position: 'Тц мега, химки',
    busType: 'MDB',
    signalLevel: 'Стабильный',
    identifier: 13856646,
    modem: '3463457365');
