import 'package:flutter/material.dart';
import 'package:softagi_api/utils/helpers.dart';

import '../controller/api/complaints_api_controller.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_field.dart';


class ComplaintsScreen extends StatefulWidget {
  const ComplaintsScreen({ Key? key }) : super(key: key);

  @override
  State<ComplaintsScreen> createState() => _ComplaintsScreenState();
}

class _ComplaintsScreenState extends State<ComplaintsScreen> with Helpers{
   late TextEditingController nameEditingController;
  late TextEditingController emailEditingController;
  late TextEditingController messageEditingController;
  late TextEditingController phoneEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameEditingController = TextEditingController();
    emailEditingController = TextEditingController();
    messageEditingController = TextEditingController();
    phoneEditingController = TextEditingController();
  }

  @override
  void dispose() {
    nameEditingController.dispose();
    emailEditingController.dispose();
    messageEditingController.dispose();
    phoneEditingController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(''),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: SingleChildScrollView(
          child:
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(
              //   height: 50,
              // ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 10,
              ),
              CustomText(
                text: 'Add Your Complaints',
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              CustomText(
                text: 'please enter requierd data ...',
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                text: 'Name',
                textEditingController: nameEditingController,
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextField(
                text: 'Email',
                textEditingController: emailEditingController,
              ),
              SizedBox(height: 10),
              CustomTextField(
                text: 'Message',
                textEditingController: messageEditingController,
              ),
              SizedBox(height: 10),
              CustomTextField(
                text: 'Phone Number',
                textEditingController: phoneEditingController,
              ),
              SizedBox(height: 10),
              
              ElevatedButton(
                onPressed: () async => await performRegister(),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 53, 88, 139),
                  fixedSize: Size(400, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  shadowColor: Color.fromARGB(255, 61, 83, 156),
                ),
                child: Text(
                  'Add Complaints',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),

    );
  }

  Future<void> performRegister() async{
   if(checkData()){
    await register();
   } 
  }

  bool checkData() {
    if (nameEditingController.text.isNotEmpty &&
        emailEditingController.text.isNotEmpty &&
        messageEditingController.text.isNotEmpty &&
        phoneEditingController.text.isNotEmpty) {
          return true;
        }else{
          return false;
        }
  }

  Future<void> register() async {
    bool status = await ComplaintsApiController().addComplaints(
      name: nameEditingController.text,
      email: emailEditingController.text,
      message: messageEditingController.text,
      phone: phoneEditingController.text,
      context: context,
    );
  }

}