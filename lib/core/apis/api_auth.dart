

import 'package:fetch/core/storage/dispatch.dart';

Map<String, String> get headers {
  return {
    'Content-type': 'application/json',
    'Accept': 'application/json',      
    if (getToken != null) 'Authorization': 'Bearer $getToken'
  };
}
