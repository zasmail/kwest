import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';
import '../cloud_functions/cloud_functions.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetLiveStreamIdCall {
  static Future<ApiCallResponse> call({
    String? playbackId = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetLiveStreamIdCall',
        'variables': {
          'playbackId': playbackId,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static dynamic liveStreamID(dynamic response) => getJsonField(
        response,
        r'''$.data.object.id''',
      );
}

class GetPastLiveStreamCall {
  static Future<ApiCallResponse> call({
    String? streamId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getPastLiveStream',
      apiUrl: 'https://api.mux.com/video/v1/assets',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic YTNiODQyYmMtZjlhMi00YjU5LTgzYjctN2JhZWY3YjNjYTRhOkxHSWRmcW9meHN0RkpVYkZyVDU3d3A3SlBLS2lOOGw0K3dDVjdud2hKZzNoMWM4MWNMVXJKYU5GK3docHFVS1pGOWtHL01vdzlmMQ==',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic playbackID(dynamic response) => getJsonField(
        response,
        r'''$.data[0].playback_ids[0].id''',
      );
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

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
