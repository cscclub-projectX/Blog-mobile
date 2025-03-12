import 'package:flutter/material.dart';
import '../utils/converters.dart';

class BlogCardGridItem extends StatefulWidget {
  BlogCardGridItem({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.likes,
    required this.isLiked,
    required this.time,
    required this.isSaved,
  });

  final String image;
  final String title;
  final String description;
  final int likes;
  final bool isLiked;
  final int time;
  final bool isSaved;

  @override
  State<BlogCardGridItem> createState() => _BlogCardGridItemState();
}

class _BlogCardGridItemState extends State<BlogCardGridItem> {
  late int _likes;
  late bool _isLiked;
  late bool _isSaved;

  @override
  void initState() {
    super.initState();
    _likes = widget.likes;
    _isLiked = widget.isLiked;
    _isSaved = widget.isSaved;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.8),
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.network(widget.image, fit: BoxFit.fill, height: 160),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.title,
                    maxLines: 2,
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 16,
                      color: Color(0xFF49B0E2),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _likes++;
                                _isLiked = !_isLiked;
                              });
                            },
                            icon: Icon(
                              _isLiked
                                  ? Icons.favorite
                                  : Icons.favorite_outline_outlined,
                              size: 24,
                              color:
                                  _isLiked
                                      ? Color(0xFF2991D6)
                                      : Color(0xFF0D253C),
                            ),
                          ),
                          Text(NumberConverter.formatNumber(_likes)),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.watch_later_outlined,
                              size: 24,
                              color: Color(0xFF0D253C),
                            ),
                          ),
                          Text(TimeConverter.getTimeAgo(widget.time)),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            icon: Icon(
                              _isSaved
                                  ? Icons.bookmark
                                  : Icons.bookmark_outline,
                              size: 24,
                              color:
                                  _isSaved
                                      ? Color(0xFF2991D6)
                                      : Color(0xFF0D253C),
                            ),
                            onPressed: () {
                              setState(() {
                                _isSaved = !_isSaved;
                              });
                            },
                          ),
                          Text(""), // Empty text to maintain consistent height
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
