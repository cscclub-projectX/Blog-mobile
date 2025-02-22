# Blog API Documentation

## 🔗 Connection Configuration

### Web Configuration
``` javascript
import { Client } from 'appwrite';

const client = new Client()
    .setEndpoint('https://appwrite-os08sgw04g4swk0s8owwoooc.nestgit.com/v1')
    .setProject('project-x');
```
###  Flutter Configuration

``` flutter
import 'package:appwrite/appwrite.dart';

Client client = Client()
    .setEndpoint('https://appwrite-os08sgw04g4swk0s8owwoooc.nestgit.com/v1')
    .setProject('project-x')
    .setSelfSigned(status: true);
 ```
## 📌 API Endpoints
### 1. Users Collection Create User
```javascript
// Web
import { Account } from 'appwrite';

const account = new Account(client);

// Create user
account.create(
    ID.unique(),
    'email@example.com',
    'password',
    'username'
);

// Flutter
Account account = Account(client);

await account.create(
    userId: ID.unique(),
    email: 'email@example.com',
    password: 'password',
    name: 'username'
);
 ```
 Get User Profile
```javascript
// Web
const databases = new Databases(client);

const user = await databases.getDocument(
    'database-blogv1',
    'users',
    '[USER_ID]'
);

// Flutter
final databases = Databases(client);

final user = await databases.getDocument(
    databaseId: 'database-blogv1',
    collectionId: 'users',
    documentId: '[USER_ID]'
);
 ```

### 2. Posts Collection Create Post
```javascript
// Web
const databases = new Databases(client);

await databases.createDocument(
    'database-blogv1',
    'posts',
    ID.unique(),
    {
        'title': 'Post Title',
        'content': 'Post Content',
        'authorId': '[USER_ID]',
        'status': 'draft',
        'views': 0,
        'likes': 0,
        'tags': ['tag1', 'tag2']
    }
);

// Flutter
final databases = Databases(client);

await databases.createDocument(
    databaseId: 'database-blogv1',
    collectionId: 'posts',
    documentId: ID.unique(),
    data: {
        'title': 'Post Title',
        'content': 'Post Content',
        'authorId': '[USER_ID]',
        'status': 'draft',
        'views': 0,
        'likes': 0,
        'tags': ['tag1', 'tag2']
    }
);
 ```
 List Posts
```javascript
// Web
const posts = await databases.listDocuments(
    'database-blogv1',
    'posts',
    [
        Query.equal('status', 'published')
    ]
);

// Flutter
final posts = await databases.listDocuments(
    databaseId: 'database-blogv1',
    collectionId: 'posts',
    queries: [
        Query.equal('status', 'published')
    ]
);
 ```

### 3. Comments Collection Add Comment
```javascript
// Web
await databases.createDocument(
    'database-blogv1',
    'comments',
    ID.unique(),
    {
        'content': 'Comment text',
        'postId': '[POST_ID]',
        'authorId': '[USER_ID]'
    }
);

// Flutter
await databases.createDocument(
    databaseId: 'database-blogv1',
    collectionId: 'comments',
    documentId: ID.unique(),
    data: {
        'content': 'Comment text',
        'postId': '[POST_ID]',
        'authorId': '[USER_ID]'
    }
);
 ```
 Get Post Comments
```javascript
// Web
const comments = await databases.listDocuments(
    'database-blogv1',
    'comments',
    [
        Query.equal('postId', '[POST_ID]')
    ]
);

// Flutter
final comments = await databases.listDocuments(
    databaseId: 'database-blogv1',
    collectionId: 'comments',
    queries: [
        Query.equal('postId', '[POST_ID]')
    ]
);
```

## 📝 File Upload (for profile images and post cover images)
```javascript
// Web
import { Storage } from 'appwrite';

const storage = new Storage(client);

const file = await storage.createFile(
    '[BUCKET_ID]',
    ID.unique(),
    document.getElementById('uploader').files[0]
);

// Flutter
final storage = Storage(client);

final file = await storage.createFile(
    bucketId: '[BUCKET_ID]',
    fileId: ID.unique(),
    file: InputFile.fromPath(path: filePath)
);
 ```
```

## ⚠️ Error Handling
All API calls should be wrapped in try-catch blocks:

```javascript
// Web
try {
    // API call
} catch (error) {
    console.error('Error:', error);
}

// Flutter
try {
    // API call
} catch (error) {
    print('Error: $error');
}
 ```

## 🔐 Security Notes
1. Always validate user input before sending to the API
2. Use appropriate permission settings as defined in the schema
3. Never expose sensitive data in client-side code
4. Always handle errors gracefully
5. Use HTTPS for all API communications
## 📚 Additional Resources
- Appwrite Documentation
- Appwrite Flutter SDK
- Appwrite Web SDK
```plaintext

This documentation provides the basic CRUD operations for your collections. Remember to:
1. Replace `[USER_ID]`, `[POST_ID]`, and `[BUCKET_ID]` with actual values in your implementation
2. Add proper error handling
3. Implement proper state management in your application
4. Add proper loading states for async operations
5. Implement proper validation before making API calls

Would you like me to add any specific endpoints or examples to the documentation?
 ```
