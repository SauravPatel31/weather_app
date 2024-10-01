import 'package:flutter/material.dart';
import 'package:weather_app/utils/app_const_data.dart';
import 'package:weather_app/view/daily_details_page.dart';

import '../utils/text_style.dart';

class TabsPage extends StatefulWidget{
  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 7, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daily Details "),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.connected_tv))
        ],
      ),
      body: Column(
        children: [
          DefaultTabController(length: 7,
              child: TabBar(
                  controller: _tabController,
                  labelColor: Colors.white,
                  labelPadding: EdgeInsets.all(8),
                  indicator: BoxDecoration(color: Color(0xff516AAB),borderRadius: BorderRadius.circular(10),),
                  indicatorSize:TabBarIndicatorSize.tab ,
                  dividerHeight: 0,
                  unselectedLabelColor: Colors.black,
                  tabs: AppConstData.dayAndDate.map((dayDateValue){
                    return Tab(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(dayDateValue['day'],style: myTextStyle15(myFontWeight: FontWeight.bold),),
                          Text(dayDateValue['date']),
                        ],
                      ),);
                  }).toList())
          ),
          ///TabBar View..
          Expanded(
            child: TabBarView(
                controller: _tabController,
                children: [
                DailyDetailsPage(),
                  Center(child: Text("Tue Temperature")),
                  Center(child: Text("Wed Temperature")),
                  Center(child: Text("Thu Temperature")),
                  Center(child: Text("Fir Temperature")),
                  Center(child: Text("Sat Temperature")),
                  Center(child: Text("San Temperature")),


                ]),
          ),
        ],
      ),
    );
  }
}