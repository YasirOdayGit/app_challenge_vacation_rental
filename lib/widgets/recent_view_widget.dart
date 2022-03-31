import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../screens/place_preview.dart';

class RecentlyViewedWidget extends StatelessWidget {
  const RecentlyViewedWidget({
    Key? key,
    required this.size,
    required this.image,
  }) : super(key: key);

  final Size size;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute<void>(builder: (BuildContext context) {
          return PlacePreview(hero: image);
        }));
      },
      child: Hero(
        tag: image,
        child: Material(
          child: Container(
            width: 200,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: size.width / 2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(5, 5),
                      color: Colors.black26,
                      blurRadius: 5)
                ]),
            child: Column(
              children: [
                Expanded(
                    flex: 8,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: NetworkImage(image), fit: BoxFit.cover)),
                      // ClipRRect(
                      //   borderRadius: BorderRadius.circular(15),
                      //   child: Image.network(
                      //     faker.image.image(random: true),
                      //     fit: BoxFit.fitWidth,
                      //   ))
                    )),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    child: Row(children: const [
                      Expanded(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "High level bungalaw house",
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.favorite,
                        size: 18,
                        color: Color(0xff36635A),
                      )
                    ]),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    margin: const EdgeInsets.symmetric(vertical: 1),
                    child: const FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "2br 2ba 5 sleeps",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    margin: const EdgeInsets.symmetric(vertical: 1),
                    child: const FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Allentown, PA",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    margin: const EdgeInsets.symmetric(vertical: 1),
                    child: Row(
                      children: [
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Transform.rotate(
                                    angle: -75,
                                    child: const Icon(
                                      Icons.flash_on_rounded,
                                      color: Color(0xff36635A),
                                      size: 15,
                                    ),
                                  ),
                                ),
                                const TextSpan(
                                    text: "\$ 125",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                                const TextSpan(
                                    text: "/night",
                                    style: TextStyle(
                                        fontSize: 8,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                          ),
                        ),
                        Text(
                          "(${Random().nextInt(700).toString()})",
                          style: const TextStyle(
                              color: Color(0xffF5ADAD), fontSize: 8),
                        ),
                        RatingBar(
                          initialRating:
                              Random().nextInt(5) - Random().nextDouble(),
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 12,
                          ratingWidget: RatingWidget(
                            full: const Icon(
                              Icons.star,
                              color: Color(0xffF5ADAD),
                              size: 8,
                            ),
                            half: const Icon(
                              Icons.star_half,
                              color: Color(0xffF5ADAD),
                              size: 8,
                            ),
                            empty: const Icon(
                              Icons.star_border,
                              color: Color(0xffF5ADAD),
                              size: 8,
                            ),
                          ),
                          itemPadding: EdgeInsets.zero,
                          onRatingUpdate: (double value) {},
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
