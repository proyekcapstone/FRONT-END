import 'package:flutter/material.dart';

class ComponentListWidget extends StatelessWidget {
  //final DestinationElement destination;
  const ComponentListWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return Consumer<FavoriteProvider>(builder: (context, provider, child) {
    return FutureBuilder<bool>(
        //future: provider.isFavorite(destination.id),
        builder: (context, snapshot) {
      //var isFavorite = snapshot.data ?? false;
      return Material(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          contentPadding: const EdgeInsets.all(8.0),
          leading: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset('asset/malioboro.png', height: 100.0)),
          title: const Text('Malioboro'),
          subtitle: const Text('lorem ipsum'),
          onTap: () async {
            /*DestinationElement destination =
              await ApiService().getAllDestinationApi();*/
          },
          //trailing:
        ),
      ));
    });
  }
  //);
}
//}
