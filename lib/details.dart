import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Details extends StatefulWidget {
  const Details({super.key, required String name});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details>  with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation<double> _nextPage;
  PageController controller2 = PageController();
  int _current = 0;
  final pages = List.generate(
      3,
          (index) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/carosil.png"),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey.shade300,
        ),
      ));
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
        appBar: AppBar(),
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
                    // itemCount: pages.length,
                    itemBuilder: (_, index) {
                      return pages[index % pages.length];
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
                  "Lenovo",
                  style: GoogleFonts.poppins(
                    // textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: 14,fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      color: Color(0xff474444)),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Lenovo Legion 5 Pro AMD Ryzen 7 Octa Core \n5800H",
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
                  "(32 GB/1 TB SSD/Windows 11 Home/8 GB Graphics/\nNVIDIA GeForce RTX 3070) 16ACH6H Gaming Laptop \n(16 Inch, Storm Grey (Top), Black (Bottom), 2.45 Kg, \nWith MS Office)",
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
                      "\u{20B9}1399",
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
                      "-45 %  ",
                      style: GoogleFonts.poppins(
                        // textStyle: Theme.of(context).textTheme.displayLarge,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          color: Color(0xff1bbf00)),
                    ),
                    SizedBox(width: 10,),
                    Text(
                      "\u{20B9}7499",
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