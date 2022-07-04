import 'package:capstone_project_jti/common/style.dart';
import 'package:capstone_project_jti/data/model/destination.dart';
import 'package:capstone_project_jti/provider/destination/destination_notifier.dart';
import 'package:capstone_project_jti/helpers/result_state.dart';
import 'package:capstone_project_jti/ui/destination/detail_page.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DestinationTerbaruPage extends StatelessWidget {
  static const routeName = 'destination-terbaru-page';

  final DestinationResult destination;
  const DestinationTerbaruPage({Key key, this.destination}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Destinasi Terbaru'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                      padding: const EdgeInsets.all(16.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: state.result.destinations.length,
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
            ],
          ),
        ),
      ),
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
