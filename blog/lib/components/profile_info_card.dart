import 'package:flutter/material.dart';
import 'package:blog/components/profile_pic_card.dart';
import 'package:blog/utils/converters.dart';

class ProfileInfoCard extends StatelessWidget {
  final Map<String, dynamic> user;

  const ProfileInfoCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(35, 35, 35, 55),
          margin: const EdgeInsets.fromLTRB(35, 20, 35, 0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                spreadRadius: 2,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProfilePicCard(image: user['image']),
                  SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        user['name'],
                        style: TextStyle(
                          color: Color(0xFF0D253C),
                          fontFamily: 'Avenir',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        user['userTag'],
                        style: TextStyle(
                          color: Color(0xFF2D4379),
                          fontFamily: 'Avenir',
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        user['role'],
                        style: TextStyle(
                          color: Color(0xFF2991D6),
                          fontFamily: 'Avenir',
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "About Me",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0D253C),
                    fontFamily: 'Avenir',
                  ),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  user['aboutMe'],
                  style: TextStyle(
                    color: Color(0xFF2D4379),
                    fontFamily: 'Avenir',
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: -45,
          left: 0,
          right: 0,
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.fromLTRB(65, 0, 65, 0),
            height: 90,
            decoration: BoxDecoration(
              color: Color(0xFF2991D6),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.8),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatColumn('Posts', user['totalPosts']),
                _buildStatColumn('Likes', user['totalLikes']),
                _buildStatColumn('Followers', user['followers']),
                _buildStatColumn('Following', user['following']),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatColumn(String label, int value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          NumberConverter.formatNumber(value),
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Avenir',
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.white,
            fontFamily: 'Avenir',
          ),
        ),
      ],
    );
  }
}
