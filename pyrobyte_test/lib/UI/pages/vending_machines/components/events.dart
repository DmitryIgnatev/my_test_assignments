import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pyrobyte_test/UI/components/bordered_button.dart';
import 'package:pyrobyte_test/UI/components/event_card.dart';
import 'package:pyrobyte_test/domain/models/message_item.dart';
import 'package:pyrobyte_test/utils/theme/theme.dart';

class Events extends StatelessWidget {
  const Events({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            localization!.events,
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(
            height: 16,
          ),
          MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: messages.length < 4 ? messages.length : 3,
                itemBuilder: (context, index) {
                  final messageItem = messages[index];
                  return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: EventCard(
                        time: messageItem.time,
                        message: messageItem.message,
                        info: messageItem.info,
                      ));
                }),
          ),
          const SizedBox(
            height: 5,
          ),
          BorderedButton(
            borderColor: theme.primaryColor,
            child: SizedBox(
              width: width,
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    localization.see_more,
                    textAlign: TextAlign.center,
                    style: theme
                        .extension<BorderButtonFonts>()!
                        .borderedButtonSmall,
                  )),
            ),
          )
        ],
      ),
    );
  }
}

List<EventItem> messages = [
  EventItem(
    time: '14:00',
    message: 'Сейф переполнен',
  ),
  EventItem(
    time: '11:20',
    message: 'Сломался купюроприемник',
    info: '2341245',
  ),
  EventItem(
    time: '11:20',
    message: 'Закончились наличные',
    info: 'Toshiba снековый',
  ),
];
