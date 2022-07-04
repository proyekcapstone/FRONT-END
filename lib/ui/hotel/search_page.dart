import 'package:capstone_project_jti/common/style.dart';
import 'package:capstone_project_jti/data/model/hotel.dart';
import 'package:capstone_project_jti/helpers/result_state.dart';
import 'package:capstone_project_jti/provider/hotel/search_hotel_notifier.dart';
import 'package:capstone_project_jti/ui/hotel/detail_page.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HotelSearchPage extends StatefulWidget {
  static const routeName = 'hotel-search-page';
  const HotelSearchPage({Key key}) : super(key: key);

  @override
  State<HotelSearchPage> createState() => _HotelSearchPageState();
}

class _HotelSearchPageState extends State<HotelSearchPage> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        children: [
          Stack(children: [
            Container(
              height: size.height * 0.25,
              decoration: const BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(45),
                      bottomRight: Radius.circular(45))),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 15.0),
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
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Search',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                )
              ],
            ),
          ]),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              onSubmitted: (String value) {
                if (value.isNotEmpty) {
                  setState(() {
                    query = value;
                  });
                  Provider.of<SearchHotelProvider>(context, listen: false)
                      .searchAllHotel(query);
                }
              },
              decoration: const InputDecoration(
                hintText: 'Cari hotel ...',
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                suffixIcon: Icon(
                  Icons.search,
                  size: 30,
                  color: primaryColor,
                ),
              ),
              textInputAction: TextInputAction.search,
            ),
          ),
          (query.isNotEmpty)
              ? Consumer<SearchHotelProvider>(
                  builder: (context, state, _) {
                    if (state.state == ResultState.loading) {
                      return const Padding(
                        padding: EdgeInsets.only(top: 150.0),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: primaryColor,
                          ),
                        ),
                      );
                    } else if (state.state == ResultState.hasData) {
                      return Container(
                        padding: const EdgeInsets.all(16.0),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: state.result.hotels.length,
                          itemBuilder: (context, index) {
                            return _buildHotelsItem(
                                context, state.result.hotels[index]);
                          },
                        ),
                      );
                    } else if (state.state == ResultState.noData) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 100.0),
                        child: Center(
                            child: Column(
                          children: [
                            const Icon(
                              CupertinoIcons.doc_plaintext,
                              size: 100,
                              color: primaryColor,
                            ),
                            Text(
                              state.message,
                              style: const TextStyle(color: secondaryColor),
                            )
                          ],
                        )),
                      );
                    } else if (state.state == ResultState.error) {
                      return const Padding(
                        padding: EdgeInsets.only(top: 100.0),
                        child: Center(
                            child: Icon(
                          CupertinoIcons.doc_text_search,
                          size: 100,
                          color: primaryColor,
                        )),
                      );
                    } else {
                      return const Center(
                          child: Text('Internal Server Error...'));
                    }
                  },
                )
              : const Padding(
                  padding: EdgeInsets.only(top: 100.0),
                  child: Center(
                      child: Icon(
                    CupertinoIcons.doc_text_search,
                    size: 100,
                    color: primaryColor,
                  )),
                ),
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
              child: Hero(
                tag: hotel.image,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: Image.network(
                      hotel.image,
                      fit: BoxFit.cover,
                    )),
              ),
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
