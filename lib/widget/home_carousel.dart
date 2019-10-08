import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ferks/model/carousel.dart';
import 'package:cached_network_image/cached_network_image.dart';

class _HomeCarouselState extends State<HomeCarousel> {
  int _current = 0;

  List<Carousel> items;

  Widget getCarousel(carousels) => Stack(children: [
        CarouselSlider(
          aspectRatio: 2 / 1,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          viewportFraction: 1.0,
          onPageChanged: (index) {
            setState(() {
              _current = index;
            });
          },
          items: carousels
              .map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        //margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(color: Colors.amber),
                        child: CachedNetworkImage(
                            imageUrl: item.imageUrl,
                            placeholder: (context, url) =>
                                Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                Center(child: Icon(Icons.error)),
                            fit: BoxFit.cover));
                  },
                );
              })
              .cast<Widget>()
              .toList(),
        ),
        Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: carousels
                  .asMap()
                  .map((index, i) {
                    return MapEntry(index, Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: 8.0,
                          height: 8.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _current == index
                                  ? Color.fromRGBO(0, 0, 0, 0.9)
                                  : Color.fromRGBO(0, 0, 0, 0.4)),
                        );
                      },
                    ));
                  })
                  .values
                  .cast<Widget>()
                  .toList(),
            ))
      ]);

  @override
  Widget build(BuildContext context) {
    return items != null && items.length > 0
        ? getCarousel(items)
        : Center(child: CircularProgressIndicator());

    /*return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection('HomeWidget')
          .document('VwKa7t7iQiJds8VuXp99')
          .collection('carousel')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Text('Loading...');
          default:
            return getCarousel(
                snapshot.data.documents.map((DocumentSnapshot document) {
              return Carousel(
                  imageUrl: document['imageUrl'], link: document['link']);
            }).toList());
        }
      },
    );*/
  }

  @override
  void initState() {
    Firestore.instance
        .collection('HomeWidget')
        .document('VwKa7t7iQiJds8VuXp99')
        .get()
        .then((snapshot) {
      setState(() {
        items = snapshot.data['carousels']
            .map((dynamic document) {
              return Carousel(
                  imageUrl: document['imageUrl'], link: document['link']);
            })
            .cast<Carousel>()
            .toList();
      });
    });
    // TODO: implement initState
    super.initState();
  }
}

class HomeCarousel extends StatefulWidget {
  HomeCarousel({Key key}) : super(key: key);

  @override
  _HomeCarouselState createState() => _HomeCarouselState();
}
