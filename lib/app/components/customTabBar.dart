import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTabBar extends StatelessWidget {
  final String tittle;
  final int count;
  final Function() onTap;

  const CustomTabBar({
    super.key,
    required this.tittle,
    required this.count,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: onTap,
            child: Text(
              tittle,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.inriaSans(
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 18
              ),
            ),
          ),

          count > 0
          ? Container(
            margin: const EdgeInsetsDirectional.only(start: 5),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              shape: BoxShape.circle
            ),
            child: Center(
              child: Text(
                count > 20 ? "20++" : count.toString(),
                style: GoogleFonts.inriaSans(
                  color: const Color(0xFFEA1818),
                ),
              ),
            ),
          ) : const SizedBox(width: 0, height: 0,),
        ],
      ),
    );
  }
}
