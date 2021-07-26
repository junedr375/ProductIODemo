import 'package:easyshop/Utils/AppImages.dart';
import 'package:easyshop/Utils/appThemeData.dart';
import 'package:easyshop/Utils/dummyData.dart';
import 'package:easyshop/Utils/getOfContext.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = getMediaQuerySize(context);
    double mainAxisHeight = getMainAxisHeight(context);
    final theme = getThemeData(context);
    return Scaffold(
      body: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          automaticallyImplyLeading: false,
          pinned: true,
          floating: true,
          backgroundColor: theme.primaryColor,
          expandedHeight: 120,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categories',
                style: theme.textTheme.headline1,
              ),
            ],
          ),
          bottom: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: theme.primaryColor.withOpacity(0.5),
            title: Container(
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 5, left: 15),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      print('sesarch');
                    },
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Search for nearby local shops...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            elevation: 20,
          ),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 1.2),
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            final category = categoriesDummyData[index];
            return Container(
                width: screenSize.width * 0.45,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: theme.primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    Expanded(
                        child: Container(
                      width: screenSize.width * 0.45,
                      child: Image.network(category['image'], fit: BoxFit.fill),
                    )),
                    SizedBox(height: 5),
                    Container(
                      child: Text(
                        category['name'],
                        style: theme.textTheme.headline2,
                      ),
                    )
                  ],
                ));
          }, childCount: categoriesDummyData.length),
        ),
      ]),
    );
  }
}
