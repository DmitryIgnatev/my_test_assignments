import 'package:flutter/material.dart';
import 'package:pyrobyte_test/UI/pages/vending_machines/components/custom_app_bar.dart';
import 'package:pyrobyte_test/UI/pages/vending_machines/components/events.dart';
import 'package:pyrobyte_test/UI/pages/vending_machines/components/finance.dart';
import 'package:pyrobyte_test/UI/pages/vending_machines/components/loading_info.dart';
import 'package:pyrobyte_test/UI/pages/vending_machines/components/title_text.dart';
import 'package:pyrobyte_test/UI/pages/vending_machines/components/vending_machine_info.dart';
import 'package:pyrobyte_test/utils/theme/theme.dart';

class VendingMachinesPage extends StatelessWidget {
  const VendingMachinesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: const CustomScrollView(
        slivers: <Widget>[
          CustomAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: appMainPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleText(),
                  SizedBox(height: 25),
                  VendingMachineInfo(),
                  SizedBox(height: 25),
                  LoadingInfo(),
                  SizedBox(height: 25),
                  Events(),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 25),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Finance(),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 25),
          ),
        ],
      ),
    );
  }
}
