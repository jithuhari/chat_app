import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nms_chat/managers/sharedpreferences/sharedpreferences.dart';
import 'package:nms_chat/utils/utils.dart';

import '../../controller/app_controller.dart';
import '../../dtos/login/get_employ/get_employ.dart';
import '../../dtos/login/login_dtos/login.dart';
import '../../mixins/snackbar_mixin.dart';
import '../../models/login_screen/get_employ_model.dart';
import '../../repository/api_repository.dart';

class SignInController extends GetxController with SnackbarMixin {
  @override
  void onInit() async {
    await getEmployDetails();
    super.onInit();
  }
  // final JBSharedPreferences authService = JBSharedPreferences();

  final _getEmployData = (List<CorporateDetails>.empty()).obs;
  List<CorporateDetails> get getEmployData => _getEmployData;

  final loginFormKey = GlobalKey<FormState>();
  final _isLoadingOverlay = false.obs;
  bool get isLoadingOverlay => _isLoadingOverlay.value;

  final _retryCount = 3.obs;
  int get retryCount => _retryCount.value;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  var otpController = TextEditingController().obs;
  final _validationDisplay = false.obs;
  bool get validationDisplay => _validationDisplay.value;

  final isChecked = false.obs;

  //bool isChecked = false;

  bool isObscure = true;

  //password hide
  final _obsecureText = true.obs;
  bool get obsecureText => _obsecureText.value;

  // Future<void> loadUserDataFromSharedPreferences() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final savedEmail = prefs.getString('email') ?? '';
  //   final savedPassword = prefs.getString('password') ?? '';
  //   emailController.text = savedEmail;
  //   passwordController.text = savedPassword;
  // }

  onPasswordVisible() {
    isObscure = !isObscure;
    update();
  }

  oncheckBox(value) {
    isChecked.value = value!;
    update();
  }

  String? emailValidator(String value) {
    if (value.isEmpty) {
      return emailRequiredText;
    } else if (!isValidEmail(emailController.text)) {
      return invalidEmail;
    }
    return null;
  }

  String? passwordValidator(String value) {
    if (value.isEmpty
        //  || value.length < 7
        ) {
      return passwordRequiredText;
    } else if (value.length < 5) {
      return "Minimum 5 Characters";
    }
    return null;
  }

  passwordAndEmailValidation() {
    if (emailController.text.isEmpty && passwordController.text.isEmpty) {
      _validationDisplay.value = true;
      return false;
    } else if (emailController.text.isEmpty &&
        passwordController.text.isNotEmpty) {
      _validationDisplay.value = true;
      return false;
    } else if (emailController.value.text.isNotEmpty &&
        passwordController.value.text.isEmpty) {
      if (!isValidEmail(emailController.value.text)) {
        showErrorSnackbar(message: invalidEmail);
        return false;
      } else {
        _validationDisplay.value = true;
        return false;
      }
    } else if (emailController.value.text.isNotEmpty &&
        passwordController.value.text.isNotEmpty) {
      if (!isValidEmail(emailController.value.text)) {
        showErrorSnackbar(message: invalidEmail);
        return false;
      } else {
        return true;
      }
    }
  }

  Future<void> login() async {
    //String platform = (Platform.isAndroid || Platform.isIOS) ? "MOBILE" : "WEB";
    if (passwordAndEmailValidation()) {
      try {
        final request = SubmitLoginRequest(
            username: emailController.text,
            // 'francis@nintriva.com',
            password: passwordController.text,
            // 'admin',
            retryCount: retryCount);

        final response =
            await ApiRepository.to.logInWithEmail(request: request);

        if (response.status == 200) {
          debugPrint('----------${response.data['accessToken']}--------------');
          debugPrint(
              '----------${response.data['refreshToken']}--------------');
          final nmsSharedPreferences = NMSSharedPreferences();
          String accessToken = response.data['accessToken'];
          String refreshToken = response.data['refreshToken'];
          await nmsSharedPreferences.saveTokensToPrefs(
              accessToken, refreshToken);

          await AppController.to.signedIn();

          emailController.clear();
          passwordController.clear();
        } else if (response.message == "Failed") {
          debugPrint(response.errors['errorMessage']);
          showErrorSnackbar(message: errorOccuredText);
        }
      } catch (e) {
        return catchErrorSection(e);
      }
    }
  }

