import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class CloudinaryPOSTCall {
  static Future<ApiCallResponse> call({
    FFUploadedFile? file,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Cloudinary POST',
      apiUrl: 'https://api.cloudinary.com/v1_1/dd7kgf2io/image/upload',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'multipart/form-data',
      },
      params: {
        'upload_preset': "uploadImage",
        'file': file,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? imageUploadedUrl(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.secure_url''',
      ));
  static int? imageWidth(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.width''',
      ));
  static int? imageHeight(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.height''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
