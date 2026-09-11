import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cars_and_alll/app/constants/text_data.dart';
import 'package:cars_and_alll/app/services/storage.dart';
import 'package:cars_and_alll/app/services/user.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../utils/logger.dart';
import 'api_routes.dart';

class ApiClient extends GetConnect implements GetxService {
  static ApiClient get to => Get.find();

  final _logger = Logger("LoggingInterceptor 🔥");
  late Map<String, String> _mainHeaders;

  ApiClient() {
    String token = StorageService.to.getString(ConstantData.userBearerToken);
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };

    httpClient.addRequestModifier<dynamic>((request) async {
      _logger.log(
        '=====================================================================================================================',
      );
      _logger.log('Request: ${request.method}');
      _logger.log('Path: ${request.url.path}');
      _logger.log('Header: ${request.headers}');
      _logger.log(
        '=====================================================================================================================',
      );
      return request;
    });

    // Response Interceptor
    httpClient.addResponseModifier((request, response) {
      _logger.log(
        '=====================================================================================================================',
      );
      _logger.log('Status: ${response.statusCode}');
      _logger.log('Data: ${response.body}');
      _logger.log(
        '=====================================================================================================================',
      );
      return response;
    });
  }

  setHeaders(String token) {
    timeout = const Duration(seconds: 30);
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
    StorageService.to.setString(ConstantData.userBearerToken, token);
  }

  bool validateResponse(res) {
    if (res.body['success'] == true) {
      return true;
    } else {
      return false;
    }
  }

  loginWithPhone(
    Map<String, String> phoneAuth, {
    required Function(Response res) onSuccess,
    required Function(Response error) onError,
  }) async {
    try {
      Response res = await httpClient.post(
        '${ApiRoutes.baseUrl}${ApiRoutes.loginWithPhone}',
        body: phoneAuth,
      );
      if (validateResponse(res)) {
        setHeaders(res.body['token']);
        onSuccess(res);
      } else {
        onError(res);
      }
    } catch (err) {
      onError(Response(statusCode: 404, body: {'message': '$err'}));
    }
  }

  otpSendToPhone(
    Map<String, String> phoneAuth, {
    required Function(Response res) onSuccess,
    required Function(Response error) onError,
  }) async {
    try {
      Response res = await httpClient.post(
        '${ApiRoutes.baseUrl}${ApiRoutes.otpSendToPhone}',
        body: phoneAuth,
      );
      if (validateResponse(res)) {
        onSuccess(res);
      } else {
        onError(res);
      }
    } catch (err) {
      onError(Response(statusCode: 404, body: {'message': '$err'}));
    }
  }

  verifyOtpPhone(
    Map<String, String> phoneAuth, {
    required Function(Response res) onSuccess,
    required Function(Response error) onError,
  }) async {
    try {
      Response res = await httpClient.post(
        '${ApiRoutes.baseUrl}${ApiRoutes.verifyOtpPhone}',
        body: phoneAuth,
      );
      if (validateResponse(res)) {
        return onSuccess(res);
      } else {
        onError(res);
      }
    } catch (err) {
      onError(Response(statusCode: 404, body: {'message': '$err'}));
    }
  }

  registerUser(
    Map<String, String> userAuth, {
    required Function(Response res) onSuccess,
    required Function(Response error) onError,
  }) async {
    try {
    Response res = await httpClient.post(
      '${ApiRoutes.baseUrl}${ApiRoutes.registerUser}',
      body: userAuth,
    );
    if (validateResponse(res)) {
      return onSuccess(res);
    } else {
      onError(res);
    }
    } catch (err) {
      onError(Response(statusCode: 404, body: {'message': '$err'}));
    }
  }

  getAllCategory({
    required Function(Response res) onSuccess,
    required Function(Response error) onError,
  }) async {
    try {
    Response res = await httpClient.get(
      '${ApiRoutes.baseUrl}${ApiRoutes.getAllCategory}',
    );
    if (validateResponse(res)) {
      return onSuccess(res);
    } else {
      onError(res);
    }
    } catch (err) {
      onError(Response(statusCode: 404, body: {'message': '$err'}));
    }
  }

  getAllVehicles({
    required Function(Response res) onSuccess,
    required Function(Response error) onError,
  }) async {
    try {
    Response res = await httpClient.get(
      '${ApiRoutes.baseUrl}${ApiRoutes.getAllVehicles}',
    );
    if (validateResponse(res)) {
      return onSuccess(res);
    } else {
      onError(res);
    }
    } catch (err) {
      onError(Response(statusCode: 404, body: {'message': '$err'}));
    }
  }

  addRecentView({
    required dynamic body,
    required Function(Response res) onSuccess,
    required Function(Response error) onError,
  }) async {
    try {
    Response res = await httpClient.post(
      headers: _mainHeaders,
      '${ApiRoutes.baseUrl}${ApiRoutes.postRecentView}',
      body: body,
    );
    if (validateResponse(res)) {
      return onSuccess(res);
    } else {
      onError(res);
    }
    } catch (err) {
      onError(Response(statusCode: 404, body: {'message': '$err'}));
    }
  }


  getAllListingByUser({
    required Function(Response res) onSuccess,
    required Function(Response error) onError,
  }) async {
    try {
      Response res = await httpClient.get(
        headers: _mainHeaders,
        '${ApiRoutes.baseUrl}${ApiRoutes.getAllListedVehicleByUser}',
      );
      if (validateResponse(res)) {
        return onSuccess(res);
      } else {
        onError(res);
      }
    } catch (err) {
      onError(Response(statusCode: 404, body: {'message': '$err'}));
    }
  }

  getRecentViewVehicle({
    required Function(Response res) onSuccess,
    required Function(Response error) onError,
  }) async {
    try {
      Response res = await httpClient.post(
        headers: _mainHeaders,
        '${ApiRoutes.baseUrl}${ApiRoutes.getRecentViewVehicles}',
        body: {
          "vehicleIds": UserStore.to.vehicles,
        },
      );
      if (validateResponse(res)) {
        return onSuccess(res);
      } else {
        onError(res);
      }
    } catch (err) {
      onError(Response(statusCode: 404, body: {'message': '$err'}));
    }
  }

  getShortFilter({
    required Map<String, String> arg,
    required Function(Response res) onSuccess,
    required Function(Response error) onError,
  }) async {
    try {
      Response res = await httpClient.get(
        '${ApiRoutes.baseUrl}${ApiRoutes.getShortFilterVehicle}?${arg.keys.first}=${arg.values.first}',
      );
      if (validateResponse(res)) {
        return onSuccess(res);
      } else {
        onError(res);
      }
    } catch (err) {
      onError(Response(statusCode: 404, body: {'message': '$err'}));
    }
  }

  getWishlist({
    required Function(Response res) onSuccess,
    required Function(Response error) onError,
  }) async {
    try {
      Response res = await httpClient.get(
        headers: _mainHeaders,
        '${ApiRoutes.baseUrl}${ApiRoutes.getWishlist}',
      );
      if (validateResponse(res)) {
        return onSuccess(res);
      } else {
        onError(res);
      }
    } catch (err) {
      onError(Response(statusCode: 404, body: {'message': '$err'}));
    }
  }

  applyFilter({
    required dynamic filter,
    required Function(Response res) onSuccess,
    required Function(Response error) onError,
  }) async {
    try {
      Response res = await httpClient.post(
        '${ApiRoutes.baseUrl}${ApiRoutes.applyFilter}',
        body: filter,
      );
      if (validateResponse(res)) {
        return onSuccess(res);
      } else {
        onError(res);
      }
    } catch (err) {
      onError(Response(statusCode: 404, body: {'message': '$err'}));
    }
  }

  searchVehicle({
    required dynamic filter,
    required Function(Response res) onSuccess,
    required Function(Response error) onError,
  }) async {
    try {
      Response res = await httpClient.post(
        '${ApiRoutes.baseUrl}${ApiRoutes.searchVehicle}',
        body: filter,
      );
      if (validateResponse(res)) {
        return onSuccess(res);
      } else {
        onError(res);
      }
    } catch (err) {
      onError(Response(statusCode: 404, body: {'message': '$err'}));
    }
  }

  getShortReels({
    required Function(Response res) onSuccess,
    required Function(Response error) onError,
  }) async {
    try {
      Response res = await httpClient.get(
        '${ApiRoutes.baseUrl}${ApiRoutes.shortReels}',
      );
      if (validateResponse(res)) {
        return onSuccess(res);
      } else {
        onError(res);
      }
    } catch (err) {
      onError(Response(statusCode: 404, body: {'message': '$err'}));
    }
  }

  toggleLikeButton({
    required String id,
    required Function(Response res) onSuccess,
    required Function(Response error) onError,
  }) async {
    try {
      Response res = await httpClient.put(
        headers: _mainHeaders,
        '${ApiRoutes.baseUrl}${ApiRoutes.likeStory}/$id/like',
      );
      if (validateResponse(res)) {
        return onSuccess(res);
      } else {
        onError(res);
      }
    } catch (err) {
      onError(Response(statusCode: 404, body: {'message': '$err'}));
    }
  }

  addComment({
    required dynamic req,
    required String id,
    required Function(Response res) onSuccess,
    required Function(Response error) onError,
  }) async {
    try {
      Response res = await httpClient.post(
        headers: _mainHeaders,
        '${ApiRoutes.baseUrl}${ApiRoutes.addComment}/$id/comment',
        body: req,
      );
      if (validateResponse(res)) {
        return onSuccess(res);
      } else {
        log("error: ${res.body}");
        onError(res);
      }
    } catch (err) {
      onError(Response(statusCode: 404, body: {'message': '$err'}));
    }
  }

  getAllComments({
    required String id,
    required Function(Response res) onSuccess,
    required Function(Response error) onError,
  }) async {
    try {
      Response res = await httpClient.get(
        headers: _mainHeaders,
        '${ApiRoutes.baseUrl}${ApiRoutes.addComment}/$id/comments',
      );
      if (validateResponse(res)) {
        return onSuccess(res);
      } else {
        onError(res);
      }
    } catch (err) {
      onError(Response(statusCode: 404, body: {'message': '$err'}));
    }
  }

  getVehicleDetails({
    required String id,
    required Function(Response res) onSuccess,
    required Function(Response error) onError,
  }) async {
    // try {
      Response res = await httpClient.get(
        headers: _mainHeaders,
        '${ApiRoutes.baseUrl}${ApiRoutes.getVehicleDetails}/$id',
      );
      if (validateResponse(res)) {
        return onSuccess(res);
      } else {
        onError(res);
      }
    // } catch (err) {
    //   onError(Response(statusCode: 404, body: {'message': '$err'}));
    // }
  }

  getRating({
    required dynamic body,
    required Function(Response res) onSuccess,
    required Function(Response error) onError,
  }) async {
    try {
      Response res = await httpClient.post(
        headers: _mainHeaders,
        '${ApiRoutes.baseUrl}${ApiRoutes.getRating}',
        body: body,
      );
      if (validateResponse(res)) {
        return onSuccess(res);
      } else {
        onError(res);
      }
    } catch (err) {
      onError(Response(statusCode: 404, body: {'message': '$err'}));
    }
  }

  getAllRatingByUser({
    required Function(Response res) onSuccess,
    required Function(Response error) onError,
  }) async {
    try {
      Response res = await httpClient.get(
        headers: _mainHeaders,
        '${ApiRoutes.baseUrl}${ApiRoutes.getAllRatingByUser}',
      );
      if (validateResponse(res)) {
        return onSuccess(res);
      } else {
        onError(res);
      }
    } catch (err) {
      onError(Response(statusCode: 404, body: {'message': '$err'}));
    }
  }

  getAllRatingBySeller({
    required Function(Response res) onSuccess,
    required Function(Response error) onError,
  }) async {
    try {
      Response res = await httpClient.get(
        headers: _mainHeaders,
        '${ApiRoutes.baseUrl}${ApiRoutes.getAllRatingBySeller}',
      );
      if (validateResponse(res)) {
        return onSuccess(res);
      } else {
        onError(res);
      }
    } catch (err) {
      onError(Response(statusCode: 404, body: {'message': '$err'}));
    }
  }

  getAllSubmittedRatingByUser({
    required Function(Response res) onSuccess,
    required Function(Response error) onError,
  }) async {
    try {
      Response res = await httpClient.get(
        headers: _mainHeaders,
        '${ApiRoutes.baseUrl}${ApiRoutes.getAllSubmittedRatingByUser}',
      );
      if (validateResponse(res)) {
        return onSuccess(res);
      } else {
        onError(res);
      }
    } catch (err) {
      onError(Response(statusCode: 404, body: {'message': '$err'}));
    }
  }

  addToFavorite({
    required dynamic body,
    required Function(Response res) onSuccess,
    required Function(Response error) onError,
  }) async {
    try {
      Response res = await httpClient.post(
        headers: _mainHeaders,
        '${ApiRoutes.baseUrl}${ApiRoutes.addToWishlist}',
        body: body,
      );
      if (validateResponse(res)) {
        return onSuccess(res);
      } else {
        onError(res);
      }
    } catch (err) {
      onError(Response(statusCode: 404, body: {'message': '$err'}));
    }
  }

  removeToFavorite({
    required dynamic body,
    required Function(Response res) onSuccess,
    required Function(Response error) onError,
  }) async {
    try {
      Response res = await httpClient.post(
        headers: _mainHeaders,
        '${ApiRoutes.baseUrl}${ApiRoutes.removeFromWishlist}',
        body: body,
      );
      if (validateResponse(res)) {
        return onSuccess(res);
      } else {
        onError(res);
      }
    } catch (err) {
      onError(Response(statusCode: 404, body: {'message': '$err'}));
    }
  }

  Future<void> updateProfile({
    required dynamic body,
    required Function(Response res) onSuccess,
    required Function(Response error) onError,}) async {
    try {
      Response res = await httpClient.put(
        headers: _mainHeaders,
        '${ApiRoutes.baseUrl}${ApiRoutes.updateUserProfile}',
        body: body,
      );
      if (validateResponse(res)) {
        return onSuccess(res);
      } else {
        onError(res);
      }
    } catch (err) {
      onError(Response(statusCode: 404, body: {'message': '$err'}));
    }
  }

  Future<void> updateVehicleStatus({
    required String vehicleId,
    required dynamic body,
    required Function(Response res) onSuccess,
    required Function(Response error) onError,}) async {
    try {
      Response res = await httpClient.patch(
        headers: _mainHeaders,
        '${ApiRoutes.baseUrl}${ApiRoutes.updateVehicleStatus}/$vehicleId',
        body: body,
      );
      if (validateResponse(res)) {
        return onSuccess(res);
      } else {
        onError(res);
      }
    } catch (err) {
      onError(Response(statusCode: 404, body: {'message': '$err'}));
    }
  }

  Future<void> performanceOverview({required Function(dynamic res) onSuccess, required Function(dynamic res) onError}) async {
    try {
      Response res = await httpClient.get(
        headers: _mainHeaders,
        '${ApiRoutes.baseUrl}${ApiRoutes.performanceOverview}',
      );
      if (validateResponse(res)) {
        return onSuccess(res);
      } else {
        onError(res);
      }
    } catch (err) {
      onError(Response(statusCode: 404, body: {'message': '$err'}));
    }
  }


  Future<void> getSellerChat({
    required Function(Response res) onSuccess,
    required Function(Response error) onError,}) async {
    try {
      Response res = await httpClient.get(
        headers: _mainHeaders,
        '${ApiRoutes.baseUrl}${ApiRoutes.mySellerChat}',
      );
      if (validateResponse(res)) {
        return onSuccess(res);
      } else {
        onError(res);
      }
    } catch (err) {
      onError(Response(statusCode: 404, body: {'message': '$err'}));
    }
  }

  Future<void> getBuyerChat({
    required Function(Response res) onSuccess,
    required Function(Response error) onError,}) async {
    try {
      Response res = await httpClient.get(
        headers: _mainHeaders,
        '${ApiRoutes.baseUrl}${ApiRoutes.myBuyerChat}',
      );
      if (validateResponse(res)) {
        return onSuccess(res);
      } else {
        onError(res);
      }
    } catch (err) {
      onError(Response(statusCode: 404, body: {'message': '$err'}));
    }
  }


  Future<void> getUnseen({
    required Function(Response res) onSuccess,
    required Function(Response error) onError,}) async {
    try {
      Response res = await httpClient.get(
        headers: _mainHeaders,
        '${ApiRoutes.baseUrl}${ApiRoutes.unseenMessage}',
      );
      if (validateResponse(res)) {
        return onSuccess(res);
      } else {
        onError(res);
      }
    } catch (err) {
      onError(Response(statusCode: 404, body: {'message': '$err'}));
    }
  }

  Future<void> getMessageByConversation({
    required String conversationId,
    required Function(Response res) onSuccess,
    required Function(Response error) onError,}) async {
    try {
      Response res = await httpClient.get(
        headers: _mainHeaders,
        '${ApiRoutes.baseUrl}${ApiRoutes.getChat}/$conversationId',
      );
      if (validateResponse(res)) {
        return onSuccess(res);
      } else {
        onError(res);
      }
    } catch (err) {
      onError(Response(statusCode: 404, body: {'message': '$err'}));
    }
  }

  Future<void> sendMessage({
    required dynamic body,
    required Function(Response res) onSuccess,
    required Function(Response error) onError,}) async {
    // try {
      Response res = await httpClient.post(
        headers: _mainHeaders,
        '${ApiRoutes.baseUrl}${ApiRoutes.sendMessage}',
        body: body,
      );
      if (validateResponse(res)) {
        return onSuccess(res);
      } else {
        onError(res);
      }
    // } catch (err) {
    //   onError(Response(statusCode: 404, body: {'message': '$err'}));
    // }
  }

  Future<void> createConversation({
    required dynamic body,
    required Function(Response res) onSuccess,
    required Function(Response error) onError,}) async {
    try {
      Response res = await httpClient.post(
        headers: _mainHeaders,
        '${ApiRoutes.baseUrl}${ApiRoutes.createChat}',
        body: body,
      );
      if (validateResponse(res)) {
        return onSuccess(res);
      } else {
        onError(res);
      }
    } catch (err) {
      onError(Response(statusCode: 404, body: {'message': '$err'}));
    }
  }

  getProfile({
        required Function(Response res) onSuccess,
        required Function(Response error) onError,
      }) async {
    try {
      Response res = await httpClient.get(
        '${ApiRoutes.baseUrl}${ApiRoutes.authVerify}',
        headers: _mainHeaders,
      );
      if (validateResponse(res)) {
        onSuccess(res);
      } else {
        onError(res);
      }
    } catch (err) {
      onError(Response(statusCode: 404, body: {'message': '$err'}));
    }
  }

  postContactSupport({required dynamic body, required Function(dynamic res) onSuccess, required Function(dynamic res) onError}) async {
    try {
      Response res = await httpClient.post(
        '${ApiRoutes.baseUrl}${ApiRoutes.postContact}',
        headers: _mainHeaders,
        body: body,
      );
      if (validateResponse(res)) {
        onSuccess(res);
      } else {
        onError(res);
      }
    } catch (err) {
      onError(Response(statusCode: 404, body: {'message': '$err'}));
    }
  }

  Future<void> getAllUsers({required Function(dynamic res) onSuccess, required Function(dynamic res) onError}) async {
    try {
      Response res = await httpClient.get(
        '${ApiRoutes.baseUrl}${ApiRoutes.getAllUsers}',
        headers: _mainHeaders,
      );
      if (validateResponse(res)) {
        onSuccess(res);
      } else {
        onError(res);
      }
    } catch (err) {
      onError(Response(statusCode: 404, body: {'message': '$err'}));
    }
  }

  Future<void> addRating({required dynamic body, required Function(dynamic res) onSuccess, required Function(dynamic res) onError}) async {
    try {
      Response res = await httpClient.post(
        '${ApiRoutes.baseUrl}${ApiRoutes.addRating}',
        headers: _mainHeaders,
        body: body,
      );
      if (validateResponse(res)) {
        onSuccess(res);
      } else {
        onError(res);
      }
    } catch (err) {
      onError(Response(statusCode: 404, body: {'message': '$err'}));
    }
  }

  uploadUserProfile({required File file}) async {
    try {
      log('--------------Calling API: upload report   ---------------');
      var request = http.MultipartRequest('POST', Uri.parse('${ApiRoutes.baseUrl}file/upload-cloud'));
      final filePath = await http.MultipartFile.fromPath(
        'file',
        file.path,
      );
      request.files.add(filePath);
      request.headers.addAll(_mainHeaders);

      http.StreamedResponse res = await request.send();
      log('================================ Data Received ==========================================');
      return jsonDecode(await res.stream.bytesToString());
    } catch (err) {
      return {"success": false};
    }
  }

  Future<void> searchVehicleNumber({
    required String vehicleNumber,
    required Function(Response res) onSuccess,
    required Function(Response error) onError,}) async {
    try {
      Response res = await httpClient.post(
        '${ApiRoutes.baseUrl}${ApiRoutes.searchVehicleNumber}',
        headers: _mainHeaders,
        body: {"vehicleNumber":vehicleNumber},
      );
      if (validateResponse(res)) {
        onSuccess(res);
      } else {
        onError(res);
      }
    } catch (err) {
      onError(Response(statusCode: 404, body: {'message': '$err'}));
    }
  }

  Future<void> getPinCode({
    required String pincode,
    required Function(Response res) onSuccess,
    required Function(Response error) onError,}) async {
    // try {
      Response res = await httpClient.post(
        '${ApiRoutes.baseUrl}${ApiRoutes.pincode}',
        headers: _mainHeaders,
        body: {"pincode":pincode},
      );
      if (validateResponse(res)) {
        onSuccess(res);
      } else {
        onError(res);
      }
    // } catch (err) {
    //   onError(Response(statusCode: 404, body: {'message': '$err'}));
    // }
  }

  Future<void> postVehicle({
    required dynamic data,
    required bool isVehicleEditMode,
    required Function(Response res) onSuccess,
    required Function(Response error) onError, required String vehicleId,}) async {
    // try {
      Response res;
      if(isVehicleEditMode){
        res = await httpClient.put(
          '${ApiRoutes.baseUrl}${ApiRoutes.updateVehicle}/$vehicleId',
          headers: _mainHeaders,
          body: data,
        );
      } else {
        res = await httpClient.post(
          '${ApiRoutes.baseUrl}${ApiRoutes.postVehicle}',
          headers: _mainHeaders,
          body: data,
        );
      }
      if (validateResponse(res)) {
        onSuccess(res);
      } else {
        onError(res);
      }
    // } catch (err) {
    //   onError(Response(statusCode: 404, body: {'message': '$err'}));
    // }
  }

  Future<void> sendNotificationToken({
    required dynamic data,
    required Function(Response res) onSuccess,
    required Function(Response error) onError,}) async {
    Response res = await httpClient.post(
      '${ApiRoutes.baseUrl}${ApiRoutes.saveFcmToken}',
      headers: _mainHeaders,
      body: data,
    );
    if (validateResponse(res)) {
      onSuccess(res);
    } else {
      onError(res);
    }
  }

  Future<void> unregisterFcmToken({
    required dynamic data,
    required Function(Response res) onSuccess,
    required Function(Response error) onError,}) async {
    Response res = await httpClient.post(
      '${ApiRoutes.baseUrl}${ApiRoutes.unregisterFcmToken}',
      headers: _mainHeaders,
      body: data,
    );
    if (validateResponse(res)) {
      onSuccess(res);
    } else {
      onError(res);
    }
  }

}
