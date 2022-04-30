import 'package:flutter/material.dart';
import 'package:softagi_api/controller/api/contact_api_controller.dart';
import 'package:softagi_api/model/contact_model.dart';



class ContactScreen extends StatefulWidget {
  const ContactScreen({ Key? key }) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  List<Contact> _contact =<Contact>[];
  late Future<List<Contact>> _future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = ContactApiController().getContact();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: 100,
            height: 300,
            child:Image(
              image:AssetImage('images/cont.jpg'),
              fit: BoxFit.cover,
            ),
            clipBehavior: Clip.antiAlias,
            
             decoration: BoxDecoration(
             color: Colors.black.withOpacity(0.1),
               borderRadius: BorderRadius.only(
                 bottomLeft: Radius.circular(40),
                 bottomRight: Radius.circular(40),
               ),
             ),
             
          ),

           SizedBox(
            height: 700,
            child: FutureBuilder<List<Contact>>(
              future: _future,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  _contact = snapshot.data ?? [];

                  return  ListView.builder(
                    itemCount: _contact.length,
                    itemBuilder:(context, index){
                    return Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
      BoxShadow(color: Colors.blue.withOpacity(0.2), blurRadius: 15),
    ]
  ),
  child: ListTile(
    // leading: icon,
    tileColor: Colors.black.withOpacity(0.5),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
      side: const BorderSide(
        color: Colors.black,
      ),
    ),
    title:Text(
      'text',
      maxLines: 1,
      style: TextStyle(
        fontSize: 20,
        color: Colors.blueAccent,
      ),
    ),
    contentPadding:
    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
  ),
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
          ),

        ],
      ),
    );
  }
}