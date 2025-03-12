import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown_toolbar/markdown_toolbar.dart';
import 'comment.dart';

/// Widget for displaying blog content in view mode
class BlogContentView extends StatelessWidget {
  final Map<String, dynamic> blogData;

  const BlogContentView({super.key, required this.blogData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.8),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildHeaderImage(),
          _buildContent(),
          CommentSection(
            commentsData: List<Map<String, dynamic>>.from(blogData['comments']),
            currentUser: blogData['currentUser'] as Map<String, dynamic>,
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderImage() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
      child: Image.network(
        blogData['picture'] ?? '',
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.only(left: 35, right: 35, top: 12, bottom: 60),
      child: MarkdownBody(
        data: blogData['content'] ?? '',
        styleSheet: MarkdownStyleSheet(
          p: const TextStyle(
            fontSize: 16,
            color: Color(0xFF2D4379),
            fontFamily: 'Avenir',
          ),
        ),
      ),
    );
  }
}

/// Widget for editing blog content
class BlogContentEdit extends StatefulWidget {
  final Map<String, dynamic> blogData;

  const BlogContentEdit({super.key, required this.blogData});

  @override
  State<BlogContentEdit> createState() => _BlogContentEditState();
}

class _BlogContentEditState extends State<BlogContentEdit> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.blogData['content']);
    _controller.addListener(_onTextChanged);
    _focusNode = FocusNode();
  }

  void _onTextChanged() {
    setState(() {
      widget.blogData['content'] = _controller.text;
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.8),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(children: [_buildHeaderImage(), _buildEditor()]),
    );
  }

  Widget _buildHeaderImage() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
      child: Image.network(
        widget.blogData['picture'] ?? '',
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    );
  }

  Widget _buildEditor() {
    return Padding(
      padding: const EdgeInsets.only(left: 35, right: 35, top: 12, bottom: 60),
      child: Column(
        children: [
          MarkdownToolbar(
            useIncludedTextField: false,
            controller: _controller,
            focusNode: _focusNode,
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _controller,
            focusNode: _focusNode,
            minLines: 1,
            maxLines: null,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Write your blog content here...',
            ),
          ),
        ],
      ),
    );
  }
}
