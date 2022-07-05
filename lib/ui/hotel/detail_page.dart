import 'package:capstone_project_jti/common/style.dart';
import 'package:capstone_project_jti/data/model/hotel.dart';
import 'package:capstone_project_jti/provider/hotel/detail_hotel_notifier.dart';
import 'package:capstone_project_jti/widgets/hotel/detail_tab.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HotelDetailPage extends StatefulWidget {
  static const routeName = '/hotel-detail-page';
  final HotelResult hotels;

  const HotelDetailPage({Key key, this.hotels}) : super(key: key);

  @override
  State<HotelDetailPage> createState() => _HotelDetailPageState();
}

class _HotelDetailPageState extends State<HotelDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<DetailHotelProvider>(context, listen: false)
          .fetchHotel(widget.hotels.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                padding: const EdgeInsets.all(0),
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: [
                        Image.network(
                          widget.hotels.image,
                          width: 360,
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 15.0, left: 15.0),
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                              child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(
                          top: 16.0, left: 16.0, right: 16.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.hotels.name,
                              maxLines: 2,
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              '${widget.hotels.address}, ${widget.hotels.city}, ${widget.hotels.province} - ${widget.hotels.postalCode}',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            const SizedBox(height: 16.0),
                            Row(
                              children: const [
                                Icon(Icons.star, color: Colors.amber),
                                Icon(Icons.star, color: Colors.amber),
                                Icon(Icons.star, color: Colors.amber),
                                Icon(Icons.star, color: Colors.amber),
                                Icon(Icons.star_half, color: Colors.amber),
                              ],
                            ),
                            const SizedBox(height: 20.0),
                            Text('Deskripsi',
                                style: Theme.of(context).textTheme.headline3),
                            const SizedBox(height: 5.0),
                            Text(widget.hotels.description,
                                style: Theme.of(context).textTheme.bodyText1),
                            const SizedBox(height: 5.0),
                            // Text(hotels.description),
                          ]),
                    ),
                    HotelDetailTab(hotel: widget.hotels)
                  ],
                ))));
  }
}
