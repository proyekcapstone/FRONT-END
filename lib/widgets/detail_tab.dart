import 'package:capstone_project_jti/common/style.dart';
import 'package:flutter/material.dart';

class DetailTab extends StatefulWidget {
  const DetailTab({Key key}) : super(key: key);

  @override
  State<DetailTab> createState() => _DetailTabState();
}

class _DetailTabState extends State<DetailTab> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 250.0, left: 15.0, right: 15.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: softColor,
                        borderRadius: BorderRadius.circular(15.0)),
                    child: TabBar(
                      indicator: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(15.0)),
                      tabs: [
                        Tab(
                          text: 'Detail',
                        ),
                        Tab(
                          text: 'Location',
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    child: TabBarView(children: [
                      SingleChildScrollView(
                        child: Container(
                            margin: EdgeInsets.only(top: 5.0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10.0),
                                  Text(
                                    'Harga Tiket',
                                    style: Theme.of(context).textTheme.headline4,
                                  ),
                                  SizedBox(height: 5.0),
                                  Text('Rp 10.000 per orang',
                                      style: Theme.of(context).textTheme.bodyText2),
                                  SizedBox(height: 15.0),
                                  Text(
                                    'Transportasi',
                                    style: Theme.of(context).textTheme.headline4,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.bike_scooter),
                                      Column(
                                        children: [
                                          Text(
                                            'Becak',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2,
                                          ),
                                          Text(
                                            'Rp 10.000',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            '2 orang',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2
                                          ),
                                          Text(
                                            '9 pagi - 16 sore',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 15.0),
                                  Text(
                                    'Sejarah',
                                    style: Theme.of(context).textTheme.headline4,
                                  ),
                                  SizedBox(height: 5.0),
                                  Text(
                                    'lorem ipsum',
                                    style: Theme.of(context).textTheme.bodyText1,
                                  ),
                                  SizedBox(height: 15.0),
                                  Text(
                                    'Peraturan',
                                    style: Theme.of(context).textTheme.headline4,
                                  ),
                                  SizedBox(height: 5.0),
                                  Text(
                                    'lorem ipsum',
                                    style: Theme.of(context).textTheme.bodyText1,
                                  ),
                                  SizedBox(height: 15.0),
                                ],
                              ),
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5.0),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
                              height: 150, width: 300, color: Colors.grey,
                              child: Center(child: Text('peta'))),
                            Text('Jarak dari lokasi anda sekitar 5 km', style: Theme.of(context).textTheme.bodyText2),
                          ],
                        ),
                      )
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
