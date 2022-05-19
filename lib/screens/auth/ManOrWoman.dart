import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:softagi_api/constanse/const_color.dart';
import 'package:softagi_api/widgets/custom_text.dart';

import '../Sign_with_social.dart';



class ManOrWoman extends StatefulWidget {
  const ManOrWoman({ Key? key }) : super(key: key);

  @override
  State<ManOrWoman> createState() => _ManOrWomanState();
}

class _ManOrWomanState extends State<ManOrWoman> with SingleTickerProviderStateMixin{
    late TabController _tabController;
  int _indexTab = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
        _tabController = TabController(length: 2, vsync: this);
  }
  @override
  void dispose() {
    _tabController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children:[
           Stack(
             children: [
                 Container(
         width: double.infinity,
         height: double.infinity,
               color:primaryColor,     
        ),
           Image.asset('images/smiling-pretty-girl-with-wavy-hairstyle-standing-one-leg-purple-wall-cheerful-brunette-female-model-dancing-white-sneakers-removebg 1.png',),
             ],
           ),
        Positioned(
          bottom: 40,
          left: 20,
          right: 20,
          child: Container(
            height: 240,
            width: 260,
            decoration: BoxDecoration(
            color:Colors.white,
            borderRadius: BorderRadius.circular(30),
            ),  
            child: Padding(
              padding: const EdgeInsets.only(
                // left: 20,
                top: 20,

              ),
              child: Column(
                children:[
                  Text('Look Good, Feel Good',style: TextStyle(
                    color: Colors.black,
                  
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  ),),

                  
          Column(
            children: [
              Column(
                children: [
                  Text(
                'Create your individual & unique style and ',
                 textAlign: TextAlign.center,
     
                style: TextStyle(
                  height: 1.5,
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Text(
                'look amazing everyday.',
                 textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1.5,
                  fontSize: 16,
                  color: Colors.grey,

                ),
              ),
                  
                ],
              ),
                ],
              ),
            ],
          ),
            SizedBox(height: 22,),
            
             Padding(
               padding: const EdgeInsets.only(left: 10,right:10),
               child: TabBar(
                              onTap: (value) {
                                setState(() {
                                  _indexTab = value;
                                });
                              },
                              controller: _tabController,
                              
                              unselectedLabelColor:
                                  Colors.grey,
                                  labelStyle: TextStyle(fontSize: 20),
                              labelColor: Colors.white,
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: primaryColor,
                              ),

                              tabs: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10,right:15),
                                  child: Container(
                                         width: 152,
                                    height: 60,                             
                                    child:Center(child: Text('Men',
                                    // style: TextStyle(
                                    //   fontSize: 20,
                                    // ),
                                    
                                    ))),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10,right:15),
                                  child: Container(
                                          width: 152,
                                    height: 60,
                                    
                                    child:Center(child: Text(
                                      'Woman',
                                    //  style: TextStyle(
                                    //   fontSize: 20,
                                    // ),
                                    
                                    ))),
                                ),

                              ],
               ),
             ),

          
             Padding(
               padding: const EdgeInsets.only(top:6),
               child: TextButton(
                 onPressed: (){
                   Navigator.push(context,MaterialPageRoute(builder:(context) {
                     return SignWithSocial();
                   },));
                 },
                 child: Text('SKIP',
                 style: TextStyle(
                   color: Colors.grey,
                   fontSize: 18,               
                 ),
                 ),
               ),
             ),


                ],


              ),
            ), 
          ),
        ),
       
        
        ]
      ),
      
    );
  }
}