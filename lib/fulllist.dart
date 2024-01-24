import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartproject/seaarch/search.dart';
import 'package:provider/provider.dart';

import 'details.dart';
import 'model/Products.dart';

class FullList extends StatefulWidget {
  late String name;
  FullList({super.key, required this.name});

  @override
  State<FullList> createState() => _FullListState();
}

class _FullListState extends State<FullList> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text("${widget.name}"),
        ),
        body:  SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 86,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Container(
                          height: 86,
                          width: 50,
                          child: Column(
                            children: [
                              Container(
                                height: 58,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: AssetImage("assets/images/cat.png"),
                                        fit: BoxFit.cover)),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Laptop",
                                  style: GoogleFonts.poppins(
                                    // textStyle: Theme.of(context).textTheme.displayLarge,
                                      fontSize: 10,
                                      fontStyle: FontStyle.normal,
                                      color: Color(0xff494949)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: 24,
                      );
                    },
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                    height: MediaQuery.of(context).size.height,
                    child:Consumer<ProductProvider>(
                      builder: (context, providerobj, child) {
                        return  GridView.builder(
                          shrinkWrap: true,

                          itemCount: providerobj.products.length??0,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 250,
                              crossAxisSpacing: 4.0,
                              mainAxisSpacing:4.0),
                          itemBuilder: (BuildContext context, int index) {
                            Products p=providerobj.products[index];
                            return InkWell(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>  Details(products:p)),
                                );
                              },
                              child: Container(

                                height: 248,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left:10,
                                      right: 10,
                                      top: 10,
                                      child: Container(height: 156,
                                        width: 135,

                                        child: Image.network('${p.images![0]}',fit: BoxFit.fill, scale: 1.0),
                                      ),
                                    ),
                                    Positioned(top: 176,
                                        right: 0,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(4),
                                            color:Colors.greenAccent,
                                          ),
                                          height: 17,
                                          width: 35,
                                          child: Center(
                                            child: Text('${p.rating}',style: TextStyle(
                                                fontSize: 11,
                                                color: Colors.white
                                            ),),
                                          ),)),
                                    Positioned(top: 191,
                                        left: 10,
                                        child: Container(

                                          child:  Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 156,
                                                child: Text(
                                                  textAlign:TextAlign.start,
                                                  '${p.title}',
                                                  style: GoogleFonts.poppins(
                                                    // textStyle: Theme.of(context).textTheme.displayLarge,
                                                      fontSize: 10,
                                                      fontWeight: FontWeight.w700,
                                                      fontStyle: FontStyle.normal,
                                                      color: Color(0xff494949)),
                                                ),
                                              ),
                                              Container(
                                                width: 156,
                                                child: Text(maxLines:1,
                                                  '${p.description}',
                                                  style: GoogleFonts.poppins(
                                                    // textStyle: Theme.of(context).textTheme.displayLarge,
                                                      fontSize: 11,
                                                      fontWeight: FontWeight.w700,
                                                      fontStyle: FontStyle.normal,
                                                      color: Color(0xff494949)),
                                                ),
                                              ),
                                              Container(
                                                width: 156,
                                                child: Text(
                                                  "6 GB RAM",
                                                  style: GoogleFonts.poppins(
                                                    // textStyle: Theme.of(context).textTheme.displayLarge,
                                                      fontSize: 10,
                                                      fontWeight: FontWeight.w700,
                                                      fontStyle: FontStyle.normal,
                                                      color: Color(0xff494949)),
                                                ),
                                              ),
                                              Container(
                                                width: 156,
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      '${p.discountPercentage}% OFF ',
                                                      style: GoogleFonts.poppins(
                                                        // textStyle: Theme.of(context).textTheme.displayLarge,
                                                          fontSize: 10,
                                                          fontWeight: FontWeight.w700,
                                                          fontStyle: FontStyle.normal,
                                                          color: Color(0xff1bbf00)),
                                                    ),
                                                    Text(
                                                      "\u{20B9}${p.price}",
                                                      style: GoogleFonts.poppins(
                                                        // textStyle: Theme.of(context).textTheme.displayLarge,
                                                          fontSize: 10,
                                                          decoration: TextDecoration.lineThrough,
                                                          fontWeight: FontWeight.w700,
                                                          fontStyle: FontStyle.normal,
                                                          color: Color(0xff000000)),
                                                    ),
                                                    Expanded(child: SizedBox(width: 10,)),
                                                    Text(
                                                      "\u{20B9}${p.price}",
                                                      style: GoogleFonts.poppins(
                                                        // textStyle: Theme.of(context).textTheme.displayLarge,
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.w700,
                                                          fontStyle: FontStyle.normal,
                                                          color: Color(0xff000000)),
                                                    ),
                                                    SizedBox(width: 5,)
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(4),
                                                      color:Colors.greenAccent,
                                                    ),
                                                    height: 17,
                                                    width: 35,
                                                    child: Center(
                                                      child: Text('${p.rating}',style: TextStyle(
                                                          fontSize: 11,
                                                          color: Colors.white
                                                      ),),
                                                    ),),
                                                  Text(
                                                    " Rating",
                                                    style: GoogleFonts.poppins(
                                                      // textStyle: Theme.of(context).textTheme.displayLarge,
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w400,
                                                        fontStyle: FontStyle.normal,
                                                        color: Color(0xff47444)),
                                                  ),
                                                ],
                                              )
                                            ],
                                          )

                                          ,))
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    )),
              ],
            ),
            ),
        );
    }
}