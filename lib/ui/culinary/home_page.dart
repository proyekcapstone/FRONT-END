import 'dart:math';

import 'package:capstone_project_jti/data/model/culinary.dart';
import 'package:capstone_project_jti/helpers/result_state.dart';
import 'package:capstone_project_jti/provider/culinary/culinary_notifier.dart';
import 'package:capstone_project_jti/common/style.dart';
import 'package:capstone_project_jti/ui/culinary/detail_page.dart';
import 'package:capstone_project_jti/ui/culinary/rekomendasi_page.dart';
import 'package:capstone_project_jti/ui/culinary/search_page.dart';
import 'package:capstone_project_jti/ui/culinary/terbaru_page.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CulinaryHomePage extends StatelessWidget {
  static const routeName = 'culinary-home-page';
  final CulinaryResult culinaries;

  const CulinaryHomePage({
    Key key,
    this.culinaries,
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
                      Text('Kuliner',
                          style: Theme.of(context).textTheme.headline1),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, CulinarySearchPage.routeName);
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
                    Navigator.pushNamed(context, CulinaryTerbaruPage.routeName,
                        arguments: culinaries);
                  },
                  child: const Text(
                    'Lihat Semua',
                    style: TextStyle(color: secondaryColor),
                  ),
                )
              ],
            ),
          ),
          Consumer<CulinaryProvider>(
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
                      return _buildCulinariesItem(
                          context, state.result.culinaries[index]);
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
                        context, CulinaryRekomendasiPage.routeName,
                        arguments: culinaries);
                  },
                  child: const Text(
                    'Lihat Semua',
                    style: TextStyle(color: secondaryColor),
                  ),
                )
              ],
            ),
          ),
          Consumer<CulinaryProvider>(
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
                          Random().nextInt(state.result.culinaries.length);
                      return _buildCulinariesItem(
                          context, state.result.culinaries[random]);
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

Widget _buildCulinariesItem(BuildContext context, CulinaryResult culinary) {
  return InkWell(
      onTap: () {
        Navigator.pushNamed(context, CulinaryDetailPage.routeName,
            arguments: culinary);
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
                    culinary.image,
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
                      culinary.name,
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
                          culinary.city,
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
