import 'package:flutter/material.dart';

import '../styles/app_styles.dart';

class MoreUpcomingItem extends StatelessWidget {
  final int number;
  final String image;
  const MoreUpcomingItem({
    Key? key,
    required this.number,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {},
          child: Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$number more events'.toUpperCase(),
                      style: lightCollectionTitle,
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                      size: 10,
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
