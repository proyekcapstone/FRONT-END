import 'package:url_launcher/url_launcher.dart';
import 'package:capstone_project_jti/common/style.dart';
import 'package:capstone_project_jti/data/model/destination.dart';
import 'package:capstone_project_jti/utils/currency_format.dart';
import 'package:flutter/material.dart';

class DetailTab extends StatefulWidget {
  final DestinationResult destination;
  const DetailTab({Key key, this.destination}) : super(key: key);

  @override
  State<DetailTab> createState() => _DetailTabState();
}

class _DetailTabState extends State<DetailTab> {
  void _launchUrl() async {
    if (!await launchUrl(Uri.parse(widget.destination.website))) {
      throw 'Could not launch ${widget.destination.website}';
    }
  }

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
                                /* Harga Tiket */

                                const SizedBox(height: 10.0),
                                Text(
                                  'Harga Tiket',
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                const SizedBox(height: 5.0),
                                Text(
                                    '${CurrencyFormat.convertToIdr(widget.destination.ticket, 2)} per orang',
                                    style:
                                        Theme.of(context).textTheme.bodyText2),
                                const SizedBox(height: 15.0),

                                /* No Telephone */

                                Text(
                                  'No Telephone',
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                const SizedBox(height: 5.0),
                                Text(
                                  '+62${widget.destination.telephone}',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                const SizedBox(height: 15.0),

                                /* Open Time */

                                Text(
                                  'Open Time',
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                const SizedBox(height: 5.0),
                                Text(
                                  widget.destination.openTime,
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                const SizedBox(height: 15.0),

                                /* Open Day */

                                Text(
                                  'Open Day',
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                const SizedBox(height: 5.0),
                                Text(
                                  widget.destination.openDay,
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                const SizedBox(height: 15.0),

                                /* Instagram */

                                Text(
                                  'Instagram',
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                const SizedBox(height: 5.0),
                                Text(
                                  widget.destination.instagram,
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                const SizedBox(height: 15.0),

                                /* Website */

                                Text(
                                  'Website',
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                const SizedBox(height: 5.0),
                                OutlinedButton(
                                  child: Text(
                                    widget.destination.website,
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                  onPressed: _launchUrl,
                                ),
                                const SizedBox(height: 15.0),
                                // Text(
                                //   'Transportasi',
                                //   style: Theme.of(context).textTheme.headline4,
                                // ),
                                // Row(
                                //   mainAxisAlignment:
                                //       MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     Row(
                                //       children: [
                                //         const Icon(Icons.bike_scooter),
                                //         const SizedBox(width: 15.0),
                                //         Column(
                                //           crossAxisAlignment:
                                //               CrossAxisAlignment.start,
                                //           children: [
                                //             Text(
                                //               'Becak',
                                //               style: Theme.of(context)
                                //                   .textTheme
                                //                   .bodyText2,
                                //             ),
                                //             Text(
                                //               'Rp 10.000',
                                //               style: Theme.of(context)
                                //                   .textTheme
                                //                   .bodyText2,
                                //             ),
                                //           ],
                                //         ),
                                //       ],
                                //     ),
                                //     Column(
                                //       crossAxisAlignment:
                                //           CrossAxisAlignment.end,
                                //       children: [
                                //         Text('2 orang',
                                //             style: Theme.of(context)
                                //                 .textTheme
                                //                 .bodyText2),
                                //         Text(
                                //           '9 pagi - 16 sore',
                                //           style: Theme.of(context)
                                //               .textTheme
                                //               .bodyText2,
                                //         )
                                //       ],
                                //     )
                                //   ],
                                // ),
                                // const SizedBox(height: 15.0),
                                // Text(
                                //   'Sejarah',
                                //   style: Theme.of(context).textTheme.headline4,
                                // ),
                                // const SizedBox(height: 5.0),
                                // Text(
                                //   'lorem ipsum',
                                //   style: Theme.of(context).textTheme.bodyText1,
                                // ),
                                // const SizedBox(height: 15.0),
                                // Text(
                                //   'Peraturan',
                                //   style: Theme.of(context).textTheme.headline4,
                                // ),
                                // const SizedBox(height: 5.0),
                                // Text(
                                //   'lorem ipsum',
                                //   style: Theme.of(context).textTheme.bodyText1,
                                // ),
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
