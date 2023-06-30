import 'package:flutter/material.dart';
import 'screens/cart.dart';
import 'screens/info.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const Invoice_Generator(),
        'cart': (context) => const CartPage(),
      },
    ),
  );
}

class Invoice_Generator extends StatefulWidget {
  const Invoice_Generator({Key? key}) : super(key: key);

  @override
  State<Invoice_Generator> createState() => _Invoice_GeneratorState();
}

class _Invoice_GeneratorState extends State<Invoice_Generator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Shopping",
          style: TextStyle(
            fontSize: 24,
            letterSpacing: 8,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(9),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Row(
                children: [
                  Conr(
                    img: "lib/assets/pictures/onepiece/6/1.png",
                    img2: "lib/assets/pictures/onepiece/6/2.png",
                    img3: "lib/assets/pictures/onepiece/6/3.png",
                    price: 12000,
                    companyName: "Zara",
                    rate: 9.0,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Conr(
                    img: "lib/assets/pictures/onepiece/8/1.png",
                    img2: "lib/assets/pictures/onepiece/8/2.png",
                    img3: "lib/assets/pictures/onepiece/8/3.png",
                    price: 14000,
                    companyName: "H&M",
                    rate: 9.8,
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Conr(
                    img: "lib/assets/pictures/onepiece/2/1.png",
                    img2: "lib/assets/pictures/onepiece/2/2.png",
                    img3: "lib/assets/pictures/onepiece/2/3.png",
                    price: 7400,
                    companyName: "Pantaloons",
                    rate: 9.8,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Conr(
                    img: "lib/assets/pictures/onepiece/7/1.png",
                    img2: "lib/assets/pictures/onepiece/7/2.png",
                    img3: "lib/assets/pictures/onepiece/7/3.png",
                    price: 2500,
                    companyName: "Roadster",
                    rate: 7.9,
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Conr(
                    img: "lib/assets/pictures/onepiece/3/1.png",
                    img2: "lib/assets/pictures/onepiece/3/2.png",
                    img3: "lib/assets/pictures/onepiece/3/3.png",
                    price: 1499,
                    companyName: "Levi's",
                    rate: 7.5,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Conr(
                    img: "lib/assets/pictures/onepiece/1/1.png",
                    img2: "lib/assets/pictures/onepiece/1/2.png",
                    img3: "lib/assets/pictures/onepiece/1/3.png",
                    price: 2999,
                    companyName: "WESTSIDE",
                    rate: 8.7,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget Conr({
    required String img,
    required String img2,
    required String img3,
    required double price,
    required double rate,
    required String companyName,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Info(
                  Pic1: img,
                  Pic2: img2,
                  Pic3: img3,
                  Price: price,
                  Rate: rate,
                  Company: companyName,
                ),
              ),
            );
          },
          child: Container(
            height: 220,
            width: MediaQuery.of(context).size.width * 0.45,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.black.withOpacity(0.3),
              ),
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey.withOpacity(0.2),
            ),
            child: Image.asset(img),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 8,
            left: 8,
          ),
          child: Text(
            "$price ₹",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 8,
          ),
          child: Text(
            companyName,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
