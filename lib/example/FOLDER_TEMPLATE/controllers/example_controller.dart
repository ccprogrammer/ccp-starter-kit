import 'package:ccp_starter/example/services/example_api_service.dart';
import 'package:get/get.dart';

class ExampleController extends GetxController {
  ExampleApiService api = ExampleApiService();

  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  getData() {}

  getTest() async {
    await api.get(
      endpoint: 'users?page=1',
      isLog: true,
      res: (res, response) {},
      onError: (statusCode, statusMessage, othersError, dioError) {},
    );
  }

  postTest() async {
    await api.post(
      endpoint: 'https://reqres.in/api/users',
      useBaseUrl: false,
      isLog: true,
      body: {
        "name": "morpheus",
        "job": "leader",
      },
      res: (res, response) {},
      onError: (statusCode, statusMessage, othersError, dioError) {},
    );
  }

  putTest() async {
    await api.put(
      endpoint: 'users/2',
      body: {"name": "morpheus", "job": "zion resident"},
      isLog: true,
      res: (res, response) {},
      onError: (statusCode, statusMessage, othersError, dioError) {},
    );
  }

  deleteTest() async {
    await api.delete(
      endpoint: 'users/2',
      isLog: true,
      res: (res, response) {},
      onError: (statusCode, statusMessage, othersError, dioError) {},
    );
  }
}
