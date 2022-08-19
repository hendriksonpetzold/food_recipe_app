import 'package:flutter/material.dart';

class AvatarImage extends StatelessWidget {
  final String userProfileImage;
  final double width;
  final double height;
  const AvatarImage({
    Key? key,
    required this.userProfileImage,
    this.height = 40,
    this.width = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1000),
        image: DecorationImage(
          image: NetworkImage(
            userProfileImage,
          ),
        ),
      ),
    );
  }
}