  catchErrorSection(e) async {
    debugPrint('error-----${e.toString()}------');

    if (e.toString().isNotEmpty) {
      try {
        Map<String, dynamic> errorResponse = jsonDecode(e.toString());

        if (errorResponse.containsKey("errors")) {
          Map<String, dynamic> errors =
              Map<String, dynamic>.from(errorResponse["errors"]);
          if (errors.containsKey("errorMessage")) {
            String errorMessage = errors["errorMessage"];

            if (errorMessage.contains("Bad Credentials")) {
              if (retryCount > 0) {
                _retryCount.value = retryCount - 1;
                update();
                if (retryCount == 0) {
                  showErrorSnackbar(
                    message:
                        "incorrect Email-id or password, No attempts remaing",
                  );
                } else {
                  showErrorSnackbar(
                    message:
                        "incorrect Email-id or password, $retryCount attempts remaing  ",
                  );
                }
              } else if (retryCount == 0) {
                showErrorSnackbar(
                  message:
                      "You have exceeded the total number of attempts. Please Change your password",
                );
              }
            }

            return;
          }
        }
      } catch (e) {
        debugPrint('Error decoding JSON: ${e.toString()}');
        showErrorSnackbar(
          message: e.toString(),
        );
        return e.toString();
      }
    }
  }

  //get employ details

  getEmployDetails() async {
    // _isLoading.value = true;
    try {
      final request = GetEmpoyRequest(userId: 'd247c096-7e83-457b-a510-38d61e3a9117');
      final response =
          await ApiRepository.to.getEmployDetails(request: request);
      if (response.status == 200) {
        _getEmployData.value = response.data;

        debugPrint("Categorylist-- length  ${_getEmployData.length}");
        // if (_chatListModelData.isNotEmpty) {
        //   for (int i = 0; i < chatListModelData.length; i++) {
        //     _chatUserListLength.value = _chatListModelData.length;
        //     // Parse lastMessageTime string to DateTime
        //     DateTime lastMessageDateTime =
        //         DateTime.parse(chatListModelData[i].lastMessageTime.toString());

        //     // Add 5 hours and 30 minutes
        //     lastMessageDateTime = lastMessageDateTime.add(
        //       const Duration(hours: 5, minutes: 30),
        //     );

        //     // Get today's date
        //     DateTime now = DateTime.now();
        //     DateTime today = DateTime(now.year, now.month, now.day);

        //     // Calculate the date a week ago
        //     DateTime oneWeekAgo = today.subtract(const Duration(days: 7));

        //     // Format DateTime to a string with the desired format
        //     String formattedDate =
        //         DateFormat('dd/MM/yyyy').format(lastMessageDateTime);
        //     String formattedTime =
        //         DateFormat('HH:mm').format(lastMessageDateTime);

        //     // Check if the message was sent today
        //     if (lastMessageDateTime.isAfter(today)) {
        //       // String formattedDay = 'Today';
        //       // _formattedLastMessageTime.add(formattedDay);
        //       _formattedLastMessageTime.add(formattedTime);
        //     } else {
        //       // Check if the message was sent yesterday
        //       DateTime yesterday = today.subtract(const Duration(days: 1));
        //       if (lastMessageDateTime.isAfter(yesterday)) {
        //         String formattedDay = 'Yesterday';
        //         _formattedLastMessageTime.add(formattedDay);
        //       } else {
        //         // Check if the message was sent before a week
        //         if (lastMessageDateTime.isAfter(oneWeekAgo)) {
        //           // If yes, show the date

        //           String formattedDay =
        //               DateFormat('EEEE').format(lastMessageDateTime);
        //           _formattedLastMessageTime.add(formattedDay);
        //         } else {
        //           // If not today, yesterday, or before a week, add the formatted time
        //           _formattedLastMessageTime.add(formattedDate);
        //         }
        //       }
        //     }

        //     debugPrint('-----time/day------${_formattedLastMessageTime[i]}');
        //   }
        // }

        // else {}
        // _isLoading.value = false;
        update();
      }
    } catch (e) {
      showErrorSnackbar(message: e.toString());
      // _isLoading.value = false;
      debugPrint(e.toString());
    }
  }
}
