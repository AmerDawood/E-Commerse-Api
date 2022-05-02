import 'dart:async';

import 'package:flutter/material.dart';
import 'package:softagi_api/controller/api/notification_api_coontroller.dart';
import 'package:softagi_api/model/notification_model.dart';


class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({ Key? key }) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {

   List<Notifications> _notification = <Notifications>[];
  late Future<List<Notifications>> _future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   setUpTimedFetch();
  }

    setUpTimedFetch() {
    Timer.periodic(Duration(milliseconds: 5000), (timer) {
      setState(() {
        _future = NotificationApiController().getNotifications();
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Notifications Screen',style: TextStyle(color: Colors.black),),
        iconTheme: IconThemeData(color: Colors.black),
        leading:IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pushReplacementNamed(context, '/home_screen');
          },
        ),
      ),


    body: FutureBuilder<List<Notifications>>(
          future: _future,
        
           
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  _notification = snapshot.data ?? [];

                  return ListView.builder(
                    itemCount: _notification.length,
                    itemBuilder:(context, index) {
                    return ListTile(
                      title: Text(_notification[index].title.toString()),
                      subtitle: Text(_notification[index].message.toString()),
                    );
                  },);
                     
                 
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
    );
  }
}