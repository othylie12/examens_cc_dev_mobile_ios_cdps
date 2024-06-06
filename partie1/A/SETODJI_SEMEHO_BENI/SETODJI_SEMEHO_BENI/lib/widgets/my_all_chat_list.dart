import 'package:flutter/material.dart';
import 'package:projet/core/theme.dart';
import 'package:projet/widgets/my_chat_item.dart';

class AllChatList extends StatelessWidget {
  const AllChatList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  ListView(
      children: const [
        ChatItem(
          initial: '',
          title: 'Flutter',
          sender: 'Ben',
          message: 'Hello. Does anyone know how can i directly on/off',
          time: '22:14',
          mute: false,
          unread: 1280,
          color: Colors.transparent,
           image: "assets/images/2.png"
        ),
        ChatItem(
          initial: '',
          title: 'Webtoon world',
          sender: '',
          message: 'New post on /r/webtoon subreddit:',
          time: '9:28',
          mute: true,
          unread: 8,
          color: Colors.transparent,
           image: "assets/images/2.png"
        ),
        ChatItem(
          initial: '',
          title: 'Stiles',
          sender: '',
          message: 'Hi, how are you ?',
          time: '7:34',
          mute: false,
          unread: 2,
          color: fourthColor, image: "assets/images/person1.png",
        ),
        ChatItem(
          initial: '',
          title: 'Cactus Jack',
          sender: '',
          message: 'Hi, how are you ?',
          time: 'Tue',
          mute: true,
          unread: 0,
          color: secondaryColor,
           image: "assets/images/2.png"
        ),
        ChatItem(
          initial: '',
          title: 'Webtoon world',
          sender: '',
          message: 'New post on /r/flutterdev subreddit:',
          time: '9:28',
          mute: true,
          unread: 8,
          color: Colors.transparent,
           image: "assets/images/2.png"
        ),
        ChatItem(
          initial: '',
          title: 'Webtoon world',
          sender: '',
          message: 'New post on /r/flutterdev subreddit:',
          time: '9:28',
          mute: true,
          unread: 8,
          color: Colors.transparent,
           image: "assets/images/2.png"
        ),
        ChatItem(
          initial: '',
          title: 'Webtoon world',
          sender: '',
          message: 'New post on /r/flutterdev subreddit:',
          time: '9:28',
          mute: true,
          unread: 8,
          color: Colors.transparent,
           image: "assets/images/2.png"
        ),
          ChatItem(
          initial: '',
          title: 'Webtoon world',
          sender: '',
          message: 'New post on /r/flutterdev subreddit:',
          time: '9:28',
          mute: true,
          unread: 8,
          color: Colors.transparent,
           image: "assets/images/2.png"
        ),
          ChatItem(
          initial: '',
          title: 'Webtoon world',
          sender: '',
          message: 'New post on /r/flutterdev subreddit:',
          time: '9:28',
          mute: true,
          unread: 8,
          color: Colors.transparent,
           image: "assets/images/2.png"
        ),
        ChatItem(
          initial: '',
          title: 'Webtoon world',
          sender: '',
          message: 'New post on /r/flutterdev subreddit:',
          time: '9:28',
          mute: true,
          unread: 8,
          color: Colors.transparent,
           image: "assets/images/2.png"
        ),
        ChatItem(
          initial: '',
          title: 'Webtoon world',
          sender: '',
          message: 'New post on /r/flutterdev subreddit:',
          time: '9:28',
          mute: true,
          unread: 8,
          color: Colors.transparent,
           image: "assets/images/2.png"
        ),
        
      ],
    );
  }
}
