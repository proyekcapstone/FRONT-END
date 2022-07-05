import 'dart:math';

import 'package:capstone_project_jti/data/model/culinary.dart';
import 'package:capstone_project_jti/data/model/destination.dart';
import 'package:capstone_project_jti/provider/destination/destination_notifier.dart';
import 'package:capstone_project_jti/helpers/result_state.dart';
import 'package:capstone_project_jti/ui/culinary/home_page.dart';
import 'package:capstone_project_jti/ui/destination/detail_page.dart';
import 'package:capstone_project_jti/ui/destination/rekomendasi_page.dart';
import 'package:capstone_project_jti/ui/destination/search_page.dart';
import 'package:capstone_project_jti/ui/destination/terbaru_page.dart';
import 'package:capstone_project_jti/common/style.dart';
import 'package:capstone_project_jti/ui/hotel/home_page.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DestinationHomePage extends StatelessWidget {
  final DestinationResult destinations;
  final CulinaryResult culinaries;

  const DestinationHomePage({Key key, this.destinations, this.culinaries})
      : super(key: key);

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
                  Text('Wisata', style: Theme.of(context).textTheme.headline1),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, DestinationSearchPage.routeName);
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
            Positioned(
              top: 115,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, HotelHomePage.routeName,
                                arguments: culinaries);
                          },
                          child: Stack(children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: secondaryColor,
                                  borderRadius: BorderRadius.circular(30)),
                              child: const Center(
                                child: Icon(
                                  Icons.hotel,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ]),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          'Hotel',
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ],
                    ),
                    const SizedBox(width: 15.0),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, CulinaryHomePage.routeName,
                                arguments: culinaries);
                          },
                          child: Stack(children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: secondaryColor,
                                  borderRadius: BorderRadius.circular(30)),
                              child: const Center(
                                child: Icon(
                                  Icons.restaurant,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ]),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          'Kuliner',
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ]),
          const SizedBox(height: 70.0),
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
                    Navigator.pushNamed(
                        context, DestinationTerbaruPage.routeName,
                        arguments: destinations);
                  },
                  child: const Text(
                    'Lihat Semua',
                    style: TextStyle(color: secondaryColor),
                  ),
                )
              ],
            ),
          ),
          Consumer<DestinationProvider>(
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
                      return _buildDestinationsItem(
                          context, state.result.destinations[index]);
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
                    Navigator.pushNamed(
                        context, DestinationRekomendasiPage.routeName,
                        arguments: destinations);
                  },
                  child: const Text(
                    'Lihat Semua',
                    style: TextStyle(color: secondaryColor),
                  ),
                )
              ],
            ),
          ),
          Consumer<DestinationProvider>(
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
                      var random =
                          Random().nextInt(state.result.destinations.length);
                      return _buildDestinationsItem(
                          context, state.result.destinations[random]);
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

Widget _buildDestinationsItem(
    BuildContext context, DestinationResult destination) {
  return InkWell(
      onTap: () {
        Navigator.pushNamed(context, DestinationDetailPage.routeName,
            arguments: destination);
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
                    destination.image,
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
                      destination.name,
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
                          destination.city,
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
