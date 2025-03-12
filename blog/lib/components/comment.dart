import 'package:flutter/material.dart';

/// Widget for displaying and managing comments
class CommentSection extends StatefulWidget {
  final List<Map<String, dynamic>> commentsData;
  final Map<String, dynamic> currentUser;

  const CommentSection({
    super.key,
    required this.commentsData,
    required this.currentUser,
  });

  @override
  State<CommentSection> createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xFFEEF2F9), width: 1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCommentHeader(),
          const SizedBox(height: 20),
          _buildCommentInput(),
          const SizedBox(height: 30),
          ...widget.commentsData.map(
            (comment) => CommentItem(
              commentData: comment,
              onLike: () {
                setState(() {
                  comment['isLiked'] = !comment['isLiked'];
                  if (comment['isLiked']) {
                    comment['likes']++;
                  } else {
                    comment['likes']--;
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentHeader() {
    return Row(
      children: [
        const Text(
          'Comments',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0D253C),
            fontFamily: 'Avenir',
          ),
        ),
        const SizedBox(width: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFF2991D6).withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            '${widget.commentsData.length}',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2991D6),
              fontFamily: 'Avenir',
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCommentInput() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 40,
          height: 40,
          margin: const EdgeInsets.only(top: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: NetworkImage(widget.currentUser['profilePicture']),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: TextField(
            controller: _commentController,
            decoration: InputDecoration(
              hintText: 'Add a comment...',
              hintStyle: const TextStyle(
                color: Color(0xFF7B8BB2),
                fontFamily: 'Avenir',
              ),
              filled: true,
              fillColor: const Color(0xFFEEF2F9),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              suffixIcon: IconButton(
                icon: const Icon(Icons.send_rounded, color: Color(0xFF2991D6)),
                onPressed: () {
                  // Add comment functionality would go here
                  if (_commentController.text.isNotEmpty) {
                    setState(() {
                      widget.commentsData.insert(0, {
                        'id': 'c${widget.commentsData.length + 1}',
                        'profilePicture': widget.currentUser['profilePicture'],
                        'name': widget.currentUser['name'],
                        'time': 'Just now',
                        'content': _commentController.text,
                        'likes': 1,
                        'isLiked': true,
                      });
                      _commentController.clear();
                    });
                  }
                },
              ),
            ),
            minLines: 1,
            maxLines: 3,
          ),
        ),
      ],
    );
  }
}

/// Widget for displaying a single comment
class CommentItem extends StatelessWidget {
  final Map<String, dynamic> commentData;
  final VoidCallback onLike;

  const CommentItem({
    super.key,
    required this.commentData,
    required this.onLike,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(commentData['profilePicture']),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      commentData['name'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2D4379),
                        fontFamily: 'Avenir',
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      commentData['time'],
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF7B8BB2),
                        fontFamily: 'Avenir',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  commentData['content'],
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xFF2D4379),
                    fontFamily: 'Avenir',
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    GestureDetector(
                      onTap: onLike,
                      child: Row(
                        children: [
                          Icon(
                            commentData['isLiked']
                                ? Icons.favorite
                                : Icons.favorite_border,
                            size: 18,
                            color: const Color(0xFF2991D6),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${commentData['likes']}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF7B8BB2),
                              fontFamily: 'Avenir',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      'Reply',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2991D6),
                        fontFamily: 'Avenir',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
