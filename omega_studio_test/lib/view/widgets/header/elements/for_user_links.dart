import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/theme/theme.dart';

class ForUSerLinks extends StatefulWidget {
  const ForUSerLinks({super.key});

  @override
  State<ForUSerLinks> createState() => _ForUSerLinksState();
}

class _ForUSerLinksState extends State<ForUSerLinks> {
  List titles = ["Для вас", "Для бизнеса", "Для разработчиков"];
  int? hoveredIndex;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: titles.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(left: 10),
                child: InkWell(
                  onHover: (value) {
                    setState(() {
                      value ? hoveredIndex = index : hoveredIndex = null;
                    });
                  },
                  onTap: () {},
                  child: Text(titles[index],
                      style: GoogleFonts.rubik(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.03,
                          color: hoveredIndex == index
                              ? ThemeColors.linkHover
                              : ThemeColors.link)),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
