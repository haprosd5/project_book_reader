import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff100A28),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Container(
          child: Row(
            children: <Widget>[
              Text(
                'BO',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'avenir'),
              ),
              Column(
                children: <Widget>[
                  Text(
                    'O',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'avenir'),
                  ),
                  Container(
                    height: 3,
                    width: 15,
                    color: Colors.white,
                  ),
                ],
              ),
              Text(
                'KLY',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'avenir'),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ),
              color: Colors.white,
              onPressed: null)
        ],
      ),
      body: Container(
          padding: EdgeInsets.all(20),
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      child: CarouselSlider(
                          items: imageSlider,
                          options: CarouselOptions(
                            height: 230,
                            viewportFraction: 0.44,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            scrollDirection: Axis.horizontal,
                          ))),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Best Seller',
                    style: TextStyle(
                        fontFamily: 'montserrat',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 450,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      children: <Widget>[
                        bestSellerBook(
                            'book1.png',
                            'Chien tranh giua cac vi sao',
                            'Hongha',
                            '450',
                            '4.5',
                            '560')
                      ],
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }

  static List<String> image_list = [
    'assets/images/bookcover/book1.png',
    'assets/images/bookcover/book2.png',
    'assets/images/bookcover/book3.png'
  ];
  final List<Widget> imageSlider = image_list
      .map(
        (item) => Container(
          margin: EdgeInsets.all(1),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 170,
                height: 250,
                padding: EdgeInsets.only(left: 5, right: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                      image: AssetImage(item), fit: BoxFit.cover),
                ),
                child: Container(
                  padding: EdgeInsets.only(bottom: 10),
                  height: 50,
                  width: 50,
                  alignment: Alignment.bottomRight,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.grey[200].withOpacity(0.5),
                        ),
                        child: IconButton(
                            icon: Icon(Icons.play_arrow),
                            color: Colors.white,
                            onPressed: null),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )
      .toList();

  Container bestSellerBook(String image, String name, String author,
      String price, String rate, String totalRating) {
    return Container(
      child: InkWell(
        child: Container(
          margin: EdgeInsets.only(bottom: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                  tag: '$image',
                  child: Container(
                    width: 70,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      image: DecorationImage(
                          image: AssetImage('assets/images/best_seller/$image'),
                          fit: BoxFit.cover),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
