import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:softagi_api/controller/api/category_api_controller.dart';
import 'package:softagi_api/widgets/custom_text.dart';

import '../model/category_model.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Category> _categories = <Category>[];
  late Future<List<Category>> _future;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = CategoryAPIControllers().getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.grey.shade100,
    appBar: AppBar(
        backgroundColor: context.theme.backgroundColor,
        elevation: 0,
        title: Text(
          'Category',
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/app_screen');
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0,
                      color: Colors.black.withOpacity(0.1),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: 'Search',
                  iconColor: Colors.black,
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset('images/Search.svg'),
                  ),
                  suffix: Text(
                    'Done',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  labelStyle: TextStyle(
                    fontSize: 20,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0,
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10, left: 15),
            child: CustomText(
                text: 'New Category',
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          SizedBox(
            height: 600,
            child: FutureBuilder<List<Category>>(
              future: _future,

              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  _categories = snapshot.data ?? [];

                  return   GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                       itemCount: _categories.length,
                itemBuilder: (BuildContext ctx, index) {
                  return InkWell(
                    onTap: (){
                                       },
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Stack(
                        children: [
                          Image(
                            width: double.infinity,
                            fit: BoxFit.cover,
                            height: double.infinity,

                            image: NetworkImage(
                               '${_categories[index].image}',

                            ),
                          ),
                          PositionedDirectional(
                            bottom: 0,
                            end: 0,
                            start: 0,
                            child: Container(
                              alignment: AlignmentDirectional.center,
                              color: Colors.black.withOpacity(0.2),
                              height: 60,
                              child:Column(
                                children: [
                                  Text(
                                  '${_categories[index].name}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
                     
                 
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


