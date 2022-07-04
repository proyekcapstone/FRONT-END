import 'dart:math';

import 'package:capstone_project_jti/data/model/hotel.dart';
import 'package:capstone_project_jti/helpers/result_state.dart';
import 'package:capstone_project_jti/provider/hotel/hotel_notifier.dart';
import 'package:capstone_project_jti/common/style.dart';
import 'package:capstone_project_jti/ui/hotel/detail_page.dart';
import 'package:capstone_project_jti/ui/hotel/rekomendasi_page.dart';
import 'package:capstone_project_jti/ui/hotel/search_page.dart';
import 'package:capstone_project_jti/ui/hotel/terbaru_page.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HotelHomePage extends StatelessWidget {
  static const routeName = 'hotel-home-page';
  final HotelResult hotels;

  const HotelHomePage({
    Key key,
    this.hotels,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 16.0),
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
                      Text('Hotel',
                          style: Theme.of(context).textTheme.headline1),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, HotelSearchPage.routeName);
                    },
                    icon: const Icon(
                      Icons.search,
                      size: 40,
                      color: secondaryColor,
                    ),
                  )
                ],
              ),
            ),
          ]),
          const SizedBox(height: 30.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Terbaru',
                  style: Theme.of(context).textTheme.headline5,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, HotelTerbaruPage.routeName,
                        arguments: hotels);
                  },
                  child: const Text(
                    'Lihat Semua',
                    style: TextStyle(color: secondaryColor),
                  ),
                )
              ],
            ),
          ),
          Consumer<HotelProvider>(
            builder: (context, state, _) {
              if (state.state == ResultState.loading) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 60.0),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  ),
                );
              } else if (state.state == ResultState.hasData) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return _buildHotelsItem(
                          context, state.result.hotels[index]);
                    },
                  ),
                );
              } else if (state.state == ResultState.noData) {
                return Center(child: Text(state.message));
              } else if (state.state == ResultState.error) {
                return Center(child: Text(state.message));
              } else {
                return const Center(child: Text('Error...'));
              }
            },
          ),

          /* Rekomendasi */

          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rekomendasi',
                  style: Theme.of(context).textTheme.headline5,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, HotelRekomendasiPage.routeName,
                        arguments: hotels);
                  },
                  child: const Text(
                    'Lihat Semua',
                    style: TextStyle(color: secondaryColor),
                  ),
                )
              ],
            ),
          ),
          Consumer<HotelProvider>(
            builder: (context, state, _) {
              if (state.state == ResultState.loading) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 60.0),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  ),
                );
              } else if (state.state == ResultState.hasData) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      var random = Random().nextInt(state.result.hotels.length);
                      return _buildHotelsItem(
                          context, state.result.hotels[random]);
                    },
                  ),
                );
              } else if (state.state == ResultState.noData) {
                return Center(child: Text(state.message));
              } else if (state.state == ResultState.error) {
                return Center(child: Text(state.message));
              } else {
                return const Center(child: Text('Error...'));
              }
            },
          )
        ],
      ))),
    );
  }
}

Widget _buildHotelsItem(BuildContext context, HotelResult hotel) {
  return InkWell(
      onTap: () {
        Navigator.pushNamed(context, HotelDetailPage.routeName,
            arguments: hotel);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16.0),
        height: 90,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: secondaryColor),
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 16),
              height: 70,
              width: 80,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: Image.network(
                    hotel.image,
                    fit: BoxFit.cover,
                  )),
            ),
            const SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Text(
                      hotel.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.location_on,
                          color: Colors.brown, size: 16),
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0),
                        child: Text(
                          hotel.city,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                ],
              ),
            )
          ],
        ),
      ));
}
