import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomPageView extends StatefulWidget {
  @override
  _CustomPageViewState createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  final PageController _pageController = PageController();
  
  final List<String> imageUrls = [
    'https://via.placeholder.com/400x200/FF0000/FFFFFF?text=Image1',
    'https://via.placeholder.com/400x200/00FF00/FFFFFF?text=Image2',
    'https://via.placeholder.com/400x200/0000FF/FFFFFF?text=Image3',
    'https://via.placeholder.com/400x200/FF0000/FFFFFF?text=Image1',
    'https://via.placeholder.com/400x200/00FF00/FFFFFF?text=Image2',
    'https://via.placeholder.com/400x200/0000FF/FFFFFF?text=Image3',
  ];

  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    
    // Initial page setup to simulate infinite scrolling
    Future.delayed(Duration.zero, () {
      _pageController.jumpToPage(1000); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height*0.25,
          child: PageView.builder(
            
            controller: _pageController,
            itemCount: null, // No limit for infinite scrolling
            onPageChanged: (index) {
              setState(() {
                currentPage = index % imageUrls.length; // Wrap around using modulo
              });
            },
            itemBuilder: (context, index) {
              // Wrap around index to simulate infinite scrolling
              int currentIndex = index % imageUrls.length; 
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                // child: ClipRRect(
                //   borderRadius: BorderRadius.circular(10),
                //   child: Image.network(imageUrls[currentIndex], fit: BoxFit.cover, width: double.infinity),
                // ),
              );
            },
            pageSnapping: true,
          ),
        ),
        SizedBox(height: 10,),
        
        Container(
          height: MediaQuery.of(context).size.height*0.02,
          child: SmoothPageIndicator(
            controller: _pageController,
            count: imageUrls.length,
            effect: ExpandingDotsEffect(
              radius: 6, 
              dotWidth: 8, // Shrinks the side dots
              dotHeight: 8, // Shrinks the side dots
              spacing: 6, // Adjust space between dots
              dotColor: Colors.grey, // Color of the side dots
              activeDotColor: Colors.white, // Color of the active dot
            ),
          ),
        )

      ],
    );
  }
}
