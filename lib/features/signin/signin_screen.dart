import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nms_chat/utils/utils.dart';

import '../../constants/app_texts.dart';
import '../../utils/theme/device_type.dart';
import '../../widgets/cornered_button.dart';
import '../../widgets/custom_login_textfield.dart';
import 'signin_controller.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isPhone = getDeviceTypeGetx() == DeviceType.phone;

    final width = MediaQuery.of(context).size.width;
    final height = isPhone ? width / 1080 * 1920 : width / 2048 * 2732;

    return GetBuilder<SignInController>(
        init: SignInController(),
        builder: (controller) {
          return GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: Scaffold(
              backgroundColor: backgroundColor,
              resizeToAvoidBottomInset: false,
              body: Stack(children: [
                Positioned(
                  bottom: 0,
                  child: SizedBox(
                    width: width,
                    height: height,
                  ),
                ),
                SafeArea(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          SvgPicture.asset(
                            "assets/svg/logo.svg",
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SvgPicture.asset(
                      "assets/svg/NMS.svg",
                    ),
                    const SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
                      child: Obx(
                        () => Column(
                          children: [
                            // Align(
                            //   alignment: Alignment.centerLeft,
                            //   child: Text(logInTitle,
                            //       style: AppTheme
                            //           .lightTheme.textTheme.headlineMedium),
                            // ),
                            // const SizedBox(
                            //   height: 16,
                            // ),
                            CustomLoginTextField(
                              context: context,
                              controller: controller.emailController,
                              labelText: emailLabel,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              prefixIcon: IconButton(
                                  icon: const Icon(
                                    Icons.mail_outline,
                                    color: secondaryMediumColor,
                                  ),
                                  onPressed: () {
                                    controller.onPasswordVisible();
                                  }),
                              obscureText: false,
                              autovalidateMode: controller.validationDisplay
                                  ? AutovalidateMode.always
                                  : AutovalidateMode.disabled,
                              validator: (email) {
                                return controller.emailValidator(email!);
                              },
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            CustomLoginTextField(
                              context: context,
                              labelText: passwordLabel,
                              obscureText: controller.isObscure,
                              controller: controller.passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              suffixIcon:SizedBox(
                                width: 0,
                                child: InkWell(
                                  onTap: (){
                                    controller.onPasswordVisible();
                                  },
                                  child: controller.isObscure? const Padding(
                                    padding:  EdgeInsets.only( right: 5 ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Center(child: Text('Show',style: TextStyle(color: primaryColor),)),
                                      ],
                                    ),
                                  ): const Padding(
                                    padding:  EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Center(child: Text('Hide',style: TextStyle(color: primaryColor),)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              // IconButton(
                              //     icon: Icon(
                              //       controller.isObscure
                              //           ? Icons.visibility
                              //           : Icons.visibility_off,
                              //       color: secondaryMediumColor,
                              //     ),
                              // onPressed: () {
                              //   controller.onPasswordVisible();
                              // }),
                              prefixIcon: IconButton(
                                  icon: const Icon(
                                    Icons.lock_outline,
                                    color: secondaryMediumColor,
                                  ),
                                  onPressed: () {
                                    controller.onPasswordVisible();
                                  }),
                              autovalidateMode: controller.validationDisplay
                                  ? AutovalidateMode.always
                                  : AutovalidateMode.disabled,
                              validator: (password) {
                                return controller.passwordValidator(password!);
                              },
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            CorneredButton(
                              height: 40,
                              color: primaryColor,
                              title: Login,
                              textcolor: backgroundColor,
                              onPress: (() => controller.login()),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 40),
                      child: Row(
                        children: [
                          Obx(
                            () => Expanded(
                              child: Theme(
                                data: Theme.of(context).copyWith(
                                  listTileTheme: const ListTileThemeData(
                                    contentPadding: EdgeInsets.all(0),
                                    dense: true,
                                    minLeadingWidth: 0,
                                    horizontalTitleGap: -5,
                                  ),
                                ),
                                child: CheckboxListTile(
                                  contentPadding: const EdgeInsets.all(0),
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  checkboxShape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4)),
                                  checkColor: Colors.white,
                                  side: const BorderSide(
                                      color: secondaryMediumColor),
                                  activeColor: primaryColor,
                                  title: Text(
                                    remember,
                                    style: AppTheme
                                        .lightTheme.textTheme.bodyLarge
                                        ?.copyWith(color: secondaryMediumColor),
                                  ),
                                  value: controller.isChecked.value,
                                  onChanged: (bool? value) {
                                    controller.oncheckBox(value);
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
                // Positioned(
                //   bottom: 0,
                //   left: 95,
                //   child: Padding(
                //     padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                //     child: GestureDetector(
                //         onTap: () => Get.toNamed('/signup_screen'),
                //         child: Center(
                //             child: RichText(
                //                 text: TextSpan(text: "", children: [
                //           TextSpan(
                //               text: dontHaveAccount,
                //               style: AppTheme.lightTheme.textTheme.bodyLarge
                //                   ?.copyWith(color: secondaryMediumColor)),
                //           TextSpan(
                //               text: signUp,
                //               style: AppTheme.lightTheme.textTheme.bodyLarge
                //                   ?.copyWith(
                //                       color: primaryColor,
                //                       decoration: TextDecoration.underline,
                //                       decorationColor: primaryColor))
                //         ])))),
                //   ),
                // ),
              ]),
            ),
          );
        });
  }
}
