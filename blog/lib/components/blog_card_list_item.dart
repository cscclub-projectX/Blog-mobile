import 'package:flutter/material.dart';
import '../utils/converters.dart';

class BlogCardListItem extends StatefulWidget {
  BlogCardListItem({
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
  State<BlogCardListItem> createState() => _BlogCardListItemState();
}

class _BlogCardListItemState extends State<BlogCardListItem> {
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
      height: 160,

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
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.network(
              widget.image,
              fit: BoxFit.fill,
              width: 105,
              height: double.maxFinite,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    maxLines: 2,
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 18,
                      color: Color(0xFF49B0E2),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    widget.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Avenir',
                      fontSize: 14,
                      color: Color(0xFF0D253C),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
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
                      Row(
                        children: [
                          Icon(
                            Icons.watch_later_outlined,
                            size: 24,
                            color: Color(0xFF0D253C),
                          ),
                          SizedBox(width: 4),
                          Text(TimeConverter.getTimeAgo(widget.time)),
                        ],
                      ),
                      IconButton(
                        icon: Icon(
                          _isSaved ? Icons.bookmark : Icons.bookmark_outline,
                          size: 24,
                          color:
                              _isSaved ? Color(0xFF2991D6) : Color(0xFF0D253C),
                        ),
                        onPressed: () {
                          setState(() {
                            _isSaved = !_isSaved;
                          });
                        },
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
