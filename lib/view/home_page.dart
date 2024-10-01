import 'package:flutter/material.dart';
import 'package:weather_app/utils/app_const_data.dart';
import 'package:weather_app/utils/text_style.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
           width: MediaQuery.of(context).size.width,
          color: Colors.grey,
          child: Stack(
            children: [
              ///Background Image..
              Image.asset("assets/images/morning.png",height: double.infinity,fit: BoxFit.cover,),
              ///Drawer..
              DrawerButton(style: ButtonStyle(minimumSize: WidgetStatePropertyAll(Size(50, 50)))),
              ///Action Button..
              Positioned(
                  right: 10,
                  top: 10,
                  child: IconButton(onPressed: (){}, icon: Icon(Icons.connected_tv))),
              ///City Location Name AND Day-Time..
              Positioned(
                top:45,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  //color: Colors.green,
                  height: 100,
                  child: Column(
                    children: [
                      ///City Location Name..
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Jodhpur,Rajesthan",style: myTextStyle18(myFontWeight: FontWeight.bold,myUnderline: TextDecoration.underline)),
                          IconButton(onPressed: (){}, icon: Icon(Icons.location_on_outlined))
                        ],
                      ),
                      SizedBox(height: 5,),
                      ///Day-Time..
                      Text("Mon,4:00 PM")
                    ],
                  ),
                ),
              ),
              ///Temperature and Name(Rain,clouded,Sunny)
              Positioned(
                top: 160,
                child: Container(
                  //color: Colors.green,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Text("Party Sunny",style: myTextStyle18(),),
                      ///Temperature..
                      Text("20 C",style: TextStyle(fontSize: 60,fontWeight: FontWeight.bold),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Feels Like : 18",style: myTextStyle15(),),
                          SizedBox(width: 8,),
                          Icon(Icons.arrow_upward,color: Colors.red,),
                          SizedBox(width: 8,),
                          Text("22"),
                          SizedBox(width: 8,),
                          Icon(Icons.arrow_downward,color: Colors.blue,),
                          SizedBox(width: 8,),
                          Text("10"),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              /// Hourly Temperature..
              Positioned(
                bottom: 0,
                child: Column(
                  children: [
                    ///72 Hours Text
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      width:MediaQuery.of(context).size.width-20,
                      //color: Colors.red,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Hourly Forecast",style: myTextStyle15(myFontWeight: FontWeight.w900,myColor: Colors.white),),
                          Text("72 Hours",style: myTextStyle15(myFontWeight: FontWeight.w900,myColor: Colors.white),),
                        ],
                      ),
                    ),
                    ///Day Hours Temperature AND Weather Img..
                    Container(
                      height: 250,
                      margin: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width-20,
                      decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(15),
                        color: Colors.white,
                       /* boxShadow:[
                          BoxShadow(color: Colors.grey.shade800,spreadRadius: 3,blurRadius: 5)
                        ] ,*/
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: AppConstData.hoursTemp.map((weatherValue){
                              return  Container(
                                margin: EdgeInsets.all(5),
                                height: 150,
                                //color: Colors.amber,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(weatherValue['h']),
                                    Image.network(weatherValue['imge'], width: 50,fit: BoxFit.cover,),
                                    SizedBox(height: 18,),
                                    Text("${weatherValue['temp']}c"),
                                    Row(
                                      children: [
                                        Image.network('https://cdn-icons-png.flaticon.com/128/2792/2792706.png',width: 20,fit: BoxFit.cover,),
                                        Text(weatherValue['per'],),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),


                  ],
                ),
              )
      
            ],
          ),
        ),
        drawer: Drawer(),
      
      
      ),
    );
  }

}