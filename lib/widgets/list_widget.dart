import 'package:capstone_project_jti/common/style.dart';
import 'package:flutter/material.dart';

class ComponentListWidget extends StatelessWidget {
  final listHeight;
  const ComponentListWidget({Key key, this.listHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            contentPadding: EdgeInsets.all(8.0),
            leading: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset('asset/malioboro.png', height: listHeight)),
            title: Text('Malioboro'),
            subtitle: Text('lorem ipsum'),
            onTap: () {},
          ),
        ));
  }
}
