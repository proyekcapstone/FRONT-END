import 'package:capstone_project_jti/common/style.dart';
import 'package:capstone_project_jti/widgets/detail_tab.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
      children: <Widget>[
        Stack(
          children: [
            Image.asset(
              'asset/malioboro.png',
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
                onPressed: () {},
              )),
            ),
            Positioned(
                bottom: 15,
                right: 15,
                child: 
                IconButton(
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 45,
                  ),
                  onPressed: () {},
                ))
          ],
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(top: 15.0, left: 15.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Malioboro',
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(height: 5.0),
            Text(
              'lorem ipsum',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 5.0),
            Row(
              children: const [
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
              ],
            ),
            const SizedBox(height: 20.0),
            Text('Deskripsi', style: Theme.of(context).textTheme.headline3),
            const SizedBox(height: 5.0),
            Text('lorem ipsum', style: Theme.of(context).textTheme.bodyText1),
          ]),
        ),
        const DetailTab()
      ],
    ))));
  }
}
