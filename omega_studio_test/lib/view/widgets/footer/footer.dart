import 'package:flutter/material.dart';
import 'package:omega_studio_test/utils/components/my_text_styles.dart';
import 'package:omega_studio_test/view/widgets/footer/elements/download_button.dart';
import 'package:omega_studio_test/view/widgets/footer/elements/footer_list.dart';
import 'package:omega_studio_test/view/widgets/footer/elements/info_links.dart';
import '../../../utils/theme/theme.dart';
import 'elements/social_link_button.dart';

///Footer for web application version
class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: ThemeColors.footerColor,
      width: screenWidth,
      child: Padding(
        padding:
            EdgeInsets.fromLTRB(screenWidth * 0.1, 90, screenWidth * 0.05, 60),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Block of information for users, developers, and businesses
                const InfoLinks(),
                //Block of information for users, developers, and businesses

                //Block with the ability to download the application and go to social networks
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const DownloadButton(),
                    Row(
                      children: [
                        SizedBox(
                          width: screenWidth * 0.08,
                          child: Text(
                            "Социальные сети",
                            style: MyTextStyles.desctopButtonLight,
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * 0.12,
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Wrap(
                                alignment: WrapAlignment.start,
                                children: [
                                  SocialLinkButton(
                                    assetName: 'assets/icons/svg/vk.svg',
                                  ),
                                  SocialLinkButton(
                                    assetName: 'assets/icons/svg/telegram.svg',
                                  ),
                                  SocialLinkButton(
                                    assetName: 'assets/icons/svg/youtube.svg',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            //Block with the ability to download the application and go to social networks
            //
            Container(
              color: ThemeColors.bgCard,
              width: screenWidth,
              height: 0.8,
            ),
            const SizedBox(
              height: 20,
            ),
            //
            //Legal information about the company
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FooterList(listOfElements: const [
                  "© 2023 ООО «ОМЕГА СТУДИО»ИНН: 3528327105, ОГРН: 1213500003122162608, Вологодская область, г. Череповец, ул Белинского, д. 1/3",
                ], width: screenWidth * 0.35),
                SizedBox(
                  width: screenWidth * 0.12,
                  child: const Image(
                    image: AssetImage(
                        "assets/pictures/png/footer_logo_fasie1.png"),
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
            //Legal information about the company
          ],
        ),
      ),
    );
  }
}
