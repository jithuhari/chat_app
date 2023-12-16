import 'package:get/get.dart';

import '../dtos/login/login.dart';
import '../managers/api/api.dart';

abstract class ApiRepository extends GetxController {
  static ApiRepository get to => Get.find();

  ////sign in

  //Signin_Screen 
  Future<SubmitLoginResponse> logInWithEmail(
      {required SubmitLoginRequest request});
}

class ApiRepositoryImpl extends GetxController implements ApiRepository {
  final _helper = ApiBaseHelper();

  final Map<String, String> _headersWithoutToken = {
    'Content-Type': 'application/json'
  };

  // final Map<String, String> _header = {'org-id': 'nintriva'};

  //SiginScreen - submitsignin  Api
  @override
  Future<SubmitLoginResponse> logInWithEmail(
      {required SubmitLoginRequest request}) async {
    final response = await _helper.postWithBody(
      headers: _headersWithoutToken,
      endpoint: ApiEndPoints.login,
      body: request.toBody(),
      params: {},
    );
    return SubmitLoginResponse.fromJson(response);
  }
}
