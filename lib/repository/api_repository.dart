import 'package:get/get.dart';

abstract class ApiRepository extends GetxController {
  static ApiRepository get to => Get.find();
}

class ApiRepositoryImpl extends GetxController implements ApiRepository {
  // final _helper = ApiBaseHelper();

  // final Map<String, String> _headersWithoutToken = {
  //   'Content-Type': 'application/json'
  // };
}
