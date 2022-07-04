import 'package:capstone_project_jti/common/style.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  static const routeName = '/about-page';
  const AboutPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(children: <Widget>[
        Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("asset/banner.png"),
                    fit: BoxFit.cover,
                  )),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(16.0),
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
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 80.0),
                          child: Column(
                            children: [
                              Image.asset(
                                'asset/jti.png',
                                width: 110,
                              ),
                              const Text("JOGJA TRAVEL INFORMATION",
                                  style: TextStyle(
                                      color: secondaryColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18)),
                              const Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: Text("Travel and Culture",
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600)),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
            ),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                  child: Padding(
                padding:
                    const EdgeInsets.only(left: 32.0, right: 32.0, top: 42.0),
                child: Column(children: const [
                  Text("Description",
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0)),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 10, right: 10, top: 30, bottom: 24),
                    child: Text(
                        "JTI - Jogja Travel Information merupakan sebuah aplikasi informasi seputar destinasi wisata khususnya pada Daerah Istimewa Yogyakarta. Dikembangkan oleh Grup CPSG-33 dalam pemenuhan tugas akhir/capstone project pada program Studi Independen Bersertifikat Dicoding dengan Learning Path Multi-Platform Apps dan Back-End.",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey, fontSize: 15)),
                  ),
                  // PhotoAlbum(imgArray: imgArray)
                ]),
              )),
            ),
          ],
        ),
      ]),
    ));
  }
}
