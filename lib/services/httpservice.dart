import 'package:http/http.dart' as http;
import 'package:task_app/controllers/httpmodel.dart';

class RemoteServices {
  Future<List<TaskModel>?> getPosts() async {
    var client = http.Client();
    var uri = Uri.parse("http://10.0.0.4:8080/gettasks");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      print("Api loaded");
      return taskModelFromJson(json);
    }
    return null;
  }
}
