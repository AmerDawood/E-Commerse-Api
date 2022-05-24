import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:softagi_api/controller/api/settings_api_controller.dart';
import 'package:softagi_api/model/settings_model.dart';
import 'package:softagi_api/widgets/custom_text.dart';


class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // List<Settings> _settings =<Settings>[];
  late Future<Settings> _future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = SettingsApiController().getSettings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child:TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0,
                      color: Colors.black.withOpacity(0.4),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: 'Search',
                  iconColor: Colors.black,
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset('images/Search.svg'),
                  ),
                  labelStyle: TextStyle(
                    fontSize: 20,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0,
                      color: Colors.black.withOpacity(0.4),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 900,
            child: Center(
              child: FutureBuilder<Settings>(
                future: _future,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Column(
                    
                       
                        children: 
                        [
                     
                     AboutAndTerms(title: 'About', details: snapshot.data!.about.toString(),),
                     AboutAndTerms(title: 'Terms', details: snapshot.data!.terms.toString(),),
      
                    
                    
                    
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
          ),




      







          
        ]
        ),
      ),
    );
  }
}





class AboutAndTerms extends StatelessWidget {

  final String title;
  final String details;

AboutAndTerms({
  required this.details,
  required this.title,
});
  @override
  Widget build(BuildContext context) {
    return Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
                        child: ExpandablePanel(
                          
                          
      header:Column(children: [
         Align(
           alignment: AlignmentDirectional.topStart,
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Text(title,
             style: TextStyle(
               fontSize: 20,
               fontWeight: FontWeight.w500,
             ),
             ),
           ),
         ),
         Divider(),
      ],),
      collapsed: Text('', softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,),

      expanded: Align(
        alignment: AlignmentDirectional.center,
        child: Text(details,
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
  }
}
