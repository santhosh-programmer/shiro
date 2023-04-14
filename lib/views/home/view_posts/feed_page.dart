import 'package:flutter/material.dart';

import '../../../services/auth_services.dart';
import '../../../services/auth_services_impl.dart';
import '../../auth/login_page.dart';

import 'package:video_player/video_player.dart';


class FeedItemState {
  int clickCount;
  bool isBookmarked = false;

  FeedItemState({this.clickCount = 0, this.isBookmarked=false});

  bool get isbook => isBookmarked;

  set isbook(bool value) {
    isbook = value;
  }
}



class FeedItem {
  final String imageUrl;
  final String videoUrl;
  final String location;
  final String description;
  final List<String> comments;
  final String username;
  final FeedItemState state = FeedItemState();

  FeedItem({
    required this.imageUrl,
    required this.videoUrl,
    required this.location,
    required this.description,
    required this.comments,
    required this.username,
  });
}

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);
  @override
  _FeedState createState() => _FeedState();
}
class VideoPlayerWidget extends StatefulWidget {
  final String url;

  VideoPlayerWidget({required this.url});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  @override
  void _initializeVideoPlayer() async {
    _controller = VideoPlayerController.network(widget.url);
    await _controller.initialize();
    setState(() {});
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller.value.isInitialized) {

      return SizedBox(
        child: Stack(
            children: [
              Center(
                child: SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: VideoPlayer(_controller)),
              ),
              Visibility(
                visible: !_controller.value.isPlaying,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _controller.play();
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Center(
                      child: Icon(
                        Icons.play_arrow,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: _controller.value.isPlaying,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _controller.pause();
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Center(
                      child: Icon(
                        Icons.pause,
                        size: 50,
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
              ),
            ],

        ),
      );
    } else {
      return Container();
    }
  }



}

class _FeedState extends State<Feed> {

  final List<FeedItem> feedItems = [    FeedItem(
    imageUrl: 'https://static.videezy.com/system/resources/thumbnails/000/040/716/small/DSCF2211-264.jpg',
    videoUrl: 'https://static.videezy.com/system/resources/previews/000/040/716/original/DSCF2211-264.mp4',
    location: 'New York, USA',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod nisi et arcu luctus, eu blandit magna ultrices. Nullam et lectus purus. Praesent eget neque dui. Nam suscipit massa quis arcu consectetur, vel fermentum ante.',
    comments: [
      'Comment 1',
      'Comment 2',
      'Comment 3',
    ],
    username: 'user123',
  ),
    FeedItem(
      imageUrl: 'https://static.videezy.com/system/resources/thumbnails/000/040/717/small/DSCF2212-264.jpg',
      videoUrl: 'https://static.videezy.com/system/resources/previews/000/040/717/original/DSCF2212-264.mp4',
      location: 'Paris, France',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod nisi et arcu luctus, eu blandit magna ultrices. Nullam et lectus purus. Praesent eget neque dui. Nam suscipit massa quis arcu consectetur, vel fermentum ante.',
      comments: [
        'Comment 1',
        'Comment 2',
      ],
      username: 'user456',
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shiro"),
        actions: [
          IconButton(
              onPressed: () {
                AuthServices imp = new AuthServiceImpl();
                imp.signout();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                );
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return Divider(height: 25);
        },
        itemCount: feedItems.length,
        itemBuilder: (BuildContext context, int index) {
          final feedItem = feedItems[index];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      child: Text(feedItem.username[0]),
                      backgroundColor: Colors.red.shade900,
                      foregroundColor: Colors.white,
                    ),
                    SizedBox(width: 8),
                    Text(feedItem.username),
                  ],
                ),
              ),
              Stack(
                children: [
                  SizedBox(
                    height: 330,
                    child: PageView(
                      children: [
                        Image.network(
                          feedItem.imageUrl,
                          fit: BoxFit.fitWidth,

                        ),
                        VideoPlayerWidget(url: feedItem.videoUrl),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Text(feedItem.location),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: feedItem.state.isBookmarked
                              ? Icon(Icons.bookmark)
                              : Icon(Icons.bookmark_border),
                          onPressed: () {
                            setState(() {
                              feedItem.state.isBookmarked = !feedItem.state.isBookmarked;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(feedItem.state.isBookmarked
                                    ? 'Bookmarked feed'
                                    : 'Removed bookmark'),
                                duration: Duration(seconds: 2),
                                action: SnackBarAction(
                                  label: 'Undo',
                                  onPressed: () {
                                    setState(() {
                                      feedItem.state.isBookmarked = !feedItem.state.isBookmarked;
                                    });
                                  },
                                ),
                              ),
                            );
                          },
                        ),


                        IconButton(
                          icon: Icon(Icons.upload_sharp),
                          onPressed: () {
                            setState(() {
                              feedItem.state.clickCount++;
                            });
                          },
                        ),
                        Text('${feedItem.state.clickCount}'),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 35,
                    left: 8,
                    child: Text(
                      '${feedItem.comments.length} comments',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 0,
                    left: 8,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.comment),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.share),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Text(
                feedItem.description.substring(0, 100) + '...',
                style: TextStyle(fontSize: 16),
              ),

              TextButton(
                child: Text('Read more'),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Description'),
                        content: Text(feedItem.description),
                        actions: [
                          TextButton(
                            child: Text('Close'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },

              ),
            ],
          );
        },
      ),
    );
  }
}

