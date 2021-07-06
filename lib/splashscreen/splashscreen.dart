import 'package:flutter/material.dart';
import '../beranda/beranda.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _pindahHalaman() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Beranda()));
  }

  @override
  void initState() {
    new Future.delayed(const Duration(seconds: 3), _pindahHalaman);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.only(top: 100),
              child: Image.asset('assets/images/beritaq-logo.png'),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              alignment: AlignmentDirectional.center,
              child: CircularProgressIndicator(),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 30.0),
              child: Text('Versi 1.0',
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                      fontStyle: FontStyle.normal)),
            ),
          ),
        ],
      ),
    );
  }
}
