import 'dart:convert';


import 'package:tradefolio/core/utils/constants/text_strings.dart';
import 'package:tradefolio/view/widgets/snackbars.dart';

class JHttpHelper{
 static Future<Map<String, dynamic>?> handleHttpResponse(response) async {
  final statusCode = response.statusCode;

  switch (statusCode) {
    case 200:
      // Parse the response body and return the data
      return json.decode(response.body);

    case 400:
      JMessages.snackbarerror(title: JTexts.e400);
      break;

    case 429:
      JMessages.snackbarerror(title: JTexts.e429);
      break;

    case 500:
      JMessages.snackbarerror(title: JTexts.e500);
      break;

    default:
      JMessages.snackbarerror(title: "${JTexts.eDefault} $statusCode.");
  }
  return null;
}
}