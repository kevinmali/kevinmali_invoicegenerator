import 'package:flutter/material.dart';
import 'package:invoicegenerator/global/global_page.dart';
import 'package:pdf/pdf.dart';
import 'dart:typed_data';
import 'package:pdf/widgets.dart' as Pw;
import 'package:printing/printing.dart';
import 'dart:math';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Pw.Document pdf = Pw.Document();
  Random rr = Random();
  var year = DateTime.now().year;
  var month = DateTime.now().month;
  var day = DateTime.now().day;

  @override
  void initState() {
    super.initState();
    pdf.addPage(
      Pw.Page(
        build: (context) => Pw.Container(
          decoration: Pw.BoxDecoration(
            color: PdfColors.white,
            border: Pw.Border.all(
              width: 2,
              color: PdfColors.black,
            ),
          ),
          child: Pw.Padding(
            padding: const Pw.EdgeInsets.all(10.0),
            child: Pw.Column(
              children: [
                Pw.Expanded(
                  flex: 1,
                  child: Pw.Center(
                    child: Pw.Text(
                      "INVOICE",
                      style: Pw.TextStyle(
                        fontSize: 30,
                        fontWeight: Pw.FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Pw.Expanded(
                  flex: 2,
                  child: Pw.Row(
                    children: [
                      Pw.SizedBox(
                        height: 20,
                      ),
                      Pw.Padding(
                        padding: const Pw.EdgeInsets.only(
                          left: 10,
                          top: 30,
                        ),
                        child: Pw.Column(
                          crossAxisAlignment: Pw.CrossAxisAlignment.start,
                          children: [
                            Pw.Text(
                              "INVOICE TO :",
                              style: Pw.TextStyle(
                                fontSize: 15,
                                fontWeight: Pw.FontWeight.bold,
                              ),
                            ),
                            Pw.SizedBox(
                              height: 5,
                            ),
                            Pw.Text(
                              "Kevin Mali\nc-1 Giriraj ,\nchaprabatha Amroli,\nSurat : 395006",
                              style: const Pw.TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Pw.Padding(
                        padding: const Pw.EdgeInsets.only(
                          left: 100,
                          top: 40,
                        ),
                        child: Pw.Column(
                          crossAxisAlignment: Pw.CrossAxisAlignment.start,
                          children: [
                            Pw.Text(
                              "Invoice No    : ${rr.nextInt(1000000000)}",
                              style: Pw.TextStyle(
                                fontSize: 15,
                                fontWeight: Pw.FontWeight.bold,
                              ),
                            ),
                            Pw.SizedBox(
                              height: 7,
                            ),
                            Pw.Text(
                              "Invoice Date : $day / $month / $year",
                              style: Pw.TextStyle(
                                fontSize: 15,
                                fontWeight: Pw.FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Pw.Expanded(
                  flex: 5,
                  child: Pw.Column(
                    children: [
                      //Line of detail
                      Pw.Row(
                        children: [
                          Pw.Expanded(
                            flex: 3,
                            child: Pw.Container(
                              height: 30,
                              alignment: Pw.Alignment.center,
                              color: PdfColors.grey500,
                              child: Pw.Text(
                                "DETAILS",
                                style: const Pw.TextStyle(
                                  color: PdfColors.white,
                                ),
                              ),
                            ),
                          ),
                          Pw.Expanded(
                            flex: 2,
                            child: Pw.Container(
                              height: 30,
                              alignment: Pw.Alignment.center,
                              color: PdfColors.grey500,
                              child: Pw.Text(
                                "QUANTITY",
                                style: const Pw.TextStyle(
                                  color: PdfColors.white,
                                ),
                              ),
                            ),
                          ),
                          Pw.Expanded(
                            flex: 2,
                            child: Pw.Container(
                              height: 30,
                              alignment: Pw.Alignment.center,
                              color: PdfColors.grey500,
                              child: Pw.Text(
                                "UNTIL PRICE",
                                style: const Pw.TextStyle(
                                  color: PdfColors.white,
                                ),
                              ),
                            ),
                          ),
                          Pw.Expanded(
                            flex: 2,
                            child: Pw.Container(
                              height: 30,
                              alignment: Pw.Alignment.center,
                              color: PdfColors.grey500,
                              child: Pw.Text(
                                "PRICE",
                                style: const Pw.TextStyle(
                                  color: PdfColors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Pw.ListView.builder(
                          itemBuilder: (context, index) => Pw.Row(
                                children: [
                                  Pw.Expanded(
                                    flex: 3,
                                    child: Pw.Container(
                                      height: 25,
                                      alignment: Pw.Alignment.center,
                                      child: Pw.Text(
                                        "${Globals.addToCart[index].companyName}",
                                        style: const Pw.TextStyle(
                                          color: PdfColors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Pw.Expanded(
                                    flex: 2,
                                    child: Pw.Container(
                                      height: 25,
                                      alignment: Pw.Alignment.center,
                                      child: Pw.Text(
                                        "${Globals.addToCart[index].quentity}",
                                        style: const Pw.TextStyle(
                                          color: PdfColors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Pw.Expanded(
                                    flex: 2,
                                    child: Pw.Container(
                                      height: 25,
                                      alignment: Pw.Alignment.center,
                                      child: Pw.Text(
                                        "${Globals.addToCart[index].price}",
                                        style: const Pw.TextStyle(
                                          color: PdfColors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Pw.Expanded(
                                    flex: 2,
                                    child: Pw.Container(
                                      height: 25,
                                      alignment: Pw.Alignment.center,
                                      child: Pw.Text(
                                        "${Globals.addToCart[index].quePrice}",
                                        style: const Pw.TextStyle(
                                          color: PdfColors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                          itemCount: Globals.addToCart.length),
                      Pw.Padding(
                        padding: const Pw.EdgeInsets.only(
                          top: 50,
                          left: 300,
                        ),
                        child: Pw.Column(
                          children: [
                            Pw.Row(
                              children: [
                                Pw.Text(
                                  "TOTAL : ",
                                  style: const Pw.TextStyle(
                                    fontSize: 15,
                                    // fontWeight: Pw.FontWeight.bold,
                                  ),
                                ),
                                Pw.Text(
                                  Globals.calculateTotal(),
                                  style: const Pw.TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            Pw.Row(
                              children: [
                                Pw.Text(
                                  "TAX     : ",
                                  style: const Pw.TextStyle(
                                    fontSize: 15,
                                    // fontWeight: Pw.FontWeight.bold,
                                  ),
                                ),
                                Pw.Text(
                                  "${((double.parse(Globals.calculateTotal()) * 18) / 100)}",
                                  style: const Pw.TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            Pw.SizedBox(
                              height: 50,
                            ),
                            Pw.Text(
                              "TOTAL DUE",
                              style: Pw.TextStyle(
                                decoration: Pw.TextDecoration.underline,
                                fontSize: 17,
                                fontWeight: Pw.FontWeight.bold,
                              ),
                            ),
                            Pw.Text(
                              ((double.parse(Globals.calculateTotal())) +
                                      ((double.parse(Globals.calculateTotal()) *
                                              18) /
                                          100))
                                  .toStringAsFixed(2),
                              style: Pw.TextStyle(
                                fontSize: 15,
                                fontWeight: Pw.FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Pw.Expanded(
                  flex: 1,
                  child: Pw.Column(
                    mainAxisAlignment: Pw.MainAxisAlignment.spaceEvenly,
                    children: [
                      Pw.Row(
                        children: [
                          Pw.Text("Contact No : "),
                          Pw.Text("+91 9638319169"),
                        ],
                      ),
                      Pw.Row(
                        children: [
                          Pw.Text("Email Id : "),
                          Pw.Text("kevinmali0433@gmail.com"),
                        ],
                      ),
                      Pw.Row(
                        children: [
                          Pw.Text("www.kevinmali.com"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Page"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: (Globals.addToCart.isEmpty)
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.grey.shade500,
                    size: 250,
                  ),
                  const Text(
                    "You have no Item yet.",
                    style: TextStyle(fontSize: 25, color: Colors.grey),
                  )
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  flex: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemCount: Globals.addToCart.length,
                      itemBuilder: (context, i) {
                        return Card(
                          elevation: 2,
                          child: ListTile(
                            tileColor: Colors.grey.shade200,
                            leading: CircleAvatar(
                              backgroundColor: Colors.black12,
                              child: Image.asset(Globals.addToCart[i].pic1!),
                            ),
                            title: Text(
                              "${Globals.addToCart[i].companyName}",
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            subtitle: Text(
                              "${Globals.addToCart[i].price} * ${Globals.addToCart[i].quentity}",
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.cancel_outlined),
                              color: Colors.black,
                              onPressed: () {
                                setState(() {
                                  Globals.addToCart.removeAt(i);
                                });
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 8,
                      left: 15,
                      right: 15,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blueGrey,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 25,
                              top: 10,
                            ),
                            child: Column(
                              children: [
                                const Text(
                                  "Total price ",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  Globals.calculateTotal(),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              Uint8List data = await pdf.save();
                              await Printing.layoutPdf(
                                  onLayout: (format) => data);
                            },
                            child: Container(
                              height: 65,
                              width: 120,
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Pay",
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
