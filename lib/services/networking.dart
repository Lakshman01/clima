
import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper{

  NetworkHelper({required this.url});

  String url;

  Future<dynamic> getData() async{

    print('In GetData function');
    http.Response response = await http.get(Uri.parse(url));
    String data = response.body;

    if(response.statusCode == 200){
      return jsonDecode(data);
    }
    else{
      print(response.statusCode);
    }
  }

}