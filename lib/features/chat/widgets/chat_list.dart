import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp_ui/common/widgets/loader.dart';
import 'package:whatsapp_ui/features/chat/controller/chat_controller.dart';
import 'package:whatsapp_ui/info.dart';
import 'package:whatsapp_ui/models/message.dart';
import 'package:whatsapp_ui/models/message.dart';
import 'package:whatsapp_ui/common/widgets/my_message_card.dart';
import 'package:whatsapp_ui/common/widgets/sender_message_card.dart';

class ChatList extends ConsumerStatefulWidget {
  final String receiverUserId;
  const ChatList({
    Key? key,
    required this.receiverUserId,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatListState();
}

class _ChatListState extends ConsumerState<ChatList> {
  final ScrollController messageController = ScrollController();

  @override
  void dispose() {
    super.dispose();
    messageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Message>>(
        stream:
            ref.read(chatControllerProvider).chatStream(widget.receiverUserId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loader();
          }

          SchedulerBinding.instance.addPostFrameCallback((_) {
            messageController
                .jumpTo(messageController.position.maxScrollExtent);
          });
          return ListView.builder(
            controller: messageController,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final messsageData = snapshot.data![index];
              final timeSent = DateFormat.Hm().format(messsageData.timeSent);
              if (messsageData.senderId ==
                  FirebaseAuth.instance.currentUser!.uid) {
                return MyMessageCard(
                  message: messsageData.text,
                  date: timeSent,
                  type: messsageData.type,
                );
              }
              return SenderMessageCard(
                message: messsageData.text,
                date: timeSent,
                type: messsageData.type,
              );
            },
          );
        });
  }
}
