import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'model/Products.dart';

class Details extends StatefulWidget {
  Products products;
   Details({super.key, required this.products});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details>  with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation<double> _nextPage;
  PageController controller2 = PageController();
  int _current = 0;
  // final pages = List.generate(
  //     3,
  //         (index) =>);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
    new AnimationController(vsync: this, duration: Duration(seconds: 3));
    _nextPage = Tween(begin: 0.0, end: 1.0).animate(_animationController);

    //Add listener to AnimationController for know when end the count and change to the next page
    _animationController.addListener(() {
      if (_animationController.status == AnimationStatus.completed) {
        _animationController.reset(); //Reset the controller
        final int page = 4; //Number of pages in your PageView
        if (_current < page) {
          _current++;
          controller2.animateToPage(_current,
              duration: Duration(milliseconds: 300), curve: Curves.easeInSine);
        } else {
          _current = 0;
        }
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: Text("${widget.products.title}"),),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 180,
                  child: PageView.builder(
                    onPageChanged: (int i) {
                      _animationController.forward();
                    },
                    controller: controller2,
                     itemCount: widget.products.images!.length,
                    itemBuilder: (_, index) {
                      return  Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage("${widget.products.images![index]}"),
                              fit: BoxFit.fitHeight),
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.grey.shade300,
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              SmoothPageIndicator(
                controller: controller2,
                count: 3,
                axisDirection: Axis.horizontal,
                effect: WormEffect(),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "${widget.products.brand}",
                  style: GoogleFonts.poppins(
                    // textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: 14,fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      color: Color(0xff474444)),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(maxLines:2,
                  "${widget.products.title}",
                  style: GoogleFonts.poppins(
                    // textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: 14,fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      color: Color(0xff474444)),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "${widget.products.description}",
                  style: GoogleFonts.poppins(
                    // textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: 12,fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      color: Color(0xff474444)),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Gadgec Saver Price",
                  style: GoogleFonts.poppins(
                    // textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: 10,fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      color: Color(0xff1BBF00)),
                ),
              ),
              Container(

                child: Row(
                  children: [

                    Text(
                      "\u{20B9}13999",
                      style: GoogleFonts.poppins(
                        // textStyle: Theme.of(context).textTheme.displayLarge,
                          fontSize: 20,
                          decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          color: Color(0xff000000)),
                    ),
                    Expanded(child: SizedBox(width: 10,)),
                    Text(
                      "${widget.products.discountPercentage}%  ",
                      style: GoogleFonts.poppins(
                        // textStyle: Theme.of(context).textTheme.displayLarge,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          color: Color(0xff1bbf00)),
                    ),
                    SizedBox(width: 10,),
                    Text(
                      "\u{20B9}${widget.products.price}",
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
            ],),
            ),
        );
    }
}