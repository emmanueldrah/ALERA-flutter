import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildChatTile(
          context,
          'Dr. Sarah Smith',
          'Your test results are ready for review.',
          '10:45 AM',
          true,
        ),
        _buildChatTile(
          context,
          'Pharmacy Care',
          'Your prescription for Lisinopril has been filled.',
          'Yesterday',
          false,
        ),
        _buildChatTile(
          context,
          'Dr. Michael Chen',
          'Please confirm your appointment for next week.',
          'Oct 20',
          false,
        ),
        _buildChatTile(
          context,
          'Lab Support',
          'Welcome to Alera messaging!',
          'Oct 15',
          false,
        ),
      ],
    );
  }

  Widget _buildChatTile(
    BuildContext context,
    String sender,
    String snippet,
    String time,
    bool isUnread,
  ) {
    return Semantics(
      label: '${isUnread ? "Unread message" : "Message"} from $sender: $snippet at $time',
      child: ListTile(
        leading: CircleAvatar(
          child: Text(sender[0]),
        ),
        title: Text(
          sender,
          style: TextStyle(
            fontWeight: isUnread ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        subtitle: Text(
          snippet,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: isUnread ? FontWeight.w500 : FontWeight.normal,
            color: isUnread ? Theme.of(context).colorScheme.primary : null,
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              time,
              style: Theme.of(context).textTheme.labelSmall,
            ),
            if (isUnread)
              Container(
                margin: const EdgeInsets.only(top: 4),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
        onTap: () {},
      ),
    );
  }
}
