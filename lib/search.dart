import 'dart:convert';

import 'package:flutter/material.dart';
import 'main.dart';
import 'package:http/http.dart' as http;
import 'News.dart';

class searchMethod extends StatefulWidget {
  @override
  _searchMethodState createState() => _searchMethodState();
}

class _searchMethodState extends State<searchMethod> {
  TextEditingController textController=TextEditingController();

  @override
  Widget build(BuildContext context) {




    return TextFormField(
      onChanged: (_) => setState(() {
        searchData(textController.toString());
      }),
        //searchData(textController.toString());

      controller: textController,
      obscureText: false,
      decoration: InputDecoration(
        hintText: 'Search id',
        hintStyle: TextStyle(
          fontSize: 18,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0x00000000),
            width: 1,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0x00000000),
            width: 1,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        filled: true,
        prefixIcon: Icon(
          Icons.search,
        ),
        suffixIcon: textController.text.isNotEmpty
            ? InkWell(
          onTap: () => setState(
                () => textController.clear(),
              ),
              child: Icon(
                Icons.clear,
                color: Color(0xFF757575),
                size: 22,
          ),
        )
            : null,
      ),
      style: TextStyle(
        fontSize: 18,
      ),
      textAlign: TextAlign.start,
      validator: (val) {
        if (val.isEmpty) {
          return 'Field is required';
        }

        return null;
      },
    );
  }
  searchData(String txt) async{
    Map data = {
      'search':txt
    };

    var respons = await http.post(
        Uri.parse("https://buymanews.ir/admin/search"), body: data);

    if (txt.isEmpty){

      setState(() {

      });
      return;
    }
    if (!txt.isEmpty){
      setState(() {
        var newsJson = json.decode(utf8.decode(respons.bodyBytes));
        print(newsJson);
        for (var i in newsJson) {
          // var newItem=News(i['id'],i['a_id'],i['title'],i['coinName'],i['marketcap'],i['importance'],i['proof_add'],i['pic-proof'],i['coin_pic'],i['tex1'],i['text2'],i['date'].toString(),i['date_event'].toString(),i['id_pic_proof'],i['id_coin_pic']);
          if(txt=newsJson[0][i]){
            return print(newsJson[0][i]);
          }
        }
      });
    }
    else return print('not exsist');

  }
}
