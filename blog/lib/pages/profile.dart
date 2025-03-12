import 'package:flutter/material.dart';
import 'package:blog/components/profile_info_card.dart';
import 'package:blog/components/blog_card_list_item.dart';
import 'package:blog/components/blog_card_grid_item.dart';

List<PopupMenuEntry> ownerMenuItems = [
  PopupMenuItem(
    value: 'edit',
    child: Row(
      children: const [
        Icon(Icons.edit, color: Colors.blue),
        SizedBox(width: 8),
        Text(
          'Edit Profile',
          style: TextStyle(color: Colors.blue, fontFamily: 'Avenir'),
        ),
      ],
    ),
  ),
  PopupMenuItem(
    value: 'settings',
    child: Row(
      children: const [
        Icon(Icons.settings, color: Colors.grey),
        SizedBox(width: 8),
        Text(
          'Settings',
          style: TextStyle(color: Colors.grey, fontFamily: 'Avenir'),
        ),
      ],
    ),
  ),
];

/// Menu items for blog visitors (report option)
List<PopupMenuEntry> visitorMenuItems = [
  PopupMenuItem(
    value: 'report',
    child: Row(
      children: const [
        Icon(Icons.report_problem, color: Colors.orange),
        SizedBox(width: 8),
        Text(
          'Report',
          style: TextStyle(color: Colors.orange, fontFamily: 'Avenir'),
        ),
      ],
    ),
  ),
];

List<PopupMenuEntry> getMenuItems(bool isOwner) {
  return isOwner ? ownerMenuItems : visitorMenuItems;
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isEditing = false;
  bool isOwner = false;
  bool isGridView = false;
  final Map<String, dynamic> user = {
    'name': 'John Doe',
    'userTag': '@johndoe',
    'role': 'Flutter Developer',
    'aboutMe':
        'Engineering Manager at Acme Corp. Leading teams to build impactful products.',

    'totalPosts': 42,
    'following': 256,
    'followers': 1024,
    'totalLikes': 4200,
    'image': 'https://picsum.photos/1200',
  };

  List<Map<String, dynamic>> posts = [
    {
      'id': '1',
      'title': 'Getting Started with Flutter',
      'clickbaitTitle': 'You Won\'t Believe How Easy Flutter Development Is!',
      'content':
          'Flutter is Google\'s UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase...',
      'imageUrl': 'https://picsum.photos/800/400',
      'likes': 423,
      'date': DateTime.now().subtract(Duration(days: 1)).millisecondsSinceEpoch,
      'isSaved': false,
      'isLiked': false,
    },
    {
      'id': '2',
      'title': 'State Management in Flutter',
      'clickbaitTitle':
          'This One Trick Will Transform Your Flutter State Management!',
      'content':
          'One of the most important aspects of any Flutter application is state management. There are several approaches to handle state...',
      'imageUrl': 'https://picsum.photos/800/401',
      'likes': 567,
      'date': DateTime.now().subtract(Duration(days: 2)).millisecondsSinceEpoch,
      'isSaved': true,
      'isLiked': true,
    },
    {
      'id': '3',
      'title': 'Building Custom Widgets',
      'clickbaitTitle': 'Master Flutter Custom Widgets in Just 10 Minutes!',
      'content':
          'Creating reusable custom widgets is a fundamental skill for any Flutter developer. Today we\'ll explore best practices...',
      'imageUrl': 'https://picsum.photos/800/402',
      'likes': 289,
      'date': DateTime.now().subtract(Duration(days: 3)).millisecondsSinceEpoch,
      'isSaved': false,
      'isLiked': false,
    },
    {
      'id': '4',
      'title': 'Advanced Animation Techniques',
      'clickbaitTitle':
          'Create Mind-Blowing Flutter Animations With These Secret Tips!',
      'content':
          'Animations can bring your Flutter app to life. In this post, well explore complex animations using AnimationController and custom Tweens...',
      'imageUrl': 'https://picsum.photos/800/403',
      'likes': 678,
      'date': DateTime.now().subtract(Duration(days: 4)).millisecondsSinceEpoch,
      'isSaved': true,
      'isLiked': true,
    },
    {
      'id': '5',
      'title': 'Optimizing Flutter Performance',
      'clickbaitTitle':
          'Make Your Flutter App Lightning Fast With These Hacks!',
      'content':
          'Performance is crucial for a great user experience. Learn how to profile and optimize your Flutter applications for smooth animations and fast load times...',
      'imageUrl': 'https://picsum.photos/800/404',
      'likes': 445,
      'date': DateTime.now().subtract(Duration(days: 5)).millisecondsSinceEpoch,
      'isSaved': false,
      'isLiked': false,
    },
    {
      'id': '6',
      'title': 'Testing Flutter Applications',
      'clickbaitTitle':
          'Never Write Buggy Flutter Code Again With This Testing Guide!',
      'content':
          'Testing is an essential part of app development. Today wll cover unit tests, widget tests, and integration tests in Flutter...',
      'imageUrl': 'https://picsum.photos/800/405',
      'likes': 334,
      'date': DateTime.now().subtract(Duration(days: 6)).millisecondsSinceEpoch,
      'isSaved': false,
      'isLiked': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [_buildAppBar(), SliverToBoxAdapter(child: _buildPosts())],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      floating: false,
      pinned: true,
      backgroundColor: Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          children: [_buildTopBar(), ProfileInfoCard(user: user)],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(35, 80, 35, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.arrow_back_ios_new_outlined, size: 32),
          const Text(
            'Profile',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0D253C),
            ),
          ),
          PopupMenuButton(
            icon: const Icon(Icons.more_vert, size: 32),
            itemBuilder: (context) => getMenuItems(isOwner),
            onSelected: (value) {
              if (value == 'edit') {
                setState(() {
                  isEditing = !isEditing;
                });
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPosts() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Colors.white,
        border: Border.all(color: Colors.grey, width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  'My Posts',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D4379),
                    fontFamily: 'Avenir',
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed:
                      !isGridView
                          ? null
                          : () {
                            setState(() {
                              isGridView = false;
                            });
                          },
                  icon: Icon(
                    Icons.format_list_bulleted_outlined,
                    size: 32,
                    color: !isGridView ? Color(0xFF2991D6) : Color(0xFF7B8BB2),
                  ),
                ),
                SizedBox(width: 16),
                IconButton(
                  onPressed:
                      isGridView
                          ? null
                          : () {
                            setState(() {
                              isGridView = true;
                            });
                          },
                  icon: Icon(
                    Icons.grid_view_outlined,
                    size: 32,
                    color: isGridView ? Color(0xFF2991D6) : Color(0xFF7B8BB2),
                  ),
                ),
              ],
            ),
            if (isGridView)
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio:
                      MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 1.2),
                ),
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return BlogCardGridItem(
                    image: posts[index]['imageUrl'],
                    title: posts[index]['title'],
                    description: posts[index]['clickbaitTitle'],
                    likes: posts[index]['likes'],
                    time: posts[index]['date'],
                    isSaved: posts[index]['isSaved'],
                    isLiked: posts[index]['isLiked'],
                  );
                },
              )
            else
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: posts.length,
                separatorBuilder: (context, index) => SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return BlogCardListItem(
                    image: post['imageUrl'],
                    title: post['title'],
                    description: post['clickbaitTitle'],
                    likes: post['likes'],
                    time: post['date'],
                    isSaved: post['isSaved'],
                    isLiked: post['isLiked'],
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
