import 'package:get/get.dart';
import 'package:task_app/services/service.dart';

class DataController extends GetxController {
  DataService service = DataService();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<dynamic> _myData = [];
  List<dynamic> get myData => _myData;
  Future<void> getDatas() async {
    _isLoading = true;
    Response response = await service.getData();

    if (response.statusCode == 200) {
      // var data = response.body;
      _myData = response.body;
      print("Data recieved");
      print(response.body);
      print(response.statusCode);
      // print(data.statusCode);

      update();
    } else {
      // throw Exception('Failed to load post');
      print(response);
      print(response.statusCode);
    }
  }
}


// class DataController extends GetxController {
//   DataServ service = DataServ();
//   // bool _isLoading = false;
//   // bool get isLoading => _isLoading;
//   // final List<dynamic> _myData = [];
//   // List<dynamic> get myData => _myData;
//   Future<void> getData() async {
//     // _isLoading = true;
//     Response response = await service.getData();
//       // if (response.statusCode != 200) {
//       //   // _myData = response.body;
//       //   var newData = response.body;
//       //   print("Data recieved");
//       //   update();
//       //
//       // } else {
//       //  print("another error");
//     if (response.statusCode != 200) {
//       var res = {
//         "success": false,
//         "status": response.statusCode,
//
//       };
//       throw Exception(response.body);
//     }
//       }
//     }

