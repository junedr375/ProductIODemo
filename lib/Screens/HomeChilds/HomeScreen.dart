import 'package:easyshop/Utils/AppImages.dart';
import 'package:easyshop/Utils/appThemeData.dart';
import 'package:easyshop/Utils/dummyData.dart';
import 'package:easyshop/Utils/getOfContext.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                'Home',
                style: theme.textTheme.headline1,
              ),
              Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Lottie.asset(
                    AppImages.cartIconLottie,
                    fit: BoxFit.scaleDown,
                    repeat: true,
                  ))
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
              childAspectRatio: 0.8),
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return ProductTile(
              index: index,
            );
          }, childCount: productDummyData["arrayOfProducts"].length),
        ),
      ]),
    );
  }
}

class ProductTile extends StatefulWidget {
  final int? index;
  const ProductTile({Key? key, this.index}) : super(key: key);

  @override
  _ProductTileState createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    Size screenSize = getMediaQuerySize(context);
    final theme = getThemeData(context);
    final product = productDummyData["arrayOfProducts"][widget.index];
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1)),
        child: Column(
          children: [
            Stack(children: [
              Container(
                height: 140,
                padding: EdgeInsets.only(top: 10),
                width: screenSize.width * 0.45,
                child: Image.network(
                  product['imgUrl'],
                  fit: BoxFit.fitHeight,
                ),
              ),
              Positioned(
                  right: -20,
                  top: -20,
                  child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: theme.primaryColor),
                      child: IconButton(
                        icon: Icon(
                          isFavourite
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          color: isFavourite ? Colors.redAccent : Colors.black,
                          size: 35,
                        ),
                        onPressed: () {
                          setState(() {
                            isFavourite = !isFavourite;
                          });
                        },
                      ))),
            ]),
            SizedBox(height: 10),
            Container(
              child: Text(
                product['name'],
                style: theme.textTheme.headline2,
              ),
            ),
            SizedBox(height: 5),
            Container(
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(text: "Price: ", style: theme.textTheme.headline4),
                  TextSpan(
                      text: product['price'].toString() + "₹",
                      style: theme.textTheme.headline3)
                ]),
              ),
            ),
          ],
        ));
  }
}
