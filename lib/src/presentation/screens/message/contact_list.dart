import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:healthcare/src/domain/entities/user_entity.dart';
import 'package:healthcare/src/presentation/config/app_color.dart';
import 'package:healthcare/src/presentation/config/app_style.dart';
import 'package:healthcare/src/presentation/route/routes.gr.dart';
import 'package:provider/provider.dart';

import '../../../../main.dart';
import '../../controller/contact_list_controller.dart';
import '../../utils/debouncer.dart';
import '../../utils/firestore_constants.dart';
import '../../utils/utilities.dart';

class ContactList extends StatefulWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  State createState() => ContactListState();
}

class ContactListState extends State<ContactList> {
  ContactListState({Key? key});

  final ScrollController listScrollController = ScrollController();

  int _limit = 20;
  int _limitIncrement = 20;
  String _textSearch = "";
  bool isLoading = false;

  late String currentUserId;
  late ContactListController contactListController;
  Debouncer searchDebouncer = Debouncer(milliseconds: 300);
  StreamController<bool> btnClearController = StreamController<bool>();
  TextEditingController searchBarTec = TextEditingController();

  @override
  void initState() {
    super.initState();
    contactListController = context.read<ContactListController>();

    currentUserId = FirebaseAuth.instance.currentUser!.uid;
    listScrollController.addListener(scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    btnClearController.close();
  }

  void scrollListener() {
    if (listScrollController.offset >=
            listScrollController.position.maxScrollExtent &&
        !listScrollController.position.outOfRange) {
      setState(() {
        _limit += _limitIncrement;
      });
    }
  }

  void showNotification(RemoteNotification remoteNotification) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      Platform.isAndroid ? 'com.example.healthcare' : 'com.example.healthcare',
      'Health Care Message',
      playSound: true,
      enableVibration: true,
      importance: Importance.max,
      priority: Priority.high,
    );
    IOSNotificationDetails iOSPlatformChannelSpecifics =
        const IOSNotificationDetails();
    NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      remoteNotification.title,
      remoteNotification.body,
      platformChannelSpecifics,
      payload: null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appColorBg,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: AppColor.colorWhile,
        title: Text(
          'Danh sách liên hệ',
          style: AppStyle().heading2,
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          // List
          Column(
            children: [
              buildSearchBar(),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: contactListController.getStreamFireStore(
                      FirestoreConstants.pathUserCollection,
                      _limit,
                      _textSearch),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      if ((snapshot.data?.docs.length ?? 0) > 0) {
                        return ListView.builder(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          itemBuilder: (context, index) =>
                              buildItem(context, snapshot.data?.docs[index]),
                          itemCount: snapshot.data?.docs.length,
                          controller: listScrollController,
                        );
                      } else {
                        return const Center(
                          child: Text('No users'),
                        );
                      }
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColor.colorOrange,
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildSearchBar() {
    return Container(
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextFormField(
              textInputAction: TextInputAction.search,
              controller: searchBarTec,
              onChanged: (value) {
                searchDebouncer.run(
                  () {
                    if (value.isNotEmpty) {
                      btnClearController.add(true);
                      setState(() {
                        _textSearch = value;
                      });
                    } else {
                      btnClearController.add(false);
                      setState(() {
                        _textSearch = "";
                      });
                    }
                  },
                );
              },
              decoration: InputDecoration.collapsed(
                hintText: 'Tìm kiếm bác sĩ',
                hintStyle: TextStyle(
                    fontSize: 13, color: AppColor.colorWhile.withOpacity(0.7)),
              ),
              style: AppStyle().heading3,
            ),
          ),
          StreamBuilder<bool>(
            stream: btnClearController.stream,
            builder: (context, snapshot) {
              return snapshot.data == true
                  ? GestureDetector(
                      onTap: () {
                        searchBarTec.clear();
                        btnClearController.add(false);
                        setState(
                          () {
                            _textSearch = "";
                          },
                        );
                      },
                      child: const Icon(Icons.clear_rounded,
                          color: AppColor.colorGrey, size: 20))
                  : const SizedBox.shrink();
            },
          ),
          const SizedBox(width: 15),
          const Icon(Icons.search, color: AppColor.colorOrange, size: 25),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.colorBlackBlue,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      margin: const EdgeInsets.symmetric(vertical: 10),
    );
  }

  Widget buildItem(BuildContext context, DocumentSnapshot? document) {
    if (document != null) {
      UserEntity userChat = UserEntity.fromDocument(document);
      if (userChat.uId == currentUserId) {
        return const SizedBox.shrink();
      } else {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: TextButton(
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Material(
                  child: userChat.image.isNotEmpty
                      ? Image.network(
                          userChat.image,
                          fit: BoxFit.cover,
                          width: 50,
                          height: 50,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return SizedBox(
                              width: 50,
                              height: 50,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: AppColor.colorOrange,
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              ),
                            );
                          },
                          errorBuilder: (context, object, stackTrace) {
                            return const Icon(
                              Icons.account_circle,
                              size: 50,
                              color: AppColor.colorGrey,
                            );
                          },
                        )
                      : const Icon(
                          Icons.account_circle,
                          size: 50,
                          color: AppColor.colorGrey,
                        ),
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  clipBehavior: Clip.hardEdge,
                ),
                Flexible(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Text(
                            userChat.userName,
                            maxLines: 1,
                            style: AppStyle().heading2.copyWith(
                                fontSize: 17, color: AppColor.colorOrange),
                          ),
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                        ),
                        Container(
                          child: Text(
                            userChat.fullName,
                            maxLines: 1,
                            style: AppStyle().heading4,
                          ),
                          alignment: Alignment.centerLeft,
                        )
                      ],
                    ),
                    margin: const EdgeInsets.only(left: 20),
                  ),
                ),
              ],
            ),
            onPressed: () {
              if (Utilities.isKeyboardShowing()) {
                Utilities.closeKeyboard(context);
              }
              context.router.push(ChatRoomRoute(userEntity: userChat));
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  AppColor.colorGrey.withOpacity(0.2)),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
            ),
          ),
        );
      }
    } else {
      return const SizedBox.shrink();
    }
  }
}
