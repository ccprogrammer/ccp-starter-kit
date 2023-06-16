import 'package:ccp_starter/example/models/example_user_model.dart';
import 'package:ccp_starter/example/services/example_api_service.dart';
import 'package:get/get.dart';

class ExampleAuthController extends GetxController {
  ExampleApiService api = ExampleApiService();

  var isLoggedIn = false.obs;

  var user = Rxn<UserModel>(); // null state for GetX model

  getProfile() {}

  updateProfile() async {
    await api.get(
      endpoint: 'example-user-profile',
      isLog: true,
      res: (res, response) {
        user.update((model) => UserModel.updateModel(
              model!,
              {
                'id_user': 1, // new id here
                'token': '', // new token
                'user_email': '', // new email
                'user_name': '', // new user name
              },
              // or just put res['user'] insteand of {...} and match the parameter
            ));
      },
      onError: (statusCode, statusMessage, othersError, dioError) {},
    );
  }
}
