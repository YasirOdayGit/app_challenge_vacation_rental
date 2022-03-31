import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:expand_widget/expand_widget.dart';

class PlacePreview extends StatefulWidget {
  const PlacePreview({Key? key, required this.hero}) : super(key: key);
  final String hero;
  @override
  State<PlacePreview> createState() => _PlacePreviewState();
}

class _PlacePreviewState extends State<PlacePreview> {
  bool expandDescription = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: SizedBox(
          width: size.width,
          height: 50,
          child: Row(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                            text: "\$ 125",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: "/night",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Book Now",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xff36635A)),
                        shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50)))))),
              ))
            ],
          ),
        ),
        body: Hero(
          tag: widget.hero,
          child: Material(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  stretch: false,
                  floating: true,
                  backgroundColor: Colors.white,
                  onStretchTrigger: () async {},
                  elevation: 0,
                  collapsedHeight: 100,
                  leading: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_circle_left_sharp)),
                  actions: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.ios_share,
                        )),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.favorite)),
                  ],
                  expandedHeight: size.height / 2.5,
                  flexibleSpace: Stack(
                    children: <Widget>[
                      Positioned.fill(
                          child: Image.network(
                        widget.hero,
                        fit: BoxFit.cover,
                      )),
                      Positioned(
                          left: 0,
                          bottom: -5,
                          child: Container(
                            height: 40,
                            width: size.width,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            alignment: Alignment.centerLeft,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25))),
                            child: const Text(
                              "Modern Cottage House",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ))
                    ],
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 0),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "4 guests 2 bedrooms 3 beds 2 baths",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          RatingBar(
                                            initialRating: Random().nextInt(5) -
                                                Random().nextDouble(),
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemSize: 16,
                                            maxRating: 5,
                                            minRating: 0,
                                            ratingWidget: RatingWidget(
                                              full: const Icon(
                                                Icons.star,
                                                color: Color(0xffF5ADAD),
                                              ),
                                              half: const Icon(
                                                Icons.star_half,
                                                color: Color(0xffF5ADAD),
                                              ),
                                              empty: const Icon(
                                                Icons.star_border,
                                                color: Color(0xffF5ADAD),
                                              ),
                                            ),
                                            itemPadding: EdgeInsets.zero,
                                            onRatingUpdate: (double value) {},
                                          ),
                                          Text(
                                              "${Random().nextInt(252)} Reviews >",
                                              style: const TextStyle(
                                                  color: Color(0xffF5ADAD),
                                                  fontSize: 12))
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                        child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Stack(
                                        alignment: Alignment.centerRight,
                                        children: [
                                          Positioned(
                                              right: 45,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        color: Colors.white,
                                                        width: 2)),
                                                child: CircleAvatar(
                                                  maxRadius: 17,
                                                  backgroundImage: NetworkImage(
                                                      faker.image.image(
                                                          keywords: ["person"],
                                                          random: true)),
                                                ),
                                              )),
                                          Positioned(
                                              right: 30,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        color: Colors.white,
                                                        width: 2)),
                                                child: CircleAvatar(
                                                  maxRadius: 17,
                                                  backgroundImage: NetworkImage(
                                                    faker.image.image(
                                                        keywords: ["person"],
                                                        random: true),
                                                  ),
                                                ),
                                              )),
                                          Positioned(
                                              right: 15,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        color: Colors.white,
                                                        width: 2)),
                                                child: CircleAvatar(
                                                  maxRadius: 17,
                                                  backgroundImage: NetworkImage(
                                                      faker.image.image(
                                                          keywords: ["person"],
                                                          random: true)),
                                                ),
                                              )),
                                          Positioned(
                                              right: 0,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        color: Colors.white,
                                                        width: 2)),
                                                child: CircleAvatar(
                                                  maxRadius: 17,
                                                  backgroundImage: NetworkImage(
                                                      faker.image.image(
                                                          keywords: ["person"],
                                                          random: true)),
                                                ),
                                              )),
                                        ],
                                      ),
                                    ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Expanded(
                                  child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  "what this place offers",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              )),
                              Expanded(
                                  child: FittedBox(
                                fit: BoxFit.scaleDown,
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "More",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff36635A)),
                                ),
                              ))
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: size.width * 0.25,
                                height: size.width * 0.25,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                    border: Border.all(
                                        color: const Color(0xff759892),
                                        width: 1),
                                    boxShadow: const [
                                      BoxShadow(
                                          offset: Offset(5, 5),
                                          color: Colors.black12,
                                          blurRadius: 5)
                                    ]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.fireplace_outlined,
                                      color: const Color(0xff759892),
                                      size: size.width * 0.12,
                                    ),
                                    const Text(
                                      "Fireplace",
                                      style: TextStyle(
                                          color: Color(0xff759892),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: size.width * 0.25,
                                height: size.width * 0.25,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                    border: Border.all(
                                        color: const Color(0xff759892),
                                        width: 1),
                                    boxShadow: const [
                                      BoxShadow(
                                          offset: Offset(5, 5),
                                          color: Colors.black12,
                                          blurRadius: 5)
                                    ]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.wifi,
                                      color: const Color(0xff759892),
                                      size: size.width * 0.12,
                                    ),
                                    const Text(
                                      "Wifi",
                                      style: TextStyle(
                                          color: Color(0xff759892),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: size.width * 0.25,
                                height: size.width * 0.25,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                    border: Border.all(
                                        color: const Color(0xff759892),
                                        width: 1),
                                    boxShadow: const [
                                      BoxShadow(
                                          offset: Offset(5, 5),
                                          color: Colors.black12,
                                          blurRadius: 5)
                                    ]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.accessible,
                                      color: const Color(0xff759892),
                                      size: size.width * 0.12,
                                    ),
                                    const Text(
                                      "Accessible",
                                      style: TextStyle(
                                          color: Color(0xff759892),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          const Text(
                            "Description",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ExpandText(
                            faker.lorem.words(200).toString(),
                            animationDuration: const Duration(milliseconds: 10),
                            maxLines: 2,
                            arrowColor: const Color(0xffF5ADAD),
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87),
                          ),
                        ],
                      ),
                    )
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
