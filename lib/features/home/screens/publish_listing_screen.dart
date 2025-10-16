import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_image_const.dart';
import 'package:template/core/constants/app_string.dart';
import 'package:template/features/auth/widgets/custome_checkbox.dart';
import 'package:template/features/auth/widgets/custome_text_field.dart';
import 'package:template/features/home/widgets/contact_information_card.dart';
import 'package:template/features/home/widgets/dotted_border_box.dart';
import 'package:template/features/home/widgets/additional_information_add_section.dart';
import 'package:template/features/widgets/circle_button_with_border.dart';

class PublishListingScreen extends StatefulWidget {
  const PublishListingScreen({super.key});

  @override
  State<PublishListingScreen> createState() => _PublishListingScreenState();
}

class _PublishListingScreenState extends State<PublishListingScreen> {
  @override
  Widget build(BuildContext context) {
    String selectedCode = '+1';
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        forceMaterialTransparency: true,
        leadingWidth: 70.w,
        leading: CircleButtonWithBorder(
          isIcon: true,
          icon: Icons.arrow_back,
          onTap: Get.back,
        ),
        title: Text(
          AppString.propertyDetails,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            fontSize: 16.sp,
            height: 1.2,
            letterSpacing: 0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(24),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //==================== Section Tile =====================
                  _sectionTitle(AppString.media),
                  Text(AppString.selectUpto9image, style: _hintStyle()),

                  //==================== Selected Image =====================
                  SizedBox(height: 16.h),
                  _mediaGrid(),

                  //==================== Upload Video =====================
                  SizedBox(height: 16.h),
                  _uploadButton(
                    AppImages.uploadVideo,
                    AppString.uploadVideo,
                    context,
                  ),
                  //==================== Upload Flore Plan =====================
                  SizedBox(height: 16.h),
                  _uploadButton(
                    AppImages.uploadFlorePlane,
                    AppString.uploadFloorplan,
                    context,
                  ),
                  //==================== Emebed 360 View =====================
                  SizedBox(height: 16.h),
                  _uploadButton(
                    AppImages.uploadEmled360View,
                    AppString.embed360View,
                    context,
                  ),

                  //==================== delet and Save To Draft &  Continue =================
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Delet Button
                      CircleAvatar(
                        radius: 22.r,
                        backgroundColor: AppColors.red10,
                        child: SvgPicture.asset(AppImages.deletIcon),
                      ),

                      //Save To Draft Button
                      SizedBox(width: 4.w),
                      Expanded(
                        flex: 1,
                        child: OutlinedButton(
                          onPressed: () {
                            //Save To Draft Button Function
                          },

                          style: OutlinedButton.styleFrom(
                            backgroundColor: Color(0xFF272F33),
                            minimumSize: Size(double.infinity, 44.h),
                            side: BorderSide(color: Colors.transparent),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(111.r),
                            ),
                          ),
                          child: Text(
                            AppString.saveToDraft,
                            style: TextStyle(
                              color: AppColors.whiteText,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      //Continue Button
                      SizedBox(width: 4.w),
                      Expanded(
                        flex: 1,
                        child: OutlinedButton(
                          onPressed: () {
                            //Continue Button Function
                          },

                          style: OutlinedButton.styleFrom(
                            backgroundColor: AppColors.buttonBgYellow,
                            minimumSize: Size(double.infinity, 44.h),
                            side: BorderSide(color: Colors.transparent),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(111.r),
                            ),
                          ),
                          child: Text(
                            AppString.continueText,
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),

            //KEY INFORAMTION
            Container(
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(24.r),
              ),
              padding: EdgeInsets.all(16.w),
              margin: EdgeInsets.only(top: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppString.keyInformation,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                  Text(
                    AppString.infoNecessaryTocreate,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 14.sp,
                      color: AppColors.bodyTextv2,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    AppString.address,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 14.sp,
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  //address Text Field
                  CustomTextField(hintText: AppString.yourAdress),

                  //address 2 Text Field
                  SizedBox(height: 16.h),
                  CustomTextField(hintText: AppString.yourAdressLine2),

                  //city & Zip Code Text Field
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      //City Text Field
                      Flexible(
                        flex: 1,
                        child: CustomTextField(hintText: AppString.city),
                      ),
                      //Zip Code Text Field
                      SizedBox(width: 8.w),
                      Flexible(
                        flex: 2,
                        child: CustomTextField(hintText: AppString.zipCode),
                      ),
                    ],
                  ),

                  //State & Select Country Text Field
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      //State Text Field
                      Flexible(
                        flex: 1,
                        child: CustomTextField(hintText: AppString.state),
                      ),
                      //Select Country Text Field
                      SizedBox(width: 8.w),
                      Flexible(
                        flex: 2,
                        child: CustomTextField(
                          hintText: AppString.selectCountry,
                          suffixIconEnable: true,
                        ),
                      ),
                    ],
                  ),

                  // sale pcice
                  SizedBox(height: 16.h),
                  Text(
                    AppString.salesPrice,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 14.sp,
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  //enter Price Textfield
                  SizedBox(height: 16.h),
                  CustomTextField(
                    hintText: AppString.enterPrice,
                    prefixIcon: Icons.euro_rounded,
                  ),

                  //Check Box is Listing OR Note
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      CustomCheckbox(value: true, onChanged: (value) {}),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Text(
                          AppString.thisListingIsOnLYThisPlatform,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                fontSize: 12.sp,
                                color: AppColors.black,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 12.h),

            //Additonal Information Section
            AdditionalInformationAddSection(),

            //Contact Informaton Here
            SizedBox(height: 16.h),
            Container(
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(16.r),
              ),
              padding: EdgeInsets.all(16.w),
              margin: EdgeInsets.only(top: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppString.contactInformation,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    AppString.infoNecessaryTocreate,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 14.sp,
                      color: AppColors.bodyTextv2,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    AppString.loggedinAs,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 16.sp,
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(height: 16.h),
                  ContactInformationCard(
                    avatar:
                        "https://i.pinimg.com/1200x/93/ae/42/93ae422ef2fe130437ad6eec339595d8.jpg",
                    username: "Guy Hawking",
                    phoneNumbe: "+1 234 567 788",
                    email: "user@gmail.com",
                  ),

                  //Check Box Autofill Inforamtion
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      CustomCheckbox(value: true, onChanged: (value) {}),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Text(
                          AppString.autoFillMyInformation,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                fontSize: 12.sp,
                                color: AppColors.black,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Conntry  Code
                          Text(
                            AppString.countryCode,
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  fontSize: 14.sp,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),

                          // country code dropdown
                          SizedBox(height: 16.h),
                          Container(
                            width: 118.w,
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 2.h,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.black10),
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: selectedCode,
                              underline: const SizedBox(),
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.grey,
                              ),
                              items: [
                                DropdownMenuItem(
                                  value: '+1',
                                  child: Text(
                                    '+1',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .copyWith(
                                          color: AppColors.bodyTextv1,
                                          letterSpacing: 0,
                                        ),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: '+11',
                                  child: Text(
                                    '+11',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .copyWith(
                                          color: AppColors.bodyTextv1,
                                          letterSpacing: 0,
                                        ),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: '+880',
                                  child: Text(
                                    '+880',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .copyWith(
                                          color: AppColors.bodyTextv1,
                                          letterSpacing: 0,
                                        ),
                                  ),
                                ),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  selectedCode = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //number field
                          Text(
                            AppString.phoneNumber,
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  fontSize: 14.sp,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),

                          //Number Field
                          SizedBox(height: 16.h),
                          SizedBox(
                            width: 185.w,
                            child: CustomTextField(
                              hintText: AppString.phoneNumber,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  //email
                  SizedBox(height: 16.h), //Conntry  Code
                  Text(
                    AppString.countryCode,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 14.sp,
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  //email field
                  SizedBox(height: 16.h),
                  CustomTextField(hintText: AppString.yourEmail),
                ],
              ),
            ),
            //
            SizedBox(height: 37.h),
          ],
        ),
      ),
    );
  }

  // Reusable widgets below
  Widget _sectionTitle(String title) => Padding(
    padding: EdgeInsets.only(bottom: 4.h),
    child: Text(
      title,
      style: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
    ),
  );

  TextStyle _hintStyle() =>
      TextStyle(fontSize: 14.sp, color: AppColors.bodyTextv2);

  Widget _mediaGrid() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 5 + 1,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 149 / 119,
      ),
      itemBuilder: (context, index) {
        if (index == 5) {
          return DottedBorderBox();
        }
        return GestureDetector(
          onTap: () {},
          child: Stack(
            children: [
              /// ---- Image ----
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.network(
                  'https://i.pinimg.com/736x/2d/97/1b/2d971b73ede32297efb13b7ef9c0e671.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 119.h,
                ),
              ),

              /// ---- Top-right button ----
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  width: 30.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.more_horiz_outlined,
                      color: AppColors.black,
                      size: 16.sp,
                    ),
                    onPressed: () {
                      // action
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  //upload Button
  Widget _uploadButton(String icon, String text, BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: AppColors.black10, width: 1),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        minimumSize: Size(0, 0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //icon
            SvgPicture.asset(icon),
            SizedBox(width: 8.w),
            //text
            Text(
              text,
              style: Theme.of(
                context,
              ).textTheme.labelMedium!.copyWith(color: AppColors.black),
            ),
          ],
        ),
      ),
    );
  }
}
