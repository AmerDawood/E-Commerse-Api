import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softagi_api/model/faqs_model.dart';

import '../../network/api/faqs_api_controller.dart';

class FaqsScreen extends StatefulWidget {
  const FaqsScreen({Key? key}) : super(key: key);

  @override
  State<FaqsScreen> createState() => _FaqsScreenState();
}

class _FaqsScreenState extends State<FaqsScreen> {
  List<Faqs> _faqs = <Faqs>[];
  late Future<List<Faqs>> _future;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = FaqsApiController().getFaqs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: context.theme.primaryColor,
        elevation: 0,
        title: Text('FAQS Questions',style: TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontWeight:FontWeight.w400,
           shadows: <Shadow>[
   
        ],
        
        ),
        
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/login_screen');
          },
          icon: Icon(Icons.arrow_back,color: Colors.black,),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 500,
            child: FutureBuilder<List<Faqs>>(
              future: _future,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  _faqs = snapshot.data ?? [];

                  return ListView.builder(
                    itemCount: _faqs.length,
                    itemBuilder: (context, index) {
                      return
                      Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
                        child: ExpandablePanel(
                          
                          
      header:Column(children: [
         Text(_faqs[index].question.toString(),
         style: TextStyle(
           fontSize: 20,
           fontWeight: FontWeight.w500,
         ),
         ),
         Divider(),
      ],),
      collapsed: Text('', softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,),

      expanded: Align(
        alignment: AlignmentDirectional.center,
        child: Text(_faqs[index].answer.toString(),
        style: TextStyle(
          fontSize: 18,
        ),
         softWrap: true,),
      ),
      theme: ExpandableThemeData(
        hasIcon: true,
        iconColor: Colors.blue,
        animationDuration: Duration(seconds: 1),
        iconSize: 30,
        
        
      ),
      
    ),
                      );


    
                    },
                  );
                } else {
                  return Column(
                    children: [
                      Icon(
                        Icons.warning,
                        size: 80,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'No Data',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
