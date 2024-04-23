import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class navProfil extends StatelessWidget {
  const navProfil(
      {super.key, required this.title, this.icon, this.subtitle = ""});
  final String title;
  final String subtitle;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontFamily:
              GoogleFonts.poppins(fontWeight: FontWeight.w700).fontFamily,
          color: Colors.white,
        ),
      ),
      trailing: SizedBox(width: 80, child: Image.asset('assets/logo.png',fit: BoxFit.fill,)),
    );
  }
}
