import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'News.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'main.dart';
import 'dart:io';
import 'SharedPrefrences.dart';



class formPage2 extends StatefulWidget {
  News _news;
  formPage2(this._news);


  @override
  _formPage2State createState() => _formPage2State();
}

class _formPage2State extends State<formPage2> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //newsItem= fetchItem();


  }



  @override
  Widget build(BuildContext context) {

    //TextEditingController textController_title ;
    //TextEditingController textController_coin_name;
    //TextEditingController textController_date_event;
    //TextEditingController textController_proof;
    //TextEditingController textController_importance;
    //TextEditingController textController_market_cap;
    //TextEditingController textController_text1;
    //TextEditingController textController_text2;
    final TextEditingController _textController_title = new TextEditingController();
    final TextEditingController _textController_coin_name = new TextEditingController();
    final TextEditingController _textController_date_event = new TextEditingController();
    final TextEditingController _textController_proof = new TextEditingController();
    final TextEditingController _textController_importance = new TextEditingController();
    final TextEditingController _textController_market_cap = new TextEditingController();
    final TextEditingController _textController_text1 = new TextEditingController();
    final TextEditingController _textController_text2 = new TextEditingController();
    final TextEditingController _textController_pic = new TextEditingController();
    final TextEditingController _textController_pic_proof = new TextEditingController();


    var size = MediaQuery.of(context).size;


    final double itemHeight = (size.height - kToolbarHeight - 80) / 20;
    final double itemWidth = size.width / 2;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45),
        child: AppBar(
          title: Text('Edit '+(widget._news.id).toString()),
          backgroundColor: Color(0xFF673AB7),
          automaticallyImplyLeading: true,
          actions: [],
          elevation: 4,
        ),
      ),
      backgroundColor:Colors.purple[50],
      body:  SafeArea(

        child: ListView.builder(
    scrollDirection: Axis.vertical,
    itemCount: 1,
    itemBuilder: (context, index) {
      return Container(
        child: Column(
          children: [
            Container(
              width: itemWidth * 2,
              height: 10,
              color: Colors.white70,
            ),
            Row(

              children: [

                Container(

                  width: itemWidth,
                  height: itemHeight * 3,
                  color: Colors.white70,
                  child: Column(

                    children: [

                      Padding(padding: EdgeInsets.only(
                          left: 20, right: itemWidth - 55, top: 10),
                          child: Text('Title', style: TextStyle(fontSize: 16,
                              fontFamily: 'Poppins',
                              color: Colors.blueGrey),)),
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: TextFormField(
                          controller: _textController_title,
                          obscureText: false,
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                            labelText: widget._news.title,
                            hintTextDirection: TextDirection.rtl,

                            hintStyle:
                            TextStyle(
                              fontFamily: 'Poppins',


                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            filled: true,
                          ),
                        ),
                      )
                    ],

                  ),


                ),
                Container(

                  width: itemWidth,
                  height: itemHeight * 3,
                  color: Colors.white70,
                  child: Column(

                    children: [

                      Padding(padding: EdgeInsets.only(
                          left: 20, right: itemWidth - 105, top: 10),
                          child: Text('Coin Name', style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              color: Colors.blueGrey),)),
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: TextFormField(
                          controller: _textController_coin_name,
                          obscureText: false,
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                            labelText: widget._news.coinName,
                            hintTextDirection: TextDirection.rtl,

                            hintStyle:
                            TextStyle(
                              fontFamily: 'Poppins',


                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            filled: true,
                          ),
                        ),
                      )
                    ],

                  ),


                ),

              ],

            ),
            Row(

              children: [

                Container(

                  width: itemWidth,
                  height: itemHeight * 3,
                  color: Colors.white70,
                  child: Column(

                    children: [

                      Padding(padding: EdgeInsets.only(
                          left: 20, right: itemWidth - 105, top: 10),
                          child: Text('Date Event', style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              color: Colors.blueGrey),)),
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: TextFormField(
                          controller: _textController_date_event,
                          obscureText: false,
                          textDirection: TextDirection.ltr,
                          decoration: InputDecoration(
                            labelText: widget._news.date_event,
                            hintTextDirection: TextDirection.rtl,

                            hintStyle:
                            TextStyle(
                              fontFamily: 'Poppins',


                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            filled: true,
                          ),
                        ),
                      )
                    ],

                  ),


                ),
                Container(

                  width: itemWidth,
                  height: itemHeight * 3,
                  color: Colors.white70,
                  child: Column(

                    children: [

                      Padding(padding: EdgeInsets.only(
                          left: 20, right: itemWidth - 125, top: 10),
                          child: Text('Proof Address', style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              color: Colors.blueGrey),)),
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: TextFormField(
                          controller: _textController_proof,
                          obscureText: false,
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                            labelText: (widget._news.proof_add).toString(),
                            hintTextDirection: TextDirection.rtl,

                            hintStyle:
                            TextStyle(
                              fontFamily: 'Poppins',


                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            filled: true,
                          ),
                        ),
                      )
                    ],

                  ),


                ),

              ],

            ),
            Row(

              children: [

                Container(

                  width: itemWidth,
                  height: itemHeight * 3,
                  color: Colors.white70,
                  child: Column(

                    children: [

                      Padding(padding: EdgeInsets.only(
                          left: 20, right: itemWidth - 105, top: 10),
                          child: Text('Importance', style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              color: Colors.blueGrey),)),
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: TextFormField(
                          controller: _textController_importance,
                          obscureText: false,
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                            labelText: (widget._news.importance).toString(),
                            hintTextDirection: TextDirection.rtl,

                            hintStyle:
                            TextStyle(
                              fontFamily: 'Poppins',


                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            filled: true,
                          ),
                        ),
                      )
                    ],

                  ),


                ),
                Container(

                  width: itemWidth,
                  height: itemHeight * 3,
                  color: Colors.white70,
                  child: Column(

                    children: [

                      Padding(padding: EdgeInsets.only(
                          left: 20, right: itemWidth - 105, top: 10),
                          child: Text('Market Cap', style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              color: Colors.blueGrey),)),
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: TextFormField(
                          controller: _textController_market_cap,

                          obscureText: false,
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                            labelText: (widget._news.marketcap).toString(),
                            hintTextDirection: TextDirection.rtl,

                            hintStyle:
                            TextStyle(

                              fontFamily: 'Poppins',


                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            filled: true,
                          ),
                        ),
                      )
                    ],

                  ),


                ),

              ],

            ),
            Row(

              children: [

                Container(

                  width: itemWidth,
                  height: itemHeight * 3,
                  color: Colors.white70,
                  child: Column(

                    children: [

                      Padding(padding: EdgeInsets.only(
                          left: 20, right: itemWidth - 125, top: 10),
                          child: Text('Coin Picture', style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              color: Colors.blueGrey),)),
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: TextFormField(
                          controller: _textController_pic,
                          obscureText: false,
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                            labelText: (widget._news.coin_pic).toString(),
                            hintTextDirection: TextDirection.rtl,

                            hintStyle:
                            TextStyle(
                              fontFamily: 'Poppins',


                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            filled: true,
                          ),
                        ),
                      )
                    ],

                  ),


                ),
                Container(

                  width: itemWidth,
                  height: itemHeight * 3,
                  color: Colors.white70,
                  child: Column(

                    children: [

                      Padding(padding: EdgeInsets.only(
                          left: 20, right: itemWidth - 125, top: 10),
                          child: Text('Proof Picture', style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              color: Colors.blueGrey),)),
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: TextFormField(
                          controller: _textController_pic_proof,

                          obscureText: false,
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                            labelText: (widget._news.pic_proof).toString(),
                            hintTextDirection: TextDirection.rtl,

                            hintStyle:
                            TextStyle(

                              fontFamily: 'Poppins',


                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            filled: true,
                          ),
                        ),
                      )
                    ],

                  ),


                ),

              ],

            ),
            Row(

              children: [

                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  width: itemWidth,
                  height: itemHeight * 7,
                  color: Colors.white70,
                  child: Column(

                    children: [

                      Padding(padding: EdgeInsets.only(
                          left: 20, right: itemWidth - 60, top: 10),
                          child: Text('Text1', style: TextStyle(fontSize: 16,
                              fontFamily: 'Poppins',
                              color: Colors.blueGrey),)),
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: TextFormField(
                          maxLines: 6,
                          controller: _textController_text1,
                          obscureText: false,
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                            labelText: widget._news.tex1,
                            hintMaxLines: 5,
                            hintTextDirection: TextDirection.rtl,

                            hintStyle:
                            TextStyle(
                              fontFamily: 'Poppins',


                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            filled: true,
                          ),
                        ),
                      )
                    ],

                  ),


                ),
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  width: itemWidth,
                  height: itemHeight * 7,
                  color: Colors.white70,
                  child: Column(

                    children: [

                      Padding(padding: EdgeInsets.only(
                          left: 20, right: itemWidth - 60, top: 10),
                          child: Text('Text2', style: TextStyle(fontSize: 16,
                              fontFamily: 'Poppins',
                              color: Colors.blueGrey),)),
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: TextFormField(
                          maxLines: 6,
                          controller: _textController_text2,
                          obscureText: false,
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                            labelText: widget._news.text2,
                            hintTextDirection: TextDirection.rtl,

                            hintStyle:
                            TextStyle(
                              fontFamily: 'Poppins',


                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            filled: true,
                          ),
                        ),
                      )
                    ],

                  ),


                ),

              ],

            ),

            Container(
              padding: EdgeInsets.only(top: 30,bottom: 20),
              width: itemWidth * 2,
              height: (itemHeight * 2) + 30,
              color: Colors.white70,
              child: Center(

                  child: Row(

                    children: [

                      Padding(padding: EdgeInsets.only(left: itemWidth - 210),
                          child: InkWell(
                            onTap: () {

                              postData(
                                  _textController_title.text,
                                  _textController_coin_name.text,
                                  _textController_date_event.text,
                                  _textController_proof.text,
                                  _textController_importance.text,
                                  _textController_market_cap.text,
                                  _textController_pic.text,
                                  _textController_pic_proof.text,
                                  _textController_text1.text,
                                  _textController_text2.text,
                                  _textController_date_event.text);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context)=>MyHomePage(title: 'News Management',)
                              ));
                              SnackBar(
                                content: const Text('Compelete Save News'),
                                action: SnackBarAction(
                                  label: 'Undo',

                                ),
                              );
                              //Navigator.pushReplacement(
                              //    context,
                              //    MaterialPageRoute(
                              //        builder: (BuildContext context) => super.widget));


                            },
                            child: Container(width: 130,
                              height: 40,
                              color: Color(0xFF5E35B1),
                              // decoration: BoxDecoration(
                              //   borderRadius: BorderRadius.circular(5),
                              //   color: Colors.white70
                              // ),
                              child: Center(child: Text('SAVE',
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 20),)),
                            ),
                          )),
                      Padding(padding: EdgeInsets.only(left: 20),
                          child: InkWell(
                            onTap: ()=>{
                              if(_textController_title.text.isEmpty){
                                _textController_title.text = widget._news.title
                              },
                              if(_textController_coin_name.text.isEmpty){
                                _textController_coin_name.text = widget._news.coinName
                              },
                              if(_textController_date_event.text.isEmpty){
                                _textController_date_event.text = widget._news.date_event
                              },
                              if(_textController_proof.text.isEmpty){
                                _textController_proof.text = widget._news.proof_add
                              },
                              if(_textController_importance.text.isEmpty){
                                _textController_importance.text = widget._news.importance.toString()
                              },
                              if(_textController_market_cap.text.isEmpty){
                                _textController_market_cap.text = widget._news.marketcap.toString()
                              },
                              if(_textController_pic.text.isEmpty){
                                _textController_pic.text = widget._news.coin_pic
                              },
                              if(_textController_pic_proof.text.isEmpty){
                                _textController_pic_proof.text = widget._news.pic_proof
                              },
                              if(_textController_text1.text.isEmpty){
                                _textController_text1.text = widget._news.tex1
                              },
                              if(_textController_text2.text.isEmpty){
                                _textController_text2.text = widget._news.text2
                              },
                              if(_textController_date_event.text.isEmpty){
                                _textController_date_event.text = widget._news.date_event
                              },
                              updateData(_textController_title.text, _textController_coin_name.text, _textController_date_event.text, _textController_proof.text, _textController_importance.text, _textController_market_cap.text, _textController_pic.text, _textController_pic_proof.text, _textController_text1.text, _textController_text2.text, _textController_date_event.text),
                            Navigator.of(context).push(MaterialPageRoute(
                            builder: (context)=>MyHomePage(title: 'News Management',)
                            )),
                            },
                            child: Container(width: 130,
                              height: 40,
                              color: Colors.green[700],
                              child: Center(child: Text('UPDATE',
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 20),)),
                            ),
                          )),
                      Padding(padding: EdgeInsets.only(left: 20),
                          child: InkWell(
                            onTap: () {

                              delete();
                              //Navigator.pop(context);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context)=>MyHomePage(title: 'News Management',)
                              ));

                            },
                            child: Container(width: 130,
                              height: 40,
                              color: Colors.red,
                              child: Center(child: Text('DELETE',
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 20),)),
                            ),
                          )),

                    ],

                  )

              ),

            )


          ],
        ),

      );
    }
        ),
      ),

    );
  }

  updateData(String title,String coinName,String date,String proof_address,String importance,String marketcap,String picture,String proof_picture,String tex1,String text2,String date_event)async{
    Map data = {
      "a_id":"1",
      "title":title,
      "coinName":coinName,
      "marketcap":marketcap,
      "importance":importance,
      "proof_add":proof_address,
      "pic_proof":proof_picture,
      "coin_pic":picture,
      "tex1":tex1,
      "text2":text2,
      "date_event":date_event,
      "id_pic_proof":"null",
      "id_coin_pic":"null"
    };
    var token = await getMobileToken();
    var header = {HttpHeaders.authorizationHeader: token,};
    var jsonResponse;
    var tmp = widget._news.id;
    try {
      var response = await http.put(Uri.parse('https://buymanews.ir/admin/update/$tmp'),body:data,headers: header);
      jsonResponse = json.decode(response.body);
      print(jsonResponse);
    } catch (e) {
      print(e);
    }


  }

  delete()async{
    var token = await getMobileToken();
    var header = {HttpHeaders.authorizationHeader: token,};
    var tmp = widget._news.id;
    var jsonResponse;
    try {
      var response = await http.post(Uri.parse('https://buymanews.ir/admin/delete/$tmp'),headers: header);
      jsonResponse = json.decode(response.body);
      print(jsonResponse);
    } catch (e) {
      print(e);
    }
  }

}

postData(String title,String coinName,String date,String proof_address,String importance,String marketcap,String picture,String proof_picture,String tex1,String text2,String date_event)async{
  Map data = {
    "a_id":"1",
    "title":title,
    "coinName":coinName,
    "marketcap":marketcap,
    "importance":importance,
    "proof_add":proof_address,
    "pic_proof":proof_picture,
    "coin_pic":picture,
    "tex1":tex1,
    "text2":text2,
    "date_event":date_event,
    "id_pic_proof":"null",
    "id_coin_pic":"null"
  };
  print(data);
  //Map header  = <String, String> {
  //  'Content-Type': 'application/json',
  //};

  var token = await getMobileToken();
  var header = {HttpHeaders.authorizationHeader: token,};
  var jsonResponse;
  try {
    var response = await http.post(Uri.parse('https://buymanews.ir/admin/save'),body:data,headers: header);
    jsonResponse = json.decode(response.body);
    print(jsonResponse);
  } catch (e) {
    print(e);
  }


}


