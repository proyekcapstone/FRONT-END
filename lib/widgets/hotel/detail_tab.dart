import 'package:capstone_project_jti/data/model/hotel.dart';
import 'package:capstone_project_jti/common/style.dart';
import 'package:flutter/material.dart';

class HotelDetailTab extends StatefulWidget {
  final HotelResult hotel;
  const HotelDetailTab({Key key, this.hotel}) : super(key: key);

  @override
  State<HotelDetailTab> createState() => _HotelDetailTabState();
}

class _HotelDetailTabState extends State<HotelDetailTab> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Padding(
          padding: const EdgeInsets.only(top: 25.0, left: 15.0, right: 15.0),
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
                    tabs: const [
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
                          margin: const EdgeInsets.only(top: 5.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 15.0),

                                /* No Telephone */

                                Text(
                                  'No Telephone',
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                const SizedBox(height: 5.0),
                                Text(
                                  '+62${widget.hotel.telephone}',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                const SizedBox(height: 15.0),
                              ],
                            ),
                          )),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5.0),
                      child: Column(
                        children: [
                          Container(
                              margin: const EdgeInsets.only(
                                  top: 15.0, bottom: 15.0),
                              height: 150,
                              width: 300,
                              color: Colors.grey,
                              child: const Center(child: Text('peta'))),
                          Text('Jarak dari lokasi anda sekitar 5 km',
                              style: Theme.of(context).textTheme.bodyText2),
                        ],
                      ),
                    )
                  ]),
                ),
              ],
            ),
          ),
        ));
  }
}
