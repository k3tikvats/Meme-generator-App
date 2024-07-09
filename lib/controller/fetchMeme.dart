import 'dart:convert';

import 'package:http/http.dart';

class FetchMeme {
  static fetchNewMeme() async {
    Response response = await get(Uri.parse("https://meme-api.com/gimme"));
    // print(response);
    // print(response.body);
    Map body_data = jsonDecode(response.body);
    // print(body_data["url"]);

    return body_data["url"];//since there was a error coming that it was null now we are returning a value.i.e url
  }
}
