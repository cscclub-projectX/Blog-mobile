import 'package:flutter/material.dart';
import '../components/story_card.dart';
import '../components/category_card.dart';
import '../components/blog_card_list_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username = 'Malek';
  bool notification = false;
  int _selectedIndex = 0;
  final List<Map<String, IconData>> _navigationItems = [
    {'icon': Icons.home_outlined},
    {'icon': Icons.search_outlined},
    {'icon': Icons.add_box_outlined},
    {'icon': Icons.bookmark_border_outlined},
    {'icon': Icons.person_outline_outlined},
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Map<String, dynamic>> storyData = [
    {'image': 'https://picsum.photos/100', 'title': 'Story 1', 'viewed': false},
    {'image': 'https://picsum.photos/200', 'title': 'Story 2', 'viewed': false},
    {'image': 'https://picsum.photos/200', 'title': 'Story 3', 'viewed': true},
    {'image': 'https://picsum.photos/200', 'title': 'Story 4', 'viewed': true},
    {'image': 'https://picsum.photos/200', 'title': 'Story 5', 'viewed': true},
    {'image': 'https://picsum.photos/200', 'title': 'Story 6', 'viewed': true},
  ];
  final List<Map<String, dynamic>> categoryData = [
    {'image': 'https://picsum.photos/600', 'title': 'Category 1'},
    {'image': 'https://picsum.photos/600', 'title': 'Category 2'},
    {'image': 'https://picsum.photos/600', 'title': 'Category 3'},
  ];

  final List<Map<String, dynamic>> latestNewsData = [
    {
      'image': 'https://picsum.photos/300',
      'title': 'Flutter 3.0 Release',
      'clickbaitTitle': '10 Mind-Blowing Features in Flutter 3.0 That Will Change Everything!',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'likes': 423,
      'time': DateTime.now().subtract(Duration(hours: 2)),
      'isSaved': false,
      'isLiked': false,
    },
    {
      'image': 'https://picsum.photos/300', 
      'title': 'State Management Guide',
      'clickbaitTitle': 'This One Weird Trick Will Make Your Flutter State Management 10x Better!',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'likes': 567,
      'time': DateTime.now().subtract(Duration(hours: 4)),
      'isSaved': true,
      'isLiked': true,
    },
    {
      'image': 'https://picsum.photos/300',
      'title': 'Flutter Web Updates',
      'clickbaitTitle': 'You Won\'t Believe How Fast Flutter Web Has Become!',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'likes': 289,
      'time': DateTime.now().subtract(Duration(hours: 6)),
      'isSaved': false,
      'isLiked': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/background.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: CustomScrollView(
              physics: ClampingScrollPhysics(),
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(35, 70, 35, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Hi, $username!',
                                style: TextStyle(
                                  color: Color(0xFF2D4379),
                                  fontSize: 22,
                                  fontFamily: 'Roboto',
                                ),
                              ),

                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 0,
                                      blurRadius: 10,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Image.asset(
                                  notification
                                      ? 'lib/assets/notification-Badged.png'
                                      : 'lib/assets/notification-Unbadged.png',
                                  width: notification ? 32 : 24,
                                  height: notification ? 32 : 24,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 35, bottom: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Explore today\'s',
                            style: TextStyle(
                              color: Color(0xFF0D253C),
                              fontSize: 26,
                              fontFamily: 'Afacad',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 120,
                        child: AnimatedList(
                          key: GlobalKey<AnimatedListState>(),
                          scrollDirection: Axis.horizontal,
                          initialItemCount: storyData.length + 2,
                          itemBuilder: (context, index, animation) {
                            if (index == 0) {
                              return SizedBox(
                                width: 35,
                              ); // Left padding SizedBox
                            }
                            if (index == storyData.length + 1) {
                              return SizedBox(
                                width: 35,
                              ); // Right padding SizedBox
                            }

                            final storyIndex = index - 1;

                            return SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(1, 0),
                                end: Offset.zero,
                              ).animate(
                                CurvedAnimation(
                                  parent: animation,
                                  curve: Curves.easeOut,
                                ),
                              ),
                              child: StoryCard(
                                image: storyData[storyIndex]['image'] as String,
                                title: storyData[storyIndex]['title'] as String,
                                viewed: storyData[storyIndex]['viewed'] as bool,
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: 40),

                      SizedBox(
                        height: 370,
                        child: AnimatedList(
                          key: GlobalKey<AnimatedListState>(),
                          scrollDirection: Axis.horizontal,
                          initialItemCount: categoryData.length + 2,
                          itemBuilder: (context, index, animation) {
                            if (index == 0) {
                              return SizedBox(
                                width: 35,
                              ); // Left padding SizedBox
                            }
                            if (index == categoryData.length + 1) {
                              return SizedBox(
                                width: 35,
                              ); // Right padding SizedBox
                            }

                            final categoryIndex = index - 1;
                            final isEven = categoryIndex % 2 == 0;

                            return SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(1, 0),
                                end: Offset.zero,
                              ).animate(
                                CurvedAnimation(
                                  parent: animation,
                                  curve: Curves.easeOut,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: CategoryCard(
                                    image:
                                        categoryData[categoryIndex]['image']
                                            as String,
                                    title:
                                        categoryData[categoryIndex]['title']
                                            as String,
                                    isEven: isEven,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(
                          left: 35,
                          right: 35,
                          bottom: 10,
                          top: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Latest news',
                              style: TextStyle(
                                fontFamily: 'Avenir',
                                fontSize: 24,
                                color: Color(0xFF0D253C),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                //TODO: Handle click event
                              },
                              child: Text(
                                'More',
                                style: TextStyle(
                                  fontFamily: 'Avenir',
                                  fontSize: 18,
                                  color: Color(0xFF49B0E2),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 35, right: 35),
                        child: Column(
                          children: [
                            ...List.generate(
                              latestNewsData.length,
                              (index) => Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: BlogCardListItem(
                                  image: latestNewsData[index]['image'],
                                  title: latestNewsData[index]['title'],
                                  description: latestNewsData[index]['clickbaitTitle'],
                                  likes: 100,
                                  time: 10,
                                  isSaved: false,
                                  isLiked: latestNewsData[index]['isLiked'],
                                ),
                              ),
                            ),
                            SizedBox(height: 100),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 40,
            left: 25,
            right: 25,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  _navigationItems.length,
                  (index) => InkWell(
                    onTap: () => _onItemTapped(index),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          _navigationItems[index]['icon'] as IconData,
                          color:
                              _selectedIndex == index
                                  ? Color(0xFF376AED)
                                  : Color(0xFF7B8BB2),
                          size: 32,
                        ),
                        SizedBox(height: 4),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
