import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DataService extends GetConnect {
  
  Future<Response> getData() async {
    Response response = await get(
      "http://10.0.0.4:8080/gettasks",
      // "https://jsonplaceholder.typicode.com/photos",
      // headers: {
      //   // "Content-Type": "text/html; charset=UTF-8",
      //   "Content-Type": "applications/json; charset=UTF-8",
      // },
    );
    return response;
  }
}
