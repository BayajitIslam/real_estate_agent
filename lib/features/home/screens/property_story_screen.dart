import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/constants/app_colors.dart';

class PropertyStoryScreen extends StatefulWidget {
  const PropertyStoryScreen({super.key});

  @override
  State<PropertyStoryScreen> createState() => _PropertyStoryScreenState();
}

class _PropertyStoryScreenState extends State<PropertyStoryScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  Timer? _storyTimer;
  Timer? _progressTimer;
  double _progressValue = 0.0;

  final List<Map<String, dynamic>> properties = [
    {
      'image': 'https://picsum.photos/1080/1920?image=1060',
      'price': '€692,000',
      'type': 'Apartment',
      'beds': 2,
      'baths': 3,
      'size': '822 sqft',
      'address': '3284 Skyview Lane, WA 98001',
    },
    {
      'image': 'https://picsum.photos/1080/1920?image=1055',
      'price': '€820,000',
      'type': 'Villa',
      'beds': 3,
      'baths': 4,
      'size': '1050 sqft',
      'address': '212 Ocean Ave, CA 90001',
    },
    {
      'image': 'https://picsum.photos/1080/1920?image=1045',
      'price': '€575,000',
      'type': 'Penthouse',
      'beds': 2,
      'baths': 2,
      'size': '950 sqft',
      'address': '54 Palm Drive, FL 33010',
    },
  ];

  @override
  void initState() {
    super.initState();
    _startStoryTimer();
    _startProgressTimer();
  }

  void _startStoryTimer() {
    _storyTimer = Timer.periodic(const Duration(seconds: 10), (timer) {
      if (_currentIndex < properties.length - 1) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        _pageController.jumpToPage(0);
      }
    });
  }

  void _startProgressTimer() {
    const totalDuration = 10;
    const tick = 0.1;
    _progressTimer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        _progressValue += tick / totalDuration;
        if (_progressValue >= 1.0) _progressValue = 0.0;
      });
    });
  }

  @override
  void dispose() {
    _storyTimer?.cancel();
    _progressTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final property = properties[_currentIndex];

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          /// 🔹 Background story image
          PageView.builder(
            controller: _pageController,
            itemCount: properties.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
                _progressValue = 0.0;
              });
            },
            itemBuilder: (context, index) {
              return Image.network(
                properties[index]['image'],
                fit: BoxFit.contain,
                width: double.infinity,
                height: double.infinity,
              );
            },
          ),

          /// 🔹 Gradient overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.black.withOpacity(0.6), Colors.transparent],
              ),
            ),
          ),

          /// 🔹 Top progress bars with fixed width
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 50.h),
              child: ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 350, maxWidth: 600),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: List.generate(properties.length, (index) {
                      return Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          height: 4,
                          child: Stack(
                            children: [
                              /// background bar
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),

                              /// active progress
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 100),
                                width: _getProgressWidth(index, context),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
          ),

          /// 🔹 Bottom info card with fixed width
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.all(20),
              padding: const EdgeInsets.only(bottom: 20),
              child: ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 350, maxWidth: 600),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 20,
                        offset: const Offset(0, -5),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Price + Type
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            property['price'],
                            style: Theme.of(context).textTheme.titleLarge!
                                .copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24.sp,
                                  color: AppColors.black,
                                ),
                          ),
                          Text(
                            property['type'],
                            style: Theme.of(context).textTheme.titleLarge!
                                .copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                  color: AppColors.black,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      /// Specs
                      Row(
                        children: [
                          const Icon(Icons.bed_outlined, size: 20),
                          const SizedBox(width: 4),
                          Text(
                            '${property['beds']}',
                            style: Theme.of(context).textTheme.titleLarge!
                                .copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                  color: AppColors.black,
                                ),
                          ),
                          const SizedBox(width: 12),
                          const Icon(Icons.bathtub_outlined, size: 20),
                          const SizedBox(width: 4),
                          Text(
                            '${property['baths']}',
                            style: Theme.of(context).textTheme.titleLarge!
                                .copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                  color: AppColors.black,
                                ),
                          ),
                          const SizedBox(width: 12),
                          const Icon(Icons.square_foot, size: 20),
                          const SizedBox(width: 4),
                          Text(
                            property['size'],
                            style: Theme.of(context).textTheme.titleLarge!
                                .copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                  color: AppColors.black,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),

                      /// Address
                      Text(
                        property['address'],
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          color: AppColors.black,
                        ),
                      ),

                      const SizedBox(height: 16),

                      /// Buttons
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: () {},
                              icon: const Icon(
                                Icons.message,
                                size: 18,
                                color: Colors.white,
                              ),
                              label: Text(
                                'Message',
                                style: Theme.of(context).textTheme.titleLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.sp,
                                      color: AppColors.whiteText,
                                    ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: () {},
                              icon: const Icon(
                                Icons.call,
                                size: 18,
                                color: Colors.white,
                              ),
                              label: Text(
                                'Call',
                                style: Theme.of(context).textTheme.titleLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.sp,
                                      color: AppColors.whiteText,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 🧮 Calculate progress width for each segment
  double _getProgressWidth(int index, BuildContext context) {
    final totalWidth =
        (MediaQuery.of(context).size.width - 40.w) / properties.length - 8.w;
    if (index < _currentIndex) return totalWidth;
    if (index > _currentIndex) return 0;
    return totalWidth * _progressValue;
  }
}
