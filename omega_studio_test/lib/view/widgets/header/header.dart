import 'package:flutter/material.dart';
import 'package:omega_studio_test/view/widgets/header/elements/for_user_links.dart';
import 'package:omega_studio_test/view/widgets/header/elements/header_categories.dart';
import 'package:omega_studio_test/view/widgets/header/elements/menu_button.dart';
import 'package:omega_studio_test/view/widgets/header/elements/search_field.dart';

import '../../../utils/theme/theme.dart';
import 'elements/header_button.dart';

// Header for web application version
class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 100,
      width: screenWidth,
      color: ThemeColors.white,
      child: Padding(
        padding:
            EdgeInsets.fromLTRB(screenWidth * 0.1, 10, screenWidth * 0.05, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const ForUSerLinks(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Omega studio logo
                    const Image(
                      height: 50,
                      image: AssetImage("assets/pictures/png/Logo.png"),
                      fit: BoxFit.cover,
                    ),
                    // Omega studio logo
                    //
                    //Categories are hidden and replaced by the menu opening button when the screen width is reduced
                    screenWidth > 1200
                        ? const HeaderCategories()
                        : const SizedBox(),
                    //
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                        width: screenWidth * 0.25,
                        child: const SearchField(errorText: "")),
                    //Icons are hidden and replaced by the menu opening button when the screen width is reduced
                    screenWidth > 1200
                        ? const Row(
                            children: [
                              HeaderButton(
                                assetName:
                                    'assets/icons/svg/Icon_Shopping cart.svg',
                                buttonText: "",
                              ),
                              HeaderButton(
                                assetName: 'assets/icons/svg/Icon_Favorite.svg',
                                buttonText: "",
                              ),
                              HeaderButton(
                                assetName: 'assets/icons/svg/Icon_Login.svg',
                                buttonText: "Вход",
                              ),
                            ],
                          )
                        : const MenuButton()
                    //Icons are hidden and replaced by the menu opening button when the screen width is reduced
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
