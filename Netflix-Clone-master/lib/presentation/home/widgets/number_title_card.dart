import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/numbercard.dart';
import 'package:netflix_clone/presentation/widgets/maintitle.dart';

// ignore: must_be_immutable
class NumberTitleCard extends StatelessWidget {
  Future<List> function;

  NumberTitleCard({super.key, required this.function});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(title: 'Top 10 TV Shows in India Today'),
        kheight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                10,
                (index) => FutureBuilder(
                  future: function,
                  builder: (context, snapshot) {
                    String? imagePath = snapshot.data?[index].posterPath;
                    return snapshot.hasData
                        ? NumberCard(
                            index: index,
                            imagepath: imagePath!,
                          )
                        : const Center(
                            child: CircularProgressIndicator(color: Colors.red),
                          );
                  },
                ),
              )),
        )
      ],
    );
  }
}
