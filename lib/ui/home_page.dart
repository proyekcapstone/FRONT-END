import 'package:capstone_project_jti/ui/profile_page.dart';
import 'package:capstone_project_jti/widgets/card_widget.dart';
import 'package:capstone_project_jti/widgets/list_widget.dart';
import 'package:flutter/material.dart';
import 'package:capstone_project_jti/common/style.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: SingleChildScrollView(
            child: Column(
      children: [
        Stack(clipBehavior: Clip.none, children: <Widget>[
          Container(
            height: size.height * 0.25,
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(45),
                    bottomRight: Radius.circular(45))),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Wisata', style: Theme.of(context).textTheme.headline1),
                Icon(
                  Icons.search,
                  size: 40,
                  color: secondaryColor,
                )
              ],
            ),
          ),
          Positioned(
            top: 135,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                              child: Icon(
                                Icons.hotel,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.0),
                      Text('Penginapan',
                          style: Theme.of(context).textTheme.subtitle2),
                    ],
                  ),
                  SizedBox(width: 15.0),
                  Column(
                    children: [
                      Stack(children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                            child: Icon(
                              Icons.restaurant,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ]),
                      SizedBox(height: 5.0),
                      Text('Kuliner',
                          style: Theme.of(context).textTheme.subtitle2)
                    ],
                  )
                ],
              ),
            ),
          ),
        ]),
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(top: 70.0, left: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Trending',
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(height: 10.0),
              ComponentCardWidget(cardHeight: 150.0)
            ],
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(top: 20.0, left: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Rekomendasi', style: Theme.of(context).textTheme.headline3),
              SizedBox(height: 10.0),
              ComponentCardWidget(cardHeight: 100.0)
            ],
          ),
        ),
      ],
    )));
  }
}
