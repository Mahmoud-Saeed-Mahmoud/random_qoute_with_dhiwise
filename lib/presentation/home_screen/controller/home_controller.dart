import 'package:randomqoutegenerator/core/app_export.dart';
import 'package:randomqoutegenerator/data/apiClient/api_client.dart';
import 'package:randomqoutegenerator/data/models/getRandom/get_get_random_resp.dart';
import 'package:randomqoutegenerator/presentation/home_screen/models/home_model.dart';

/// A controller class for the HomeScreen.
///
/// This class manages the state of the HomeScreen, including the
/// current homeModelObj
class HomeController extends GetxController {
  Rx<HomeModel> homeModelObj = HomeModel().obs;

  GetGetRandomResp getGetRandomResp = GetGetRandomResp();

  final favCount = Rx<int>(PrefUtils().getFavQoutes().length);

  /// Calls the {{BASE_URL}}/random?maxLength=150&minLength=100&tags=&author=&query= API with the specified request data.
  ///
  /// The [Map] parameter represents request body
  Future<void> callGetRandom(
      {Map<String, dynamic> queryParams = const {}}) async {
    try {
      getGetRandomResp =
          await Get.find<ApiClient>().getRandom(queryParams: queryParams);
      _handleGetRandomSuccess();
    } on GetGetRandomResp catch (e) {
      getGetRandomResp = e;
      rethrow;
    }
  }

  /// handles the success response for the API
  /// handles the success response for the API
  void _handleGetRandomSuccess() {
    homeModelObj.value.quoteText.value = getGetRandomResp.content!.toString();
    homeModelObj.value.authorName.value = getGetRandomResp.author!.toString();
    homeModelObj.value.quoteText.value = getGetRandomResp.content!.toString();
    homeModelObj.value.authorName.value = getGetRandomResp.author!.toString();
    homeModelObj.value.id.value = getGetRandomResp.sId.toString();
  }

  /// calls the [{{BASE_URL}}/random?maxLength=150&minLength=100&tags=&author=&query=] API
  ///
  /// It has [GetGetRandomReq] as a parameter which will be passed as a API request body
  /// If the call is successful, the function calls the `_onGetRandomSuccess()` function.
  /// If the call fails, the function calls the `_onGetRandomError()` function.
  ///
  /// Throws a `NoInternetException` if there is no internet connection.
  @override
  Future<void> onReady() async {
    Map<String, dynamic> queryParams = {};
    try {
      await callGetRandom(
        queryParams: queryParams,
      );
      _onGetRandomSuccess();
    } on GetGetRandomResp {
      _onGetRandomError();
    } on NoInternetException catch (e) {
      Get.rawSnackbar(message: e.toString());
    } catch (e) {
      //TODO: Handle generic errors
    }
  }

  void _onGetRandomSuccess() {}
  void _onGetRandomError() {}
}
