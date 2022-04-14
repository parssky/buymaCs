import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'News.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class formPage extends StatelessWidget {

  News _news;


  formPage(this._news);

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


    var size = MediaQuery.of(context).size;


    final double itemHeight = (size.height - kToolbarHeight - 80) / 20;
    final double itemWidth = size.width / 2;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45),
        child: AppBar(
          title: Text('Edit '+(_news.id).toString()),
          backgroundColor: Color(0xFF673AB7),
          automaticallyImplyLeading: true,
          actions: [],
          elevation: 4,
        ),
      ),
      backgroundColor:Colors.purple[50],
      body:  SafeArea(

        child: Container(
            child: Column(
              children: [
                Container(
                  width: itemWidth*2,
                  height: 10,
                  color: Colors.white70,
                ),
                Row(

                  children: [

                    Container(

                      width: itemWidth,
                      height: itemHeight*3,
                      color: Colors.white70,
                      child: Column(

                        children: [

                          Padding(padding:EdgeInsets.only(left: 20,right: itemWidth-55,top: 10),child: Text('Title',style: TextStyle(fontSize: 16,fontFamily:'Poppins',color: Colors.blueGrey),)),
                          Padding(padding:EdgeInsets.only(top: 10,left: 10,right: 10),child: TextFormField(
                            controller: _textController_title,
                            obscureText: false,
                            textDirection: TextDirection.rtl,
                            decoration: InputDecoration(
                              labelText: _news.title,
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
                      height: itemHeight*3,
                      color: Colors.white70,
                      child: Column(

                        children: [

                          Padding(padding:EdgeInsets.only(left: 20,right: itemWidth-105,top: 10),child: Text('Coin Name',style: TextStyle(fontSize: 16,fontFamily:'Poppins',color: Colors.blueGrey),)),
                          Padding(padding:EdgeInsets.only(top: 10,left: 10,right: 10),child: TextFormField(
                            controller: _textController_coin_name,
                            obscureText: false,
                            textDirection: TextDirection.rtl,
                            decoration: InputDecoration(
                              labelText: _news.coinName,
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
                     height: itemHeight*3,
                     color: Colors.white70,
                     child: Column(

                       children: [

                         Padding(padding:EdgeInsets.only(left: 20,right: itemWidth-105,top: 10),child: Text('Date Event',style: TextStyle(fontSize: 16,fontFamily:'Poppins',color: Colors.blueGrey),)),
                         Padding(padding:EdgeInsets.only(top: 10,left: 10,right: 10),child: TextFormField(
                           controller: _textController_date_event,
                           obscureText: false,
                           textDirection: TextDirection.rtl,
                           decoration: InputDecoration(
                             labelText: (_news.date_event).toString(),
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
                      height: itemHeight*3,
                      color: Colors.white70,
                      child: Column(

                        children: [

                          Padding(padding:EdgeInsets.only(left: 20,right: itemWidth-125,top: 10),child: Text('Proof Address',style: TextStyle(fontSize: 16,fontFamily:'Poppins',color: Colors.blueGrey),)),
                          Padding(padding:EdgeInsets.only(top: 10,left: 10,right: 10),child: TextFormField(
                            controller: _textController_proof,
                            obscureText: false,
                            textDirection: TextDirection.rtl,
                            decoration: InputDecoration(
                              labelText: (_news.proof_add).toString(),
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
                      height: itemHeight*3,
                      color: Colors.white70,
                      child: Column(

                        children: [

                          Padding(padding:EdgeInsets.only(left: 20,right: itemWidth-105,top: 10),child: Text('Importance',style: TextStyle(fontSize: 16,fontFamily:'Poppins',color: Colors.blueGrey),)),
                          Padding(padding:EdgeInsets.only(top: 10,left: 10,right: 10),child: TextFormField(
                            controller: _textController_importance,
                            obscureText: false,
                            textDirection: TextDirection.rtl,
                            decoration: InputDecoration(
                              labelText: (_news.importance).toString(),
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
                      height: itemHeight*3,
                      color: Colors.white70,
                      child: Column(

                        children: [

                          Padding(padding:EdgeInsets.only(left: 20,right: itemWidth-105,top: 10),child: Text('Market Cap',style: TextStyle(fontSize: 16,fontFamily:'Poppins',color: Colors.blueGrey),)),
                          Padding(padding:EdgeInsets.only(top: 10,left: 10,right: 10),child: TextFormField(
                            controller: _textController_market_cap,

                            obscureText: false,
                            textDirection: TextDirection.rtl,
                            decoration: InputDecoration(
                              labelText: (_news.marketcap).toString(),
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
                      height: itemHeight*5,
                      color: Colors.white70,
                      child: Column(

                        children: [

                          Padding(padding:EdgeInsets.only(left: 20,right: itemWidth-75,top: 10,bottom: 10),child: Text('Picture',style: TextStyle(fontSize: 16,fontFamily:'Poppins',color: Colors.blueGrey),)),
                          Row(children: [

                            Container(width: itemWidth/2,child: Center(child:IconButton(icon: Icon(Icons.image_outlined),iconSize: 100,),)),
                            Container(width: itemWidth/2,child: Center(child:IconButton(icon: Icon(Icons.upload_file),iconSize: 100,),)),

                          ],)
                        ],

                      ),


                    ),
                    Container(

                      width: itemWidth,
                      height: itemHeight*5,
                      color: Colors.white70,
                      child: Column(

                        children: [

                          Padding(padding:EdgeInsets.only(left: 20,right: itemWidth-125,top: 10,bottom: 10),child: Text('Proof Picture',style: TextStyle(fontSize: 16,fontFamily:'Poppins',color: Colors.blueGrey),)),

                          Row(children: [

                            Container(width: itemWidth/2,child: Center(child:IconButton(icon: Icon(Icons.image_outlined),iconSize: 100,),)),
                            Container(width: itemWidth/2,child: Center(child:IconButton(icon: Icon(Icons.upload_file),iconSize: 100,),)),


                          ],)
                        ],

                      ),


                    ),

                  ],

                ),
                Row(

                  children: [

                    Container(

                      width: itemWidth,
                      height: itemHeight*5,
                      color: Colors.white70,
                      child: Column(

                        children: [

                          Padding(padding:EdgeInsets.only(left: 20,right: itemWidth-60,top: 10),child: Text('Text1',style: TextStyle(fontSize: 16,fontFamily:'Poppins',color: Colors.blueGrey),)),
                          Padding(padding:EdgeInsets.only(top: 10,left: 10,right: 10),child: TextFormField(
                            maxLines: 6,
                            controller: _textController_text1,
                            obscureText: false,
                            textDirection: TextDirection.rtl,
                            decoration: InputDecoration(
                              labelText: _news.tex1,
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

                      width: itemWidth,
                      height: itemHeight*5,
                      color: Colors.white70,
                      child: Column(

                        children: [

                          Padding(padding:EdgeInsets.only(left: 20,right: itemWidth-60,top: 10),child: Text('Text2',style: TextStyle(fontSize: 16,fontFamily:'Poppins',color: Colors.blueGrey),)),
                          Padding(padding:EdgeInsets.only(top: 10,left: 10,right: 10),child: TextFormField(
                            maxLines: 6,
                            controller: _textController_text2,
                            obscureText: false,
                            textDirection: TextDirection.rtl,
                            decoration: InputDecoration(
                              labelText: _news.text2,
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
                  width: itemWidth*2,
                  height: (itemHeight*2)+40,
                  color: Colors.white70,
                  child: Center(

                    child:Row(

                      children: [
                        
                        Padding(padding: EdgeInsets.only(left: itemWidth-210),
                            child: InkWell(
                              onTap: (){
                                print("pressed");
                                postData(_textController_title.text,_textController_coin_name.text,_textController_date_event.text,_textController_proof.text,_textController_importance.text,_textController_market_cap.text,_textController_text1.text,_textController_text2.text);


                              },
                              child: Container(width: 130,
                               height: 40,
                               color: Color(0xFF5E35B1),
                              // decoration: BoxDecoration(
                              //   borderRadius: BorderRadius.circular(5),
                              //   color: Colors.white70
                              // ),
                               child:Center(child: Text('SAVE',style: TextStyle(color: Colors.white70,fontSize: 20),)),
                        ),
                            )),
                        Padding(padding: EdgeInsets.only(left: 20),
                            child: InkWell(
                              child: Container(width: 130,
                                height: 40,
                                color: Colors.green[700],
                                child:Center(child: Text('OK',style: TextStyle(color: Colors.white70,fontSize: 20),)),
                              ),
                            )),
                        Padding(padding: EdgeInsets.only(left: 20),
                            child: InkWell(
                              onTap: (){
                                //postData(textController_title.text,textController_coin_name.text,textController_date_event.text,textController_proof.text,textController_importance.text,textController_market_cap.text,textController_text1.text,textController_text2.text);

                              },
                              child: Container(width: 130,
                                height: 40,
                                color: Colors.red,
                                child:Center(child: Text('DELETE',style: TextStyle(color: Colors.white70,fontSize: 20),)),
                              ),
                            )),
                        
                      ],

                    )

                  ),

                )




              ],
            ),

          ),
      ),

    );

  }

  postData(title,coinName,date,proof_address,importance,marketcap/*,picture,proof_picture*/,tex1,text2)async{
    Map data = {
      "a_id":null,
      "title":title,
      "coinName":coinName,
      "marketcap":marketcap,
      "importance":importance,
      "proof_add":proof_address,
      "pic_proof":null,
      "coin_pic":null,
      "tex1":tex1,
      "text2":text2,
      "date_event":date,
      "id_pic_proof":null,
      "id_coin_pic":null
    };
    print(data);
    Map header  = <String, String> {
      'Content-Type': 'application/json',
    };


    var jsonResponse;
    try {
      var response = await http.post(Uri.parse('https://buymanews.ir/admin/save'),body: jsonEncode(data),headers: header);
      jsonResponse = json.decode(response.body);
      print(jsonResponse);
    } catch (e) {
      print(e);
    }


  }
}
