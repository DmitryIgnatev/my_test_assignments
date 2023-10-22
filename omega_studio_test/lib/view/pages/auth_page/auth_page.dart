import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omega_studio_test/services/input_validator.dart';
import 'package:omega_studio_test/utils/theme/theme.dart';
import 'package:omega_studio_test/view/pages/auth_page/widgets/auth_button.dart';
import 'package:omega_studio_test/view/pages/auth_page/widgets/auth_services.dart';
import 'package:omega_studio_test/view/pages/auth_page/widgets/auth_text_field.dart';
import 'package:omega_studio_test/view/pages/auth_page/widgets/coming_with_text.dart';
import 'package:omega_studio_test/view/pages/auth_page/widgets/entrance_text.dart';
import 'package:omega_studio_test/view/pages/auth_page/widgets/info_text.dart';
import 'package:omega_studio_test/view/pages/auth_page/widgets/password_link.dart';
import 'package:omega_studio_test/view/pages/auth_page/widgets/registration_link.dart';
import 'package:omega_studio_test/view/widgets/footer/footer.dart';
import 'package:omega_studio_test/view/widgets/appbar.dart';
import 'package:omega_studio_test/view/widgets/header/header.dart';
import '../../../blocs/auth/bloc/auth_bloc.dart';
import '../../../services/user_service.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({
    super.key,
  });

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  String errorText = "";
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar(context),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/pictures/png/background.png'),
          fit: BoxFit.cover,
        )),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Header shows only in web version
              kIsWeb ? const Header() : const SizedBox(),

              SizedBox(height: screenHeight * 0.2),
              Align(
                alignment: const Alignment(kIsWeb ? -0.75 : 0, 1),
                child:
                    //Сard with login and password input and user authorization functionality
                    Container(
                  decoration: const BoxDecoration(
                    color: ThemeColors.whiteCard,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  height: 500,
                  width: screenWidth < 600 ? screenWidth * 0.9 : 500,
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child:
                        //BlocBuilder that changes the state of the password and login
                        BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // Information Text
                            const EntranceText(),
                            const InfoText(),
                            // Information Text

                            // TextFields with input email and Password
                            AuthTextField(
                              hintText: "Email",
                              errorText: errorText,
                              isEmail: true,
                              onChanged: (value) => context
                                  .read<AuthBloc>()
                                  .add(EmailChangedEvent(email: value)),
                            ),
                            AuthTextField(
                              hintText: "Пароль",
                              errorText: errorText,
                              isEmail: false,
                              onChanged: (value) => context
                                  .read<AuthBloc>()
                                  .add(PasswordChangedEvent(password: value)),
                            ),
                            // TextFields with input email and Password
                            //
                            const PasswordLink(),
                            //
                            // Authorization button
                            AuthButton(
                              onTap: () {
                                setState(() {
                                  debugPrint(
                                      "Email: ${state.email} \nPassword: ${state.password} ");

                                  errorText = InputValidator.authValidator(
                                      state.email, state.password);
                                  if (errorText.isEmpty) {
                                    UserService.auth(
                                        state.email, state.password, context);
                                  }
                                });
                              },
                            ),
                            // Authorization button

                            // Alternative auth services
                            const ComingWithText(),
                            const AuthServicesRow(),
                            // Alternative auth services

                            //Registration Link
                            const RegistrationLink(),
                            //Registration Link
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.2),
              // Footer shows only in web version
              kIsWeb ? const Footer() : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
