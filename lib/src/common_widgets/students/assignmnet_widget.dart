
import 'package:flutter/material.dart';


import '../../contants/constants.dart';

class AssignmentDetailRow extends StatelessWidget {
  const AssignmentDetailRow(
      {Key? key, required this.title, required this.statusValue})
      : super(key: key);
  final String title;
  final String statusValue;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: kTextBlackColor, fontWeight: FontWeight.w900),
        ),
        Text(
          statusValue,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}

class AssignmentButton extends StatelessWidget {
  const AssignmentButton({Key? key, required this.title, required this.onPress})
      : super(key: key);
  final String title;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          width: 400,
          height: 60,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [kSecondaryColor, kPrimaryColor],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.5, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
            borderRadius: BorderRadius.circular(kDefaultPadding),
          ),
          child: Center(
            child: Text(
                title,
                style: Theme.of(context).textTheme.titleMedium
            ),
          ),
        ),
      ),
    );
  }
}