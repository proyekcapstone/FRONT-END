import 'package:flutter/material.dart';
import 'package:capstone_project_jti/common/style.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        children: [
          Stack(clipBehavior: Clip.none, children: <Widget>[
            Container(
              width: 360,
              height: 200,
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
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
              top: 145,
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
                        Text('Penginapan', style: Theme.of(context).textTheme.subtitle2),
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
                        Text('Kuliner', style: Theme.of(context).textTheme.subtitle2)
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
                ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Image.asset(
                      'asset/malioboro.png',
                      width: 250,
                    )),
                Text('Malioboro', style: Theme.of(context).textTheme.headline4),
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    'asset/malioboro.png',
                    width: 150,
                  ),
                ),
                Text(
                  'Malioboro',
                  style: Theme.of(context).textTheme.headline4,
                )
              ],
            ),
          ),
        ],
      ))),
    );
  }
}
