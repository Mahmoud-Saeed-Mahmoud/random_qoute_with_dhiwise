import 'package:randomqoutegenerator/core/app_export.dart';
import 'package:randomqoutegenerator/core/utils/progress_dialog_utils.dart';
import 'package:randomqoutegenerator/data/models/getQuoteById/get_get_quote_by_id_resp.dart';
import 'package:randomqoutegenerator/data/models/getRandom/get_get_random_resp.dart';

class ApiClient extends GetConnect {
  var url = Get.find<EnvConfig>().config.baseUrl;

  @override
  void onInit() {
    super.onInit();
    httpClient.timeout = const Duration(seconds: 60);
  }

  ///method can be used for checking internet connection
  ///returns [bool] based on availability of internet
  Future isNetworkConnected() async {
    if (!await Get.find<NetworkInfo>().isConnected()) {
      throw NoInternetException('No Internet Found!');
    }
  }

  /// is `true` when the response status code is between 200 and 299
  ///
  /// user can modify this method with custom logics based on their API response
  bool _isSuccessCall(Response response) {
    return response.isOk;
  }

  /// Performs API call for {{BASE_URL}}/quotes/:id
  ///
  /// Sends a GET request to the server's '{{BASE_URL}}/quotes/:id' endpoint
  /// with the provided headers and request data
  /// Returns a [GetGetQuoteByIdResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<GetGetQuoteByIdResp> getQuoteById({String? id = ''}) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await httpClient.get('$url/quotes/$id');
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return GetGetQuoteByIdResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? GetGetQuoteByIdResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Performs API call for {{BASE_URL}}/random?maxLength=150&minLength=100&tags=&author=&query=
  ///
  /// Sends a GET request to the server's '{{BASE_URL}}/random?maxLength=150&minLength=100&tags=&author=&query=' endpoint
  /// with the provided headers and request data
  /// Returns a [GetGetRandomResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<GetGetRandomResp> getRandom(
      {Map<String, dynamic> queryParams = const {}}) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await httpClient.get(
        '$url/random',
        query: queryParams,
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return GetGetRandomResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? GetGetRandomResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}
