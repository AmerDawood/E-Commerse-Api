import 'package:flutter/material.dart';
import 'package:softagi_api/controller/api/contact_api_controller.dart';
import 'package:softagi_api/model/contact_model.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  List<Contact> _contact = <Contact>[];
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
    backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   leading: IconButton(
      //             icon: Icon(Icons.arrow_back,color: Colors.black,size: 30,),
      //             onPressed: (){},
      //           ),


      //           title: Text('Contact',style: TextStyle(color: Colors.black,fontSize: 25)),
      //           centerTitle: true,
        
      //   ),
      // extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(top: 10),
              child: Stack(
                children: [
                   Container(
                  width: double.infinity,
                  height: 300,
                  child: Image(
                    image: AssetImage('images/cont.jpg'),
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
                      //   leading: IconButton(
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                    icon: Icon(Icons.arrow_back,color: Colors.black,size: 30,),
                  onPressed: (){
                    Navigator.pushNamed(context, '/home_screen');
                  },
                   ),
            ),
              ],
              ),
            ),
            SizedBox(
              height: 600,
              child: FutureBuilder<List<Contact>>(
                future: _future,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    _contact = snapshot.data ?? [];

                    return ListView.builder(
                      itemCount: _contact.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10,horizontal:10),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.blue.withOpacity(0.2),
                                      blurRadius: 15),
                                ]),
                            child: ListTile(
                              // leading: icon,
                              tileColor: Colors.black.withOpacity(0.5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: const BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              leading: Image(
                              image: NetworkImage('${_contact[index].image}',),
                              color: Colors.cyan.shade300,
                              ),
                              title: Text(
                                '${_contact[index].value}',
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 20,
                                 color: Colors.cyan.shade600,
                                ),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
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
      ),
    );
  }
}
