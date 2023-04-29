import 'package:bootcamp_book_explore/res/colors.dart';
import 'package:flutter/material.dart';

class processbar extends StatelessWidget {
  late var processed;
  late var currentwith;
  processbar({required this.processed, required this.currentwith});

  Widget build(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Container(
                height: 4,
                width: currentwith,
                decoration: BoxDecoration(
                  color: MyColors.grey,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              Container(
                height: 4,
                width: currentwith * processed / 100,
                decoration: BoxDecoration(
                  color: MyColors.green,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          Text(
            '${processed}%',
          )
        ]);
  }
}
