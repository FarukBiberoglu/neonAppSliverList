import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  // List of news articles
  final List<Map<String, String>> articles = [
    {
      'title': 'Breaking News: Flutter 3.0 Released!',
      'description': 'Flutter 3.0 brings new features and improvements.',
      'image': 'assets/images3.jpg', // Thumbnail image
    },
    {
      'title': 'Breaking News: Flutter 3.0 Released!',
      'description': 'Flutter 3.0 brings new features and improvements.',
      'image': 'assets/images1.jpg', // Thumbnail image
    },
    {
      'title': 'Breaking News: Flutter 3.0 Released!',
      'description': 'Flutter 3.0 brings new features and improvements.',
      'image': 'assets/images1.jpg', // Thumbnail image
    },
    {
      'title': 'Breaking News: Flutter 3.0 Released!',
      'description': 'Flutter 3.0 brings new features and improvements.',
      'image': 'assets/images2.jpg', // Thumbnail image
    },
    // Add more articles as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'News ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          // SliverAppBar to add a collapsible app bar
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("News Feed"),
              background: Image.asset(
                'assets/images5.jpg', // Background image for the app bar
                fit: BoxFit.cover,
              ),
            ),
          ),

          // SliverList to show the list of articles, replaced with ListView.builder
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                final article = articles[index];

                return Card(
                  margin: EdgeInsets.all(10),
                  elevation: 5,
                  child: ListTile(
                    contentPadding: EdgeInsets.all(10),
                    leading: Image.asset(
                      article['image']!,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      article['title']!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      article['description']!,
                      style: TextStyle(fontSize: 14),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Handle article click
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('You tapped on ${article['title']}')),
                      );
                    },
                  ),
                );
              },
              childCount: articles.length,
            ),
          ),

          // SliverGrid to show a grid layout of images, replaced with GridView.builder
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,  // Number of columns in the grid
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 1.0,
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                final image = articles[index]['image']!;

                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image), // Image for each grid item
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              childCount: articles.length, // Number of grid items, based on articles list
            ),
          ),
        ],
      ),
    );
  }
}
