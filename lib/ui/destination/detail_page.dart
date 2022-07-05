import 'package:capstone_project_jti/common/style.dart';
import 'package:capstone_project_jti/data/model/destination.dart';
import 'package:capstone_project_jti/provider/destination/database_destination_provider.dart';
import 'package:capstone_project_jti/provider/destination/detail_destination_notifier.dart';
import 'package:capstone_project_jti/utils/show_snackbar.dart';
import 'package:capstone_project_jti/widgets/detail_tab.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DestinationDetailPage extends StatefulWidget {
  static const routeName = 'destination-detail-page';
  final DestinationResult destinations;

  const DestinationDetailPage({Key key, this.destinations}) : super(key: key);

  @override
  State<DestinationDetailPage> createState() => _DestinationDetailPageState();
}

class _DestinationDetailPageState extends State<DestinationDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<DetailDestinationProvider>(context, listen: false)
          .fetchDestination(widget.destinations.id);
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
                          widget.destinations.image,
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
                        Positioned(
                          bottom: 15,
                          right: 15,
                          child: Consumer<DatabaseDestinationProvider>(
                            builder: (context, provider, _) {
                              return FutureBuilder<bool>(
                                future: provider
                                    .isFavorited(widget.destinations.id),
                                builder: (context, snapshot) {
                                  var isFavorited = snapshot.data ?? false;
                                  return CircleAvatar(
                                    backgroundColor: Colors.brown,
                                    child: isFavorited
                                        ? IconButton(
                                            icon: const Icon(
                                                CupertinoIcons.heart_fill),
                                            color: Colors.white,
                                            onPressed: () {
                                              provider
                                                  .removeDestinationFavorite(
                                                      widget.destinations.id);
                                              showSnackBar(context,
                                                  'Menghapus destinasi dari favorites!');
                                            })
                                        : IconButton(
                                            icon: const Icon(
                                                CupertinoIcons.heart),
                                            color: Colors.white,
                                            onPressed: () {
                                              provider.addDestinationFavorite(
                                                  widget.destinations);
                                              showSnackBar(context,
                                                  'Menambahkan destination ke favorites!');
                                            }),
                                  );
                                },
                              );
                            },
                          ),
                        )
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
                              widget.destinations.name,
                              maxLines: 2,
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              '${widget.destinations.address}, ${widget.destinations.city}, ${widget.destinations.province} - ${widget.destinations.postalCode}',
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
                            Text(widget.destinations.description,
                                style: Theme.of(context).textTheme.bodyText1),
                            const SizedBox(height: 5.0),
                            // Text(destinations.description),
                          ]),
                    ),
                    DetailTab(destination: widget.destinations)
                  ],
                ))));
  }
}
