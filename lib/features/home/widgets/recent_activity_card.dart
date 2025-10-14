import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_string.dart';

class RecentActivityCard extends StatefulWidget {
  const RecentActivityCard({super.key});

  @override
  State<RecentActivityCard> createState() => _RecentActivityCardState();
}

class _RecentActivityCardState extends State<RecentActivityCard> {
  bool isExpanded = false; // show more / less state
  final int initialCount = 4;
  final int expandedCount = 8;

  @override
  Widget build(BuildContext context) {
    // Decide how many items to show
    if (sampleActivities.isEmpty) return const SizedBox();

    int visibleCount = sampleActivities.length <= 4
        ? sampleActivities.length
        : (isExpanded ? sampleActivities.length : 4);

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.cardBackground,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        //TEXT ACTIVITY
        children: [
          Text(
            AppString.activity,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 16.h),

          //LISTVIEW RECENT ACTIVITY
          Container(
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 8),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: visibleCount,
              itemBuilder: (context, index) {
                //get individula data
                final data = sampleActivities[index];
                return _activityIndividualCard(
                  data["avatar"]!,
                  data["name"],
                  data["action"],
                  data["time"],
                );
              },
            ),
          ),

          // View More / Show Less Button
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: Text(
                isExpanded ? AppString.showLess : AppString.readMore,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//
Widget _activityIndividualCard(String avatar, name, action, time) {
  return ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 8),
    leading: CircleAvatar(backgroundImage: NetworkImage(avatar)),
    title: Text(
      "$name $action",
      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp),
    ),
    subtitle: Text(
      time,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: AppColors.bodyTextv2,
      ),
    ),
  );
}

final List<Map<String, String>> sampleActivities = [
  {
    "name": "Anna Lopez",
    "action": "viewed this listing",
    "time": "2 hours ago",
    "avatar":
        "https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?cs=srgb&dl=pexels-sulimansallehi-1704488.jpg&fm=jpg",
  },
  {
    "name": "John Doe",
    "action": "saved this listin",
    "time": "3 hours ago",
    "avatar":
        "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?cs=srgb&dl=pexels-pixabay-614810.jpg&fm=jpg",
  },
  {
    "name": "Maria Smith",
    "action": "contacted the seller listing",
    "time": "5 hours ago",
    "avatar":
        "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?cs=srgb&dl=pexels-pixabay-415829.jpg&fm=jpg",
  },
  {
    "name": "David Johnson",
    "action": "shared this via email listing",
    "time": "1 day ago",
    "avatar":
        "https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?cs=srgb&dl=pexels-marcelo-chagas-2379004.jpg&fm=jpg",
  },
];
