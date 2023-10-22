import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pyrobyte_test/UI/pages/vending_machines/bottom_sheet/custom_bottom_sheet.dart';
import 'package:pyrobyte_test/states/bottom_sheet_state.dart';
import 'package:pyrobyte_test/utils/di.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  final state = serviceLocator<BottomSheetState>();
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        // Status bar color (in Figma status bar is transparent)
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.all(18),
        child: InkWell(
            onTap: () {
              // Navigator.pop(context);
            },
            child: SvgPicture.asset('assets/icons/arrow_2.svg')),
      ),
      floating: true,
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset('assets/icons/gear.svg'),
          onPressed: () async {
            await showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return const CustomBottomSheet();
                });
          },
        ),
      ],
    );
  }
}
