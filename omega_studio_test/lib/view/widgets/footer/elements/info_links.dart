import 'package:flutter/material.dart';

import '../../../../utils/components/my_text_styles.dart';
import 'footer_list.dart';

class InfoLinks extends StatelessWidget {
  const InfoLinks({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: SizedBox(
                    width: screenWidth * 0.18,
                    child: Text(
                      "Компания",
                      style: MyTextStyles.desctopH6_23,
                    ),
                  ),
                ),
                FooterList(
                  listOfElements: const [
                    "Omega Studio",
                    "Работа в Omega Studio"
                  ],
                  width: screenWidth * 0.15,
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: SizedBox(
                    width: screenWidth * 0.18,
                    child: Text(
                      "Разработчикам",
                      style: MyTextStyles.desctopH6_23,
                    ),
                  ),
                ),
                FooterList(
                    listOfElements: const ["Справка"],
                    width: screenWidth * 0.15)
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: SizedBox(
                width: screenWidth * 0.18,
                child: Text(
                  "Пользователям",
                  style: MyTextStyles.desctopH6_23,
                ),
              ),
            ),
            FooterList(listOfElements: const [
              "Пользовательское соглашение",
              "Политика конфиденциальности",
              "Политика использования файлов cookie",
              "Справка"
            ], width: screenWidth * 0.15)
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: SizedBox(
                width: screenWidth * 0.18,
                child: Text(
                  "Бизнесу",
                  style: MyTextStyles.desctopH6_23,
                ),
              ),
            ),
            FooterList(listOfElements: const [
              "Контакты",
              "Новости",
              "Справка",
            ], width: screenWidth * 0.15)
          ],
        ),
      ],
    );
  }
}
