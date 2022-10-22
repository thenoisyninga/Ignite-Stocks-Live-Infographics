import 'package:flutter/material.dart';
import 'package:stocks_live_infographics/widgets/stocks_chart.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {

  var delGroupShowing = 'A1';
  var industryShowing = 'Military';

  List<String> industryList = [
    'Military',
    'Auto',
    'FoodAgriculture',
    'Infrastructure',
    'Pharmaceutical',
    'Power',
  ];

  List<String> delGroupList = [
    'A1',
    'A2',
    'B1',
    'B2',
  ];

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    print("Showing Industry $industryShowing for Group $delGroupShowing");
    return Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.025,
              ),

              // The Logo
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // The Logo
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: screenHeight * 0.2,
                    width: screenWidth * 0.6,
                    child: Center(
                      child: Text("The Stocks logo.")
                    ),
                  ),
                  //Group Selector
                  Column(
                    children: [
                      SizedBox(
                        height: screenHeight * 0.07,
                      ),
                      Container(
                        height: screenHeight * 0.1,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey[900],
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: ButtonBar(
                          buttonPadding: EdgeInsets.all(20),
                          children: delGroupList.map((delGroup) => ElevatedButton(
                            onPressed: () {
                              setState(() {
                                delGroupShowing = delGroup;
                              });
                            },
                            child: Text(delGroup),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueGrey[600],
                            ),
                          ),
                        ).toList(), 
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: screenHeight * 0.04,),

                // Industry Selector
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red,
                    ),
                    width: screenWidth * 0.15,
                    height: screenHeight * 0.7,                
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: industryList.map((industryName) => ElevatedButton(
                          onPressed: () {
                            setState(() {
                              industryShowing =industryName;
                            });
                          },
                          child: Text(industryName),
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(screenWidth * 0.12, screenHeight * 0.07)  
                          ),
                          
                        )).toList()
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    height: screenHeight * 0.7,
                    width: screenWidth * 0.6,
                    child: Center(
                      child: StockGraph(
                        delGroupName: delGroupShowing,
                        industryName: industryShowing,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        )
    );
  }
}