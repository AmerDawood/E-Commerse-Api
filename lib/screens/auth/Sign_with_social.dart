import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:softagi_api/screens/auth/ManOrWoman.dart';
import 'package:softagi_api/widgets/custom_button.dart';
import 'package:softagi_api/widgets/custom_text.dart';

import 'login_screen.dart';


class SignWithSocial extends StatelessWidget {
  const SignWithSocial({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Stack(
      children: [
        
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 45,left: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius:BorderRadius.circular(60),
                    ),
                    child:  IconButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder:(context) {
                        return ManOrWoman();
                      },)
                      );
                    }, icon:const Icon(Icons.arrow_back,)),
                  ),
                ),
            ),
      
      
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Text('Let’s Get Started',style: TextStyle(

                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),)
              ],
            ),
      
      
      
      
         
      
        ]
        ),

        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                     
           Padding(
             padding: const EdgeInsets.only(bottom: 12),
             child: InkWell(
               onTap: (){},
               child: SvgPicture.asset('images/facebookButton.svg')),
           ),
      Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child:   InkWell(
          onTap: (){},
          child: SvgPicture.asset('images/TwitterButton -l.svg')),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child:   InkWell(
          onTap:(){},
          child: SvgPicture.asset('images/googleButton -l.svg')),
      ),
         
            ],
          ),
        ),


        

      
          Positioned(
            bottom: 70,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                   padding: const EdgeInsets.only(left: 15,right: 15),
                   child: Padding(
                     padding: const EdgeInsets.only(left: 45),
                     child: Row(
                                children: [
                                  Text(
                                'Already have an account? ',
                                 textAlign: TextAlign.center,
                                  
                                style: TextStyle(
                                  height: 1.5,
                                  fontSize: 17,
                                  color: Colors.grey,
                                ),
                     ),
                    TextButton(
                      onPressed: (){
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return LoginScreen();
                        },
                      ));
                    }, child: Text(
                       ' Sign in',
                        style: TextStyle(
                                  height: 1.5,
                                  fontSize: 18,

                                  fontWeight: FontWeight.bold,
                                ),
                     ), ),                                    
                             
                             
                              
                                ],
                     ),
                   ),
                 ),
              ],
            ),
          ),
        

        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: CustomButton(
            text: 'Create Account',
             function:(){
                      Navigator.pushReplacementNamed(context, '/register_screen');
             }
             ),
        ),
     
      ],
     
      ),
    );
  }
}