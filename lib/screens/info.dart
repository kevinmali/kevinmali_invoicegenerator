import 'package:flutter/material.dart';
import 'package:invoicegenerator/global/cart_page.dart';
import 'package:invoicegenerator/global/global_page.dart';

// ignore: must_be_immutable
class Info extends StatefulWidget {
  String? pic1;
  String? pic2;
  String? pic3;
  double? price;
  String? company;
  double? rate;

  Info(
      {required String Pic1,
      required String Pic2,
      required String Pic3,
      required String Company,
      required double Price,
      required double Rate}) {
    pic1 = Pic1;
    pic2 = Pic2;
    pic3 = Pic3;

    price = Price;
    rate = Rate;
    company = Company;
  }

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  double item = 01;
  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 15,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'cart');
              },
              child: const Icon(
                Icons.shopping_bag,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 500,
                width: 400,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    width: 1,
                    color: Colors.black.withOpacity(0.3),
                  ),
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 280,
                        width: 150,
                        child: Image.asset("${widget.pic1}"),
                      ),
                      SizedBox(
                        height: 280,
                        width: 150,
                        child: Image.asset("${widget.pic2}"),
                      ),
                      SizedBox(
                        height: 280,
                        width: 150,
                        child: Image.asset("${widget.pic3}"),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  " ${widget.company}",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${widget.price} ₹",
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      " ${widget.rate} ⭐",
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        (item <= 1) ? item == 1 : item--;
                      });
                    },
                    icon: const Icon(Icons.remove),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: Text(
                      item.toStringAsFixed(0),
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        item++;
                      });
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "MATERIALS",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        bottom: 30,
                      ),
                      child: Text(
                        "Nylon was first produced in 1935. Nylon is a thermoplastic silky material. It became famous when used in women's stockings nylons in 1940. It was intended to be a synthetic replacement for silk and substituted for it in many different products after silk became scarce during World War II.",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          double queprice = widget.price! * item;
          Cart cart = Cart(
            pic1: widget.pic1,
            companyName: widget.company,
            price: widget.price,
            quePrice: queprice,
            quentity: item,
          );
          setState(() {
            Navigator.of(context).pushNamed('cart');
            Globals.addToCart.add(cart);
          });
        },
        child: Container(
          height: 60,
          width: 155,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Text(
            "ADD TO BAG",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
