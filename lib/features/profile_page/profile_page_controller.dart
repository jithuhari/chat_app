import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../mixins/snackbar_mixin.dart';
import '../../dtos/chat_app_dtos/profile_details/profile_details.dart';
import '../../models/profile_Details/profile_details_model.dart';
import '../../repository/nms_chat_api_repository.dart';
import '../chat_window/chat_window.dart';

class ProfilePageController extends GetxController with SnackbarMixin {

  final ChatWindowController chatWindowController =
      Get.find<ChatWindowController>();
      // Get.put(ChatWindowController());

  // final Map<String, dynamic> arguments = Get.arguments;
  
  // late final int receiverId = arguments['receiverId'];

  final _profileDetailsModelData = Rx<ProfileDetailsData?>(null);
  ProfileDetailsData? get profileDetailsModelData =>
      _profileDetailsModelData.value;

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  final _email = "".obs;
  String get email => _email.value;

  final _firstName = "".obs;
  String get firstName => _firstName.value;

  final _lastName = "".obs;
  String get lastName => _lastName.value;

  final _phNumber = "".obs;
  String get phNumber => _phNumber.value;
  

  @override
  void onInit() async {
    // print(chatWindowController.receiverId);
    await fetchProfileDetails();
    super.onInit();
  }

  fetchProfileDetails() async {
    _isLoading.value = true;
    try {
      final request = ProfileDetailsRequest(
        userId:
        chatWindowController.receiverId.toString()
        
      );
      final response =
          await NMSChatApiRepository.to.profileDetails(request: request);
      if (response.status == 200) {
        _profileDetailsModelData.value = response.data;

        debugPrint(
            "Categorylist-- length  ${_profileDetailsModelData.value!.email}");

        _email.value = _profileDetailsModelData.value!.email;
        _firstName.value = _profileDetailsModelData.value!.firstName;
        _lastName.value = _profileDetailsModelData.value!.lastName;
        _phNumber.value = _profileDetailsModelData.value!.phone;
        // if (_chatListModelData.isNotEmpty) {
        //   for (int i = 0; i < chatListModelData.length; i++) {
        //     // _chatUserListLength.value = _chatListModelData.length;
        //   }
        // }
      }
      update();
    } catch (e) {
      showErrorSnackbar(message: e.toString());
      _isLoading.value = false;
      debugPrint(e.toString());
    }
  }
}
