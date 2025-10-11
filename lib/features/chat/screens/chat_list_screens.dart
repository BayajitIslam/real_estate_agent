import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_string.dart';
import 'package:template/features/chat/models/chat_model.dart';
import 'package:template/features/chat/widgets/chat_list_tile.dart';
import 'package:template/features/widgets/custom_search_bar.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chats = _getSampleChats();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text(
          AppString.chat,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: EdgeInsets.all(16.w),
            child: CustomSearchBar(
              hintText: AppString.searchYourChat,
              onChanged: (_) {
                //<===================== Search Function ====================>
              },
            ),
          ),

          // Chat List
          Expanded(
            child: ListView(
              children: [
                _buildDateHeader('Today'),
                ...chats
                    .where((c) => c.time.contains('Today'))
                    .map((chat) => ChatListTile(chat: chat)),
                _buildDateHeader('Yesterday'),
                ...chats
                    .where((c) => c.time.contains('Yesterday'))
                    .map((chat) => ChatListTile(chat: chat)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateHeader(String date) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      child: Text(
        date,
        style: TextStyle(
          color: AppColors.black,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  List<ChatModel> _getSampleChats() {
    return [
      ChatModel(
        id: '1',
        name: 'Jessica Jones',
        avatar: 'https://i.pravatar.cc/150?img=1',
        lastMessage: 'Great plan! The price is slightly nego...',
        time: 'Today',
        isOnline: true,
      ),
      ChatModel(
        id: '2',
        name: 'Guy Hawkins',
        avatar: 'https://i.pravatar.cc/150?img=2',
        lastMessage: 'this place looks beautiful! Is it still av...',
        time: 'Today',
      ),
      ChatModel(
        id: '3',
        name: 'Cody Fisher',
        avatar: 'https://i.pravatar.cc/150?img=3',
        lastMessage: 'this place looks beautiful! Is it still av...',
        time: 'Today',
      ),
      ChatModel(
        id: '4',
        name: 'Arlene McCoy',
        avatar: 'https://i.pravatar.cc/150?img=4',
        lastMessage: 'this place looks beautiful! Is it still av...',
        time: 'Today',
      ),
      ChatModel(
        id: '5',
        name: 'Bessie Cooper',
        avatar: 'https://i.pravatar.cc/150?img=5',
        lastMessage: 'this place looks beautiful! Is it still av...',
        time: 'Yesterday',
      ),
      ChatModel(
        id: '6',
        name: 'Kristin Watson',
        avatar: 'https://i.pravatar.cc/150?img=6',
        lastMessage: 'this place looks beautiful! Is it still av...',
        time: 'Yesterday',
      ),
    ];
  }
}
