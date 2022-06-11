import 'package:capstone_project_jti/common/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ComponentCardWidget extends StatelessWidget {
  final cardHeight;
  const ComponentCardWidget({ Key key, this.cardHeight }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        alignment: Alignment.centerLeft,
        child: Card(
          child: Column(
            children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset('asset/malioboro.png', height: cardHeight,)),
            ),
            Text('Malioboro', style: Theme.of(context).textTheme.subtitle1),
            Text('lorem ipsum', style: Theme.of(context).textTheme.bodyText2,)
          ],)),
      )
    );
  }
}