import 'package:flutter/material.dart';
import 'package:jordan_store/controllers/store_controller.dart';

class LandingScreen extends StatefulWidget {
  LandingScreen({super.key, required this.storeController});

  final StoreController storeController;

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo de Nike
          Image.asset(
            'assets/nike.png',
            width: 300,
            height: 300,
          ),
          SizedBox(height: 20), // Espacio entre el logo y el texto
          // Texto "Just Do It"
          Text(
            'Just do it',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10), // Espacio entre los textos
          // Texto descriptivo
          Opacity(
            opacity: 0.7,
            child: Text(
              'Build next measures and custom tasks made with premium quality',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(height: 35), // Espacio antes del botón
          // Botón "Shop Now"

          ElevatedButton(
            onPressed: () {
              // Acción al presionar el botón
              widget.storeController.ShopNow();
              print('Shop Now pressed');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              textStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Shop Now',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    )

        //   Center(
        //     child: MaterialButton(
        //   onPressed: () {
        //     print('click');
        //     widget.storeController.ShopNow();
        //     setState(() {});
        //   },
        //   child: Text("Shop noww"),
        // ));

        ;
  }
}
