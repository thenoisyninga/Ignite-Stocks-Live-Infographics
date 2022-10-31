import 'package:flutter/material.dart';
import 'package:stocks_live_infographics/widgets/stocks_chart.dart';


class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {

  var delGroupShowing = '1A';
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
    '1A',
    '1B',
    '2A',
    '2B',
  ];

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('background/stock_graph_visual.png')
            ),
          ),
          height: MediaQuery.of(context).size.height,
          child: Center(
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
                      child: const Center(
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
                          padding: EdgeInsetsDirectional.all(12),
                          height: screenHeight * 0.1,
                          width: screenWidth * 0.25,
                          decoration: BoxDecoration(
                            border: const Border(
                              top: BorderSide(color: Colors.black, width: 2),
                              bottom: BorderSide(color: Colors.black, width: 2),
                              left: BorderSide(color: Colors.black, width: 2),  
                              right: BorderSide(color: Colors.black, width: 2),
                            ),
                            color: const Color.fromARGB(255, 31, 31, 31),
                            borderRadius: BorderRadius.circular(40)
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: delGroupList.map((delGroup) => ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    delGroupShowing = delGroup;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)
                                  ),
                                  fixedSize: Size(screenWidth * 0.05,screenHeight * 0.07),
                                  side: const BorderSide(
                                    style: BorderStyle.solid
                                  ),
                                  backgroundColor: const Color.fromARGB(255, 60, 60, 60),
                                ),
                                child: Text(delGroup),
                              ),
                            ).toList(), 
                            ),
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
                            border: const Border(
                              top: BorderSide(color: Colors.black, width: 2),
                              bottom: BorderSide(color: Colors.black, width: 2),
                              left: BorderSide(color: Colors.black, width: 2),  
                              right: BorderSide(color: Colors.black, width: 2),
                            ),
                            color: const Color.fromARGB(255, 31, 31, 31),
                            borderRadius: BorderRadius.circular(40)
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
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                  fixedSize: Size(screenWidth * 0.12,screenHeight * 0.08),
                                  side: const BorderSide(
                                    style: BorderStyle.solid
                                  ),
                                  backgroundColor: const Color.fromARGB(255, 60, 60, 60),
                                ),
                            
                          )).toList()
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 17, 41, 61),
                        borderRadius: BorderRadius.circular(10),
                        border: const Border(
                              top: BorderSide(color: Color.fromARGB(255, 7, 19, 56), width: 5),
                              bottom: BorderSide(color: Color.fromARGB(255, 7, 19, 56), width: 5),
                              left: BorderSide(color: Color.fromARGB(255, 7, 19, 56), width: 5),
                              right: BorderSide(color: Color.fromARGB(255, 7, 19, 56), width: 5),
                        )
                      ),
                      height: screenHeight * 0.7,
                      width: screenWidth * 0.7,
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
          ),
        )
    );
  }
}