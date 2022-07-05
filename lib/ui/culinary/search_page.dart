import 'package:capstone_project_jti/common/style.dart';
import 'package:capstone_project_jti/data/model/culinary.dart';
import 'package:capstone_project_jti/helpers/result_state.dart';
import 'package:capstone_project_jti/provider/culinary/search_culinary_notifier.dart';
import 'package:capstone_project_jti/ui/culinary/detail_page.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CulinarySearchPage extends StatefulWidget {
  static const routeName = 'culinary-search-page';
  const CulinarySearchPage({Key key}) : super(key: key);

  @override
  State<CulinarySearchPage> createState() => _CulinarySearchPageState();
}

class _CulinarySearchPageState extends State<CulinarySearchPage> {
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
                  Provider.of<SearchCulinaryProvider>(context, listen: false)
                      .searchAllCulinary(query);
                }
              },
              decoration: const InputDecoration(
                hintText: 'Cari kuliner ...',
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
              ? Consumer<SearchCulinaryProvider>(
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
                          itemCount: state.result.culinaries.length,
                          itemBuilder: (context, index) {
                            return _buildCulinariesItem(
                                context, state.result.culinaries[index]);
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
              child: Hero(
                tag: culinary.image,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: Image.network(
                      culinary.image,
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
