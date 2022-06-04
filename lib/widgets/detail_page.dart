import 'package:capstone_project_jti/common/style.dart';
import 'package:capstone_project_jti/widgets/detail_tab.dart';
import 'package:flutter/material.dart';

class DetailWidget extends StatelessWidget {
  const DetailWidget({Key key}) : super(key: key);

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
              margin: EdgeInsets.only(top: 15.0, left: 15.0),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                  child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
            ),
            Positioned(
                bottom: 15,
                right: 15,
                child: Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 45,
                ))
          ],
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(top: 15.0,left: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(
              'Malioboro',
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(height: 5.0),
            Text('lorem ipsum',
            style: Theme.of(context).textTheme.bodyText1,),
            SizedBox(height: 5.0),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
              ],
            ),
            SizedBox(height: 20.0),
            Text('Deskripsi', style: Theme.of(context).textTheme.headline3),
            SizedBox(height: 5.0),
            Text('lorem ipsum', style: Theme.of(context).textTheme.bodyText1),
          ]),
        ),
      ],
    ))));
  }
}
