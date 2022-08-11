import 'package:get/get.dart';

class DataService extends GetConnect implements GetxService {
  Future<Response> getData() async {
    Response response = await get(
      "http://localhost:8001/gettasks",
      headers: {
        "Content-Type": "applications/json; charset=UTF- 8",
      },
    );
    return response;
  }
}
