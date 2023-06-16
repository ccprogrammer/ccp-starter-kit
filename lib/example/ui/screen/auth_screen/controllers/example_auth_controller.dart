import 'package:ccp_starter/example/models/example_profile_model.dart';
import 'package:get/get.dart';

class ExampleAuthController extends GetxController {
  var isLoggedIn = false.obs;

  var user = Rxn<UserModel>(); // null state for GetX model

  getProfile() {}

  updateProfile() {
    user.update((model) => UserModel.updateModel(
          model!,
          {
            'id_user': 1, // new id here
            'token': '', // new token
            'user_email': '', // new email
            'user_name': '', // new user name
          },
        ));
  }
}
