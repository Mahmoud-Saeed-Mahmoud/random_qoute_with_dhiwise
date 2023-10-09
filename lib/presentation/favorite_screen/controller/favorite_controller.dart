import 'package:flutter/material.dart';
import 'package:randomqoutegenerator/core/app_export.dart';
import 'package:randomqoutegenerator/data/apiClient/api_client.dart';
import 'package:randomqoutegenerator/data/models/getQuoteById/get_get_quote_by_id_resp.dart';
import 'package:randomqoutegenerator/presentation/favorite_screen/models/favorite_model.dart';

/// A controller class for the FavoriteScreen.
///
/// This class manages the state of the FavoriteScreen, including the
/// current favoriteModelObj
class FavoriteController extends GetxController {
  TextEditingController searchController = TextEditingController();

  RxList<FavoriteModel> favoriteModelObj = <FavoriteModel>[].obs;

  RxList<FavoriteModel> filteredQoutes = <FavoriteModel>[].obs;

  GetGetQuoteByIdResp getGetQuoteByIdResp = GetGetQuoteByIdResp();

  RxList<String> storedIds = <String>[].obs;

  @override
  void onInit() {
    searchController.addListener(() {
      filterQoutes(searchController.text);
    });
    storedIds.assignAll(PrefUtils().getFavQoutes());
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }

  /// Calls the {{BASE_URL}}/quotes/:id API with the specified request data.
  ///
  /// The [Map] parameter represents request body
  Future<void> callGetQuoteById() async {
    for (String id in storedIds) {
      try {
        getGetQuoteByIdResp = await Get.find<ApiClient>().getQuoteById(id: id);
        debugPrint('called callGetQuoteById ${getGetQuoteByIdResp.content}');

        _handleGetQuoteByIdSuccess();
      } on GetGetQuoteByIdResp catch (e) {
        getGetQuoteByIdResp = e;
        rethrow;
      }
    }
  }

  /// handles the success response for the API
  void _handleGetQuoteByIdSuccess() {
    FavoriteModel favoriteModel = FavoriteModel(
      quoteText: Rx<String>(getGetQuoteByIdResp.content.toString()),
      authorName: Rx<String>(getGetQuoteByIdResp.author.toString()),
      id: Rx<String>(getGetQuoteByIdResp.sId.toString()),
    );
    favoriteModelObj.add(favoriteModel);
  }

  /// calls the [{{BASE_URL}}/quotes/:id] API
  ///
  /// It has [GetGetQuoteByIdReq] as a parameter which will be passed as a API request body
  /// If the call is successful, the function calls the `_onGetQuoteByIdSuccess()` function.
  /// If the call fails, the function calls the `_onGetQuoteByIdError()` function.
  ///
  /// Throws a `NoInternetException` if there is no internet connection.
  @override
  Future<void> onReady() async {
    try {
      await callGetQuoteById();
      _onGetQuoteByIdSuccess();
    } on GetGetQuoteByIdResp {
      _onGetQuoteByIdError();
    } on NoInternetException catch (e) {
      Get.rawSnackbar(message: e.toString());
    } catch (e) {
      //TODO: Handle generic errors
    }
  }

  void _onGetQuoteByIdSuccess() {}

  void _onGetQuoteByIdError() {}

  void filterQoutes(String text) {
    filteredQoutes.value = text.isEmpty
        ? favoriteModelObj
        : favoriteModelObj
            .where((qoute) => qoute.quoteText!.value.contains(text))
            .toList();
  }
}
