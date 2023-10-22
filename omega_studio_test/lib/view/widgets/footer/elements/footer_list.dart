import 'package:flutter/material.dart';

import '../../../../services/information_service.dart';
import '../../../../utils/components/my_text_styles.dart';

class FooterList extends StatelessWidget {
  const FooterList(
      {super.key, required this.listOfElements, required this.width});

  final List<String> listOfElements;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: listOfElements.length, // Количество элементов в списке
          itemBuilder: (BuildContext context, int index) {
            // Создание виджета для каждого элемента списка
            return InkWell(
              onTap: () {
                InformationService.showSnackBar(
                  context,
                  listOfElements[index],
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  listOfElements[index],
                  style: MyTextStyles.desctopText,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
