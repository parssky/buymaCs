import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:front_buyma/forPage2.dart';
import 'package:front_buyma/search.dart';
import 'upNavigator.dart';
import 'package:http/http.dart' as http;
import 'News.dart';
import 'formPage.dart';
//import 'search.dart';
import 'forPage2.dart';
import 'login.dart';
import 'SharedPrefrences.dart';
import 'package:search_page/search_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginDemo() ,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  List<News> _newsItem=[];
  List<News> _searchItem=[];
 // TextEditingController textController=TextEditingController();

  int _counter = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //newsItem= fetchItem();

    fetchData();



  }

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }
  TextEditingController textController=TextEditingController();
  @override
  Widget build(BuildContext context) {


    SizeConfig().init(context);


    var size = MediaQuery.of(context).size;


    final double itemHeight = (size.height - kToolbarHeight - 80) / 20;
    final double itemWidth = size.width / 2;

    var newnews = News(0,0, 'عنوان', 'اسم ارز',0, 0,null, 'تصویر اثبات', 'تصویر', 'متن اصلی', 'متن تحلیل شده',null, null,0,0);
    print(_newsItem.length);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.purple[50],
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),

          actions: [ Padding(padding:EdgeInsets.only(right: 20),child: InkWell(child: Icon(Icons.refresh),onTap:()=>{fetchData()} )),],
          backgroundColor: Colors.deepPurple,
          elevation: 8,

        ),
        //bottomNavigationBar: UpNavigator(),

        body: SafeArea(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 1,
              itemBuilder: (context, index) {
            return Column(
              mainAxisSize: MainAxisSize.max,
              children:[
                 SizedBox(height: 20),
                 Container(
                   width: itemWidth,
                    child: TextFormField(


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
                        prefixIcon: InkWell(
                          onTap: () => setState (
                                () => {_searchItem.clear(),searchData(textController.text)
                                },
                          ),
                          child: Icon(
                            Icons.search,
                          ),
                        ),
                        suffixIcon: textController.text.isNotEmpty
                            ? InkWell(
                          onTap: () => setState(
                                () => {textController.clear(),
                                fetchData()},
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
                    ),


                 ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Container(

                    child: UpNavigator(),
                  ),
                ),
                GridView.count(
                        childAspectRatio: (itemWidth / itemHeight),
                        controller: new ScrollController(keepScrollOffset: false),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        crossAxisCount: 1,
                        padding: EdgeInsets.all(20),
                        children: List.generate(_newsItem.length, (int position) {
                          return Container(width: itemWidth/2,child: generateItem(_newsItem[position],context));


                        }).reversed.toList(),
                ),


         ]
            );
  }
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context)=>formPage2(newnews)
            ));
          },
          backgroundColor: Colors.deepPurple,
          tooltip: 'New NEWS',
          child: Icon(Icons.add),
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  fetchData() async {

    var token = await getMobileToken();
    var header = {HttpHeaders.authorizationHeader: token,
      'content-type': 'application/json; charset=utf-8'
    };
    final res = await http.get("https://buymanews.ir/admin/getAll",headers: header);

      setState(() {
        var newsJson = json.decode(utf8.decode(res.bodyBytes));

        if(textController.text.isEmpty) {
          _newsItem.clear();
          for(var i in newsJson){
            var newItem=News(i['id'],i['a_id'],i['title'],i['coinName'],i['marketcap'],i['importance'],i['proof_add'].toString(),i['pic_proof'],i['coin_pic'],i['tex1'],i['text2'],i['date'].toString(),i['date_event'].toString(),i['id_pic_proof'],i['id_coin_pic']);
            _newsItem.add(newItem);}
          }
      }
      );

  }
  searchData(String txt) async{

    Map data = {
      'search':txt
    };

    var respons = await http.post(
        Uri.parse("https://buymanews.ir/admin/search"), body: data);
    setState(() {
      var newsJson = json.decode(utf8.decode(respons.bodyBytes));
      for (var i in newsJson) {
        var newItem2=News(i['id'],i['a_id'],i['title'],i['coinName'],i['marketcap'],i['importance'],i['proof_add'].toString(),i['pic-proof'],i['coin_pic'],i['tex1'],i['text2'],i['date'].toString(),i['date_event'].toString(),i['id_pic_proof'],i['id_coin_pic']);
        _searchItem.add(newItem2);
      }
      _newsItem = _searchItem;

    });

  }

}




Card generateItem(News news,context)=> Card(
    elevation: 4,
    shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))
    ) ,
    child: InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context)=>formPage2(news)
        ));
      },
      child: Row(
        children: [
          SizedBox(width: 20,),
          Container(width:SizeConfig.screenWidth/8,child: Center(child: Text((news.id).toString(),style: TextStyle(color: Colors.blueGrey),)),),
          Container(width:SizeConfig.screenWidth/8,child: Center(child:Text(news.title,style: TextStyle(fontSize: 18,),textDirection: TextDirection.rtl,),),),
          Container(width:SizeConfig.screenWidth/8,child: Center(child:Text(news.coinName),)),
          Container(width:SizeConfig.screenWidth/8,child: Center(child:Text((news.date).toString()),),),
          Container(width:SizeConfig.screenWidth/8,child: Center(child:Text((news.date_event).toString()),),),
          Container(width:SizeConfig.screenWidth/8,child: Center(child:Text((news.importance).toString()),),),
          Container(width:SizeConfig.screenWidth/8,child: Center(child:Text((news.marketcap).toString())),)

        ],
      ),
    ),

  );

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;
  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;

  void init(BuildContext context){
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth/100;
    blockSizeVertical = screenHeight/100;
    _safeAreaHorizontal = _mediaQueryData.padding.left +
        _mediaQueryData.padding.right;
    _safeAreaVertical = _mediaQueryData.padding.top +
        _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal)/100;
    safeBlockVertical = (screenHeight - _safeAreaVertical)/100;
  }
}