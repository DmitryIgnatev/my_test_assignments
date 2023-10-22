import 'package:flutter/material.dart';

import '../../../../utils/theme/theme.dart';

class AuthServicesRow extends StatefulWidget {
  const AuthServicesRow({super.key});

  @override
  State<AuthServicesRow> createState() => _AuthServicesRowState();
}

class _AuthServicesRowState extends State<AuthServicesRow> {
  int? hoveredIndex;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenWidth > 350 ? 60 : 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              final assetsNames = [
                "assets/icons/png/Icon_YandexColor.png",
                "assets/icons/png/Icon_GoogleColor.png",
                "assets/icons/png/Icon_VKColor.png"
              ];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: InkWell(
                  onHover: (value) {
                    setState(() {
                      value ? hoveredIndex = index : hoveredIndex = null;
                    });
                  },
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1.5,
                        color: hoveredIndex == index
                            ? ThemeColors.hoverButton
                            : Colors.transparent,
                      ),
                      color: ThemeColors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(
                        screenWidth > 350 ? 15 : 10,
                      ),
                      child: Image(
                        image: AssetImage(assetsNames[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
