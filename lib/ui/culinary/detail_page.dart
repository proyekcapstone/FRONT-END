import 'package:capstone_project_jti/common/style.dart';
import 'package:capstone_project_jti/data/model/culinary.dart';
import 'package:capstone_project_jti/provider/culinary/detail_culinary_notifier.dart';
import 'package:capstone_project_jti/widgets/culinary/detail_tab.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CulinaryDetailPage extends StatefulWidget {
  static const routeName = 'culinary-detail-page';
  final CulinaryResult culinaries;

  const CulinaryDetailPage({Key key, this.culinaries}) : super(key: key);

  @override
  State<CulinaryDetailPage> createState() => _CulinaryDetailPageState();
}

class _CulinaryDetailPageState extends State<CulinaryDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<DetailCulinaryProvider>(context, listen: false)
          .fetchCulinary(widget.culinaries.id);
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
                          widget.culinaries.image,
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
                              widget.culinaries.name,
                              maxLines: 2,
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              '${widget.culinaries.address}, ${widget.culinaries.city}, ${widget.culinaries.province}',
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
                            Text(widget.culinaries.description,
                                style: Theme.of(context).textTheme.bodyText1),
                            const SizedBox(height: 5.0),
                            // Text(destinations.description),
                          ]),
                    ),
                    CulinaryDetailTab(culinary: widget.culinaries)
                  ],
                ))));
  }
}
