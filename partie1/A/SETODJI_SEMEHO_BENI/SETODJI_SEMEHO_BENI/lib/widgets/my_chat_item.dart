import 'package:flutter/material.dart';
import 'package:projet/core/theme.dart';

class ChatItem extends StatelessWidget {
  final String image;
  final String initial;
  final String title;
  final String sender;
  final String message;
  final String time;
  final bool mute;
  final int unread;
  final Color color;

  const ChatItem({
    super.key,
    required this.initial,
    required this.title,
    required this.sender,
    required this.message,
    required this.time,
    required this.mute,
    required this.unread,
    required this.color, required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
      leading: CircleAvatar(
        // backgroundColor: color,
        radius: 25,
        child: initial.isNotEmpty ?
          Text(initial, style: const TextStyle(color: backgroundColorLight, fontSize: 20))
          : ClipOval(
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              width: 50,  // Ajustez la largeur et la hauteur selon vos besoins
              height: 50,
            ),
          ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Row(
          children: [
            Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: backgroundColorDark)),
            const SizedBox(width: 5),
            mute ? const Icon(Icons.volume_off, color: tertiaryColor, size: 15) : Container(),
            const Spacer(),
            Text(time, style: const TextStyle(fontSize: 13, color: backgroundColorDark)),
          ],
        ),
      ),
      subtitle: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                sender.isNotEmpty ?
                Text('$sender: ', maxLines: 1, overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15, color: backgroundColorDark, fontWeight: FontWeight.bold),
                ) : Container(),
                Expanded(
                  child: Text(message, maxLines: 1, overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
          unread > 9 ? Container(
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              color: tertiaryColor,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Text(unread.toString(), style: TextStyle(fontSize: 13, color: backgroundColorLight, fontWeight: FontWeight.bold)),
          ) :
          (unread > 0 ?
            CircleAvatar(
              backgroundColor: tertiaryColor,
              child: Text(unread.toString(), style: TextStyle(fontSize: 13, color: backgroundColorLight, fontWeight: FontWeight.bold)),
              radius: 12,
            ) : Container()
          ),
        ],
      ),
    );
  }
}
