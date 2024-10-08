import 'package:dealmart/services/shared_preferences.dart';
import 'package:dealmart/widget/support_widget.dart';
import 'package:flutter/material.dart';
import 'package:dealmart/pages/product_category_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List categories = [
    "images/headphone_icon.png",
    "images/laptop.png",
    "images/TV.png",
    "images/watch.png",
  ];

  List categoryNames = [
    "Headphones",
    "Laptop",
    "TV",
    "Watch",
  ];

  String? name, image;

  getSharedPrefData()async{
    name = await SharedPreferenceHelper().getUserName();
    image = await SharedPreferenceHelper().getUserImage();

    setState(() {
      
    });
  } 

  onLoad()async{
    await getSharedPrefData();
    setState(() {
      
    });
  }

  @override
  void initState() {
    onLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: name == null?Center(child: CircularProgressIndicator()): SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hey, ${name!}",
                        style: AppWidget.boldTextFieldStyle(),
                      ),
                      Text(
                        "Let's start shopping!",
                        style: AppWidget.lightTextFieldStyle(),
                      ),
                    ],
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        image!,
                        height: 70,
                        width: 70,
                        fit: BoxFit.cover,
                      ))
                ],
              ),
              SizedBox(height: 30.0),
              Container(
                  padding: EdgeInsets.only(left: 5.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  width: MediaQuery.of(context).size.width,
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search Products",
                        hintStyle: AppWidget.lightTextFieldStyle(),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        )),
                  )),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Category",
                    style: AppWidget.semiboldTextFieldStyle(),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                        color: Color(0xFFfd6f3e),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Container(
                    height: 130,
                    padding: EdgeInsets.all(20.0),
                    margin: EdgeInsets.only(right: 20.0),
                    decoration: BoxDecoration(
                        color: Color(0xFFfd6f3e),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "All",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 130,
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: categories.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CategoryTile(
                              image: categories[index],
                              name: categoryNames[index],
                            );
                          }),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "All Products",
                    style: AppWidget.semiboldTextFieldStyle(),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                        color: Color(0xFFfd6f3e),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 190,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 20.0),
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Image.asset(
                            "images/headphone2.png",
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            "Headphone",
                            style: AppWidget.semiboldTextFieldStyle(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$100",
                                style: TextStyle(
                                  color: Color(0xFFfd6f3e),
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Container(
                                  padding: EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                      color: Color(0xFFfd6f3e),
                                      borderRadius: BorderRadius.circular(7)),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CategoryTile extends StatelessWidget {
  String image, name;

  CategoryTile({required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductCategoryPage(category: name)
            )
        );
      },
      child: Container(
        padding: EdgeInsets.all(20.0),
        margin: EdgeInsets.only(right: 20.0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              image,
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
            Icon(Icons.arrow_forward)
          ],
        ),
      ),
    );
  }
}
