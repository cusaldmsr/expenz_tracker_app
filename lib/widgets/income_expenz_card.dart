import 'package:expenz_tracker_app/constants/colors.dart';
import 'package:flutter/material.dart';

class IncomeExpenzCard extends StatefulWidget {
  final String title;
  final String amount;
  final Color bgColor;
  final String imgPath;
  const IncomeExpenzCard({
    super.key,
    required this.title,
    required this.amount,
    required this.bgColor,
    required this.imgPath,
  });

  @override
  State<IncomeExpenzCard> createState() => _IncomeExpenzCardState();
}

class _IncomeExpenzCardState extends State<IncomeExpenzCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: widget.bgColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: kWhite.withOpacity(0.8),
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              child: Image.asset(
                widget.imgPath,
                width: 30,
                height: 30,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  color: kWhite.withOpacity(0.6),
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 0),
              Text(
                widget.amount,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
