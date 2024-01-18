import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartproject/web/productprovider.dart';
import 'package:provider/provider.dart';

import 'details.dart';
import 'model/Products.dart';

class CatItemList extends StatefulWidget {
  late String name;
  CatItemList({super.key, required this.name});

  @override
  State<CatItemList> createState() => _CatItemListState();
}

class _CatItemListState extends State<CatItemList> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text("${widget.name}"),
        ),
        body:  SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: Consumer<ProductProvider>(
                        builder: (context, providerobj, child) {
                          return  GridView.builder(
                            shrinkWrap: true,

                            itemCount: providerobj.plist.length??0,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: 250,
                                crossAxisSpacing: 4.0,
                                mainAxisSpacing:4.0),
                            itemBuilder: (BuildContext context, int index) {
                              Products p=providerobj.plist[index];
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
                ),
              ],
            ),
            ),
        );
    }
}