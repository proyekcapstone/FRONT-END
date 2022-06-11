import 'package:capstone_project_jti/common/style.dart';
import 'package:capstone_project_jti/widgets/list_widget.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: size.height * 0.2,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text('Search',
                      style: Theme.of(context).textTheme.headline1),
                ),
              ),
              TextFormField(
                controller: null,
                decoration: InputDecoration(
                    hintText: 'Text here',
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    icon: Icon(
                      Icons.search,
                      size: 40,
                      color: primaryColor,
                    )),
              ),
            ],
          ),
          ComponentListWidget(listHeight: 120.0,)
        ],
      ))),
    );
  }
}
