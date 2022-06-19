import 'package:capstone_project_jti/model/destination_model.dart';
import 'package:flutter/material.dart';
import 'package:capstone_project_jti/common/style.dart';

class HomePage extends StatelessWidget {
  final DestinationElement destinations;

  const HomePage({
    Key key,
    this.destinations,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: SingleChildScrollView(
            child: Column(children: [
      Stack(clipBehavior: Clip.none, children: <Widget>[
        Container(
          height: size.height * 0.25,
          decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(45),
                  bottomRight: Radius.circular(45))),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Wisata', style: Theme.of(context).textTheme.headline1),
              const Icon(
                Icons.search,
                size: 40,
                color: secondaryColor,
              ),
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
                            child: IconButton(
                              icon: const Icon(
                                Icons.hotel,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5.0),
                    Text('Penginapan',
                        style: Theme.of(context).textTheme.subtitle2),
                  ],
                ),
                const SizedBox(width: 15.0),
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
                          child: IconButton(
                            icon: const Icon(
                              Icons.restaurant,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ]),
                    const SizedBox(height: 5.0),
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
        margin: const EdgeInsets.only(top: 70.0, left: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Trending',
              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(height: 10.0),
            Container(
              alignment: Alignment.centerLeft,
              child: Card(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            destinations.image,
                            height: 150.0,
                          )),
                    ),
                    Text(destinations.name,
                        style: Theme.of(context).textTheme.subtitle1),
                    Text(
                      'lorem ipsum',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    const SizedBox(height: 10.0)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.only(top: 20.0, left: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Rekomendasi', style: Theme.of(context).textTheme.headline3),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
      Container(
          alignment: Alignment.centerLeft,
          child: Card(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      destinations.image,
                      height: 150.0,
                    )),
              ),
              Text(destinations.name,
                  style: Theme.of(context).textTheme.subtitle1),
              Text(
                'lorem ipsum',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              const SizedBox(height: 10.0),
              const SizedBox(height: 20.0),
            ],
          ))),
    ])));
  }
}

//Hotel
/*
  Widget _buildHotel(BuildContext context) {
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
                Text('Penginapan',
                    style: Theme.of(context).textTheme.headline1),
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
                              child: IconButton(
                                icon: const Icon(
                                  Icons.home_work_rounded,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5.0),
                      Text('Wisata',
                          style: Theme.of(context).textTheme.subtitle2),
                    ],
                  ),
                  const SizedBox(width: 15.0),
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
                            child: IconButton(
                              icon: const Icon(
                                Icons.restaurant,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ]),
                      const SizedBox(height: 5.0),
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
          margin: const EdgeInsets.only(top: 70.0, left: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Trending',
                style: Theme.of(context).textTheme.headline3,
              ),
              const SizedBox(height: 10.0),
              const ComponentCardWidget(cardHeight: 150.0)
            ],
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(top: 20.0, left: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Rekomendasi', style: Theme.of(context).textTheme.headline3),
              const SizedBox(height: 10.0),
              const ComponentCardWidget(cardHeight: 100.0)
            ],
          ),
        ),
        const SizedBox(height: 20.0),
      ],
    )));
  }

//Kuliner
  Widget _buildCulinary(BuildContext context) {
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
                Text('Kuliner', style: Theme.of(context).textTheme.headline1),
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
                              child: IconButton(
                                icon: const Icon(
                                  Icons.home_work_rounded,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5.0),
                      Text('Wisata',
                          style: Theme.of(context).textTheme.subtitle2),
                    ],
                  ),
                  const SizedBox(width: 15.0),
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
                            child: IconButton(
                              icon: const Icon(
                                Icons.hotel,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ]),
                      const SizedBox(height: 5.0),
                      Text('Penginapan',
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
          margin: const EdgeInsets.only(top: 70.0, left: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Trending',
                style: Theme.of(context).textTheme.headline3,
              ),
              const SizedBox(height: 10.0),
              const ComponentCardWidget(cardHeight: 150.0)
            ],
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(top: 20.0, left: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Rekomendasi', style: Theme.of(context).textTheme.headline3),
              const SizedBox(height: 10.0),
              const ComponentCardWidget(cardHeight: 100.0)
            ],
          ),
        ),
        const SizedBox(height: 20.0),
      ],
    )));
  }
}*/

