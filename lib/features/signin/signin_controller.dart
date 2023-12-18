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

  // oncheckBox(value) {
  //   isChecked.value = value!;
  //   update();
  // }

//rememberMe
  // _saveCredentials() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   if (isChecked.value) {
  //     await prefs.setString('email', emailController.text);
  //     await prefs.setString('password', passwordController.text);
  //   } else {
  //     await prefs.remove('email');
  //     await prefs.remove('password');
  //   }
  //   _printSharedPreferencesContents(prefs); // Print contents to terminal
  // }

  // _printSharedPreferencesContents(SharedPreferences prefs) {
  //   final keys = prefs.getKeys();
  //   debugPrint("SharedPreferences contents:");
  //   for (String key in keys) {
  //     debugPrint("$key: ${prefs.get(key)}");
  //   }
  // }

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
      return "Should have minimum 5 letters";
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
            retryCount: 3);

        final response =
            await ApiRepository.to.logInWithEmail(request: request);

        if (response.message == "Success") {
          debugPrint('----------${response.data['accessToken']}--------------');
          debugPrint(
              '----------${response.data['refreshToken']}--------------');
          final nmsSharedPreferences = NMSSharedPreferences();
          String accessToken = response.data['accessToken'];
          String refreshToken = response.data['refreshToken'];
          await nmsSharedPreferences.saveTokensToPrefs(
              accessToken, refreshToken);
          // await _saveCredentials();
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
          List<String> errors = List<String>.from(errorResponse["errors"]);
          if (errors.contains("Bad credentials")) {
            showErrorSnackbar(
              title: "Error",
              message: "Email-id or password is incorrect",
            );
            return;
          } else if (errors.contains("USER NOT FOUND")) {
            showErrorSnackbar(
              title: "Error",
              message: "user not found",
            );
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
