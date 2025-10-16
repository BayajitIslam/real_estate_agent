import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_string.dart';
import 'package:template/features/auth/widgets/custome_text_field.dart';
import 'package:template/features/home/widgets/increment_decrement_field.dart';

class AdditionalInformationAddSection extends StatefulWidget {
  final Function(Map<String, dynamic>)? onDataChanged;

  const AdditionalInformationAddSection({super.key, this.onDataChanged});

  @override
  State<AdditionalInformationAddSection> createState() =>
      _AdditionalInformationAddSectionState();
}

class _AdditionalInformationAddSectionState
    extends State<AdditionalInformationAddSection> {
  // Lists
  List<String> facilities = ['Garage'];
  List<String> energyCertificates = ['Garage'];
  List<String> uploadedFiles = ['Certification.pdf'];

  // Text controller
  final TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  // Notify parent of data changes
  void _notifyDataChanged() {
    widget.onDataChanged?.call({});
  }

  // Add facility
  void addFacility(String facility) {
    if (facility.isNotEmpty) {
      setState(() {
        facilities.add(facility);
      });
      _notifyDataChanged();
    }
  }

  // Remove facility
  void removeFacility(String facility) {
    setState(() {
      facilities.remove(facility);
    });
    _notifyDataChanged();
  }

  // Add energy certificate
  void addEnergyCertificate(String certificate) {
    if (certificate.isNotEmpty) {
      setState(() {
        energyCertificates.add(certificate);
      });
      _notifyDataChanged();
    }
  }

  // Remove energy certificate
  void removeEnergyCertificate(String certificate) {
    setState(() {
      energyCertificates.remove(certificate);
    });
    _notifyDataChanged();
  }

  // Upload file
  void uploadFile() {
    setState(() {
      uploadedFiles.add('New_file.pdf');
    });
    _notifyDataChanged();
  }

  // Remove file
  void removeFile(String file) {
    setState(() {
      uploadedFiles.remove(file);
    });
    _notifyDataChanged();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title
          Text(
            AppString.additonalInfo,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 20.sp,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            AppString.infoNecessaryTocreate,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 14.sp,
              color: AppColors.bodyTextv2,
            ),
          ),
          SizedBox(height: 16.h),

          // Area size & Living space
          Row(
            children: [
              Expanded(
                child: IncrementDecrementField(title: AppString.areaSize),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: IncrementDecrementField(title: AppString.livingSpace),
              ),
            ],
          ),

          SizedBox(height: 20.h),

          // Bedroom & Bathroom
          Row(
            children: [
              Expanded(
                child: IncrementDecrementField(title: AppString.bedroom),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: IncrementDecrementField(title: AppString.bathroom),
              ),
            ],
          ),

          SizedBox(height: 24.h),

          // Facilities
          Text(
            AppString.facilities,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 14.sp,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 12.h),
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: [
              ...facilities.map(
                (facility) => _buildDarkChip(
                  label: facility,
                  onDelete: () => removeFacility(facility),
                ),
              ),
              _buildAddButton(
                label: 'Add facilities',
                onTap: () => _showAddDialog(
                  'Add Facility',
                  (value) => addFacility(value),
                ),
              ),
            ],
          ),

          SizedBox(height: 24.h),

          // Energy certificate
          Text(
            AppString.energyCertificate,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 14.sp,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 12.h),
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: [
              ...energyCertificates.map(
                (certificate) => _buildDarkChip(
                  label: certificate,
                  onDelete: () => removeEnergyCertificate(certificate),
                ),
              ),
              _buildAddButton(
                label: 'Add more',
                onTap: () => _showAddDialog(
                  'Add Certificate',
                  (value) => addEnergyCertificate(value),
                ),
              ),
            ],
          ),

          SizedBox(height: 24.h),

          // Energy Rating & Consumption
          Row(
            children: [
              Expanded(
                child: IncrementDecrementField(
                  title: AppString.energyRating,
                  textfieldText: AppString.rating,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: IncrementDecrementField(
                  title: AppString.consumtion,
                  textfieldText: AppString.rating,
                ),
              ),
            ],
          ),

          SizedBox(height: 24.h),

          // Energy certificate files
          Text(
            AppString.energyCertificate,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 14.sp,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 12.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ...uploadedFiles.map(
                (file) => _buildFileChip(
                  label: file,
                  onDelete: () => removeFile(file),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          _buildAddButton(
            label: AppString.uploadMore,
            onTap: () => uploadFile(),
          ),

          SizedBox(height: 16.h),

          // Listing description
          Text(
            AppString.listingDescription,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 12.h),

          //description field
          CustomTextField(maxLines: 5, hintText: AppString.enterDescription),
        ],
      ),
    );
  }

  // Dark Chip
  Widget _buildDarkChip({
    required String label,
    required VoidCallback onDelete,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xFF272F33),
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: AppColors.black10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 13.sp,
              color: AppColors.whiteText,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: 8.w),
          GestureDetector(
            onTap: onDelete,
            child: const Icon(Icons.close, size: 18, color: Colors.white),
          ),
        ],
      ),
    );
  }

  // File Chip
  Widget _buildFileChip({
    required String label,
    required VoidCallback onDelete,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: AppColors.black10, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.insert_drive_file_outlined,
            size: 16,
            color: AppColors.black70,
          ),
          SizedBox(width: 8.w),
          Text(
            label,
            style: TextStyle(
              fontSize: 13.sp,
              color: AppColors.black70,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: 8.w),
          GestureDetector(
            onTap: onDelete,
            child: const Icon(Icons.close, size: 18, color: AppColors.black70),
          ),
        ],
      ),
    );
  }

  // Add Button
  Widget _buildAddButton({required String label, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(color: AppColors.black10, width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.add, size: 16, color: AppColors.black),
            SizedBox(width: 4.w),
            Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Show Add Dialog
  void _showAddDialog(String title, Function(String) onAdd) {
    final textController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: TextField(
          controller: textController,
          decoration: const InputDecoration(hintText: 'Enter value'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (textController.text.isNotEmpty) {
                onAdd(textController.text);
                Navigator.pop(context);
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
