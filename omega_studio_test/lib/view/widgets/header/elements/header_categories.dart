import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../services/information_service.dart';
import '../../../../utils/theme/theme.dart';

class HeaderCategories extends StatefulWidget {
  const HeaderCategories({super.key});

  @override
  State<HeaderCategories> createState() => _HeaderCategoriesState();
}

class _HeaderCategoriesState extends State<HeaderCategories> {
  int? hoveredIndex;
  int tappedIndex = 0;
  List listOfElements = [
    "Игры",
    "Приложения",
    "Сообщество",
    "Турнир",
    "Справка",
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 15),
        child: SizedBox(
          height: 25,
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: listOfElements.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onHover: (value) {
                    setState(() {
                      value ? hoveredIndex = index : hoveredIndex = null;
                    });
                  },
                  onTap: () {
                    tappedIndex = index;
                    InformationService.showSnackBar(
                      context,
                      listOfElements[index],
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      listOfElements[index],
                      style: GoogleFonts.rubik(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.03,
                        color: hoveredIndex == index
                            ? ThemeColors.hoverButton
                            : ThemeColors.textH,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ));
  }
}
