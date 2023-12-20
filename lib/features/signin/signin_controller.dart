import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nms_chat/managers/sharedpreferences/sharedpreferences.dart';
import 'package:nms_chat/utils/utils.dart';

import '../../controller/app_controller.dart';
import '../../dtos/login/login.dart';
import '../../mixins/snackbar_mixin.dart';
import '../../repository/api_repository.dart';

class SignInController extends GetxController with SnackbarMixin {
  // final JBSharedPreferences authService = JBSharedPreferences();

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
      return "email-id required";
    } else if (!isValidEmail(emailController.text)) {
      return invalidEmail;
    }
    return null;
  }

  String? passwordValidator(String value) {
    if (value.isEmpty
        //  || value.length < 7
        ) {
      return "password required";
    } else if (value.length < 5) {
      return "minimum 5 Characters";
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
        showErrorSnackbar(title: errorText, message: invalidEmail);
        return false;
      } else {
        _validationDisplay.value = true;
        return false;
      }
    } else if (emailController.value.text.isNotEmpty &&
        passwordController.value.text.isNotEmpty) {
      if (!isValidEmail(emailController.value.text)) {
        showErrorSnackbar(title: errorText, message: invalidEmail);
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
          showErrorSnackbar(title: errorText, message: errorOccuredText);
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
                showErrorSnackbar(
                  title: "Error",
                  message:
                      "Email-id or password is incorrect \n you have $retryCount more attempts remaing  ",
                );
              } else if (retryCount == 0) {
                showErrorSnackbar(
                  title: "Error",
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
          title: "Catch",
          message: e.toString(),
        );
        return e.toString();
      }
    }
  }
}
