import 'package:flutter/material.dart';
import 'package:blog/components/blog_content.dart';

/// Menu items for blog creator (edit and delete options)
List<PopupMenuEntry> creatorMenuItems = [
  PopupMenuItem(
    value: 'edit',
    child: Row(
      children: const [
        Icon(Icons.edit, color: Colors.blue),
        SizedBox(width: 8),
        Text(
          'Edit',
          style: TextStyle(color: Colors.blue, fontFamily: 'Avenir'),
        ),
      ],
    ),
  ),
  PopupMenuItem(
    value: 'delete',
    child: Row(
      children: const [
        Icon(Icons.delete, color: Colors.red),
        SizedBox(width: 8),
        Text(
          'Delete',
          style: TextStyle(color: Colors.red, fontFamily: 'Avenir'),
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

/// Returns appropriate menu items based on whether user is creator or visitor
List<PopupMenuEntry> getMenuItems(bool isCreator) {
  return isCreator ? creatorMenuItems : visitorMenuItems;
}

/// Main blog page widget that shows blog content and editing interface
class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  bool isEditing = false;
  bool isCreator = true;
  bool isLiked = false;

  // Sample blog data - this would be fetched from an API in a real app
  final Map<String, dynamic> blogData = {
    // Blog metadata
    'id': '12345',
    'createdAt': '2023-06-15T10:30:00Z',
    'updatedAt': '2023-06-15T14:45:00Z',

    // Blog content
    'picture': 'https://picsum.photos/1200',
    'title': 'You Won\'t Believe These Flutter Scaling Secrets!',
    'content': """
# The Art of Building Scalable Flutter Applications

Flutter has revolutionized the way we build cross-platform applications. In this article, we'll explore best practices and techniques for creating scalable Flutter applications that can grow with your needs.

## Architecture Matters

When building scalable Flutter applications, choosing the right architecture is crucial. Here are some key considerations:

- **Clean Architecture**: Separate your code into layers (presentation, domain, data)
- **State Management**: Choose appropriate solutions like Provider, Bloc, or Riverpod
- **Dependency Injection**: Implement proper DI for better testability and maintenance

## Performance Optimization

Performance is critical for large applications. Follow these tips:

1. Use const constructors when possible
2. Implement widget caching strategies
3. Optimize image loading and caching
4. Minimize unnecessary rebuilds

## Code Organization

Good code organization helps maintain scalability:

- Group related features into modules
- Follow consistent naming conventions
- Create reusable components
- Document your code thoroughly

Remember: A well-architected Flutter application is easier to maintain, test, and scale as your project grows.
""",

    // Author information
    'author': {
      'id': '789',
      'profilePicture': 'https://picsum.photos/600',
      'name': 'John Doe',
      'time': '2h ago',
    },

    // Current user information
    'currentUser': {
      'id': '456',
      'profilePicture': 'https://picsum.photos/604',
      'name': 'Current User',
    },

    // Engagement metrics
    'metrics': {'likes': 42, 'shares': 15, 'bookmarks': 8},

    // Comments
    'comments': [
      {
        'id': 'c1',
        'profilePicture': 'https://picsum.photos/601',
        'name': 'Sarah Johnson',
        'time': '1h ago',
        'content':
            'Great article! I especially liked the section on architecture.',
        'likes': 12,
        'isLiked': false,
      },
      {
        'id': 'c2',
        'profilePicture': 'https://picsum.photos/602',
        'name': 'Michael Chen',
        'time': '45m ago',
        'content':
            'I\'ve been using these techniques in my projects and they really work. Would love to see more content on state management specifically.',
        'likes': 8,
        'isLiked': true,
      },
      {
        'id': 'c3',
        'profilePicture': 'https://picsum.photos/603',
        'name': 'Emma Wilson',
        'time': '20m ago',
        'content':
            'Thanks for sharing these insights! Do you have any recommendations for handling large asset files in Flutter?',
        'likes': 3,
        'isLiked': false,
      },
    ],
  };

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
          slivers: [
            _buildAppBar(),
            SliverFillRemaining(
              hasScrollBody: false,
              child:
                  isEditing
                      ? BlogContentEdit(blogData: blogData)
                      : BlogContentView(blogData: blogData),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the custom app bar with title and actions
  Widget _buildAppBar() {
    return SliverAppBar(
      expandedHeight: 250,
      floating: false,
      pinned: true,
      backgroundColor: Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          children: [_buildTopBar(), _buildTitle(), _buildAuthorInfo()],
        ),
      ),
    );
  }

  /// Builds the top bar with back button and menu
  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(35, 60, 35, 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.arrow_back_ios_new_outlined, size: 32),
          PopupMenuButton(
            icon: const Icon(Icons.more_vert, size: 32),
            itemBuilder: (context) => getMenuItems(isCreator),
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

  /// Builds the blog title section
  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 35, bottom: 30, right: 35),
      child: isEditing ? _buildTitleEditField() : _buildTitleText(),
    );
  }

  /// Builds the editable title field
  Widget _buildTitleEditField() {
    return TextFormField(
      initialValue: blogData['title'],
      style: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Color(0xFF0D253C),
        fontFamily: 'Avenir',
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      onChanged: (value) {
        setState(() {
          blogData['title'] = value;
        });
      },
    );
  }

  /// Builds the title text display
  Widget _buildTitleText() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        blogData['title'] ?? '',
        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Color(0xFF0D253C),
          fontFamily: 'Avenir',
        ),
      ),
    );
  }

  /// Builds the author information section
  Widget _buildAuthorInfo() {
    final authorData = blogData['author'] as Map<String, dynamic>;

    return Padding(
      padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_buildAuthorProfile(authorData), _buildActionButtons()],
      ),
    );
  }

  /// Builds the author profile section with image and details
  Widget _buildAuthorProfile(Map<String, dynamic> authorData) {
    return Row(
      children: [
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: NetworkImage(authorData['profilePicture'] ?? ''),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              authorData['name'] ?? '',
              style: const TextStyle(
                color: Color(0xFF2D4379),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              authorData['time'] ?? '',
              style: const TextStyle(fontSize: 14, color: Color(0xFF7B8BB2)),
            ),
          ],
        ),
      ],
    );
  }

  /// Builds the action buttons (like, share, bookmark)
  Widget _buildActionButtons() {
    return Row(
      children: [
        IconButton(
          icon: Icon(
            isLiked ? Icons.favorite : Icons.favorite_border,
            color: const Color(0xFF2991D6),
          ),
          iconSize: 32,
          onPressed: () {
            setState(() {
              isLiked = !isLiked;
              if (isLiked) {
                blogData['metrics']['likes']++;
              } else {
                blogData['metrics']['likes']--;
              }
            });
          },
        ),
        const SizedBox(width: 10),
        IconButton(
          icon: const Icon(Icons.share_outlined, color: Color(0xFF2991D6)),
          iconSize: 32,
          onPressed: () {
            setState(() {
              blogData['metrics']['shares']++;
            });
          },
        ),
        const SizedBox(width: 10),
        IconButton(
          icon: const Icon(
            Icons.bookmark_outline_rounded,
            color:  Color(0xFF2991D6),
          ),
          iconSize: 32,
          onPressed: () {
            setState(() {
              blogData['metrics']['bookmarks']++;
            });
          },
        ),
      ],
    );
  }
}
