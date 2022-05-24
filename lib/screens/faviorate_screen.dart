import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:softagi_api/constanse/const_color.dart';
import 'package:softagi_api/controller/api/favorites_api_controller.dart';
import 'package:softagi_api/model/favorite_model.dart';
import 'package:softagi_api/screens/details_products_screen.dart';

import '../widgets/custom_text.dart';

class FaviorateScreen extends StatefulWidget {
  const FaviorateScreen({ Key? key }) : super(key: key);

  @override
  State<FaviorateScreen> createState() => _FaviorateScreenState();
}

class _FaviorateScreenState extends State<FaviorateScreen> {

 List<FavoriteModel> _favorite = <FavoriteModel>[];
  late Future<List<FavoriteModel>> _future;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = FavoritesApiController().getFavorite();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   body:Column(
     children: [

       Padding(
         padding: const EdgeInsets.only(top:40,bottom: 20),
         child: CustomText(text: 'Favorite', fontSize: 25, fontWeight: FontWeight.w600),
       ),



             SizedBox(
               height: 600,
               child: FutureBuilder<List<FavoriteModel>>(
                future: _future,

                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: SpinKitRotatingCircle(
                           color: primaryColor,
                          size: 50.0,
                        ),
                    );
                  } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    _favorite = snapshot.data ?? [];

                    return   ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                         itemCount: _favorite.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return InkWell(
                      onTap: (){
                        // Get.to(ProductDetailsScreen(_favorite[index].product));
                      },
                      child:
                     Column(
                       children: [

                         Padding(
                           padding: const EdgeInsets.only(left: 7,right: 7,bottom: 15),
                           child: Container(
                             height: 100,
                             decoration: BoxDecoration(
                               // color: Colors.grey.shade200,
                               borderRadius:BorderRadius.circular(20),
                               border: Border.all(
                                 color: Colors.grey,
                                 width: 2,
                               ),
                             ),
                             child: Center(
                               child: ListTile(
                                   leading: Container(
                                     color: Colors.grey.shade200,
                                     child: Image.network('${_favorite[index].product!.image}'),
                                   ),
                                   title: Text('${_favorite[index].product!.name}',
                                     maxLines: 2,
                                     overflow: TextOverflow.ellipsis,
                                     style: TextStyle(

                                     ),
                                   ),
                                   trailing: IconButton(
                                     onPressed: (){},
                                     icon: Icon(Icons.favorite,color: primaryColor,),
                                   )
                               ),

                             ),

                           ),

                         ),

                       ],
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