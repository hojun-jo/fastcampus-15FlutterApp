import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/notification/vo/vo_ttoss_notification.dart';
import 'package:fast_app_base/screen/notification/w_notification_item.dart';
import 'package:flutter/material.dart';
import 'package:nav/dialog/dialog.dart';

class NotificationDialog extends DialogWidget {
  final List<TtossNotification> notification;

  NotificationDialog(
    this.notification, {
    super.key,
    super.animation = NavAni.Bottom,
  });

  @override
  DialogState<NotificationDialog> createState() => _NotificationDialogState();
}

class _NotificationDialogState extends DialogState<NotificationDialog> {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...widget.notification
              .map((element) => NotificationItemWidget(
                  onTap: () {
                    widget.hide();
                  },
                  notification: element))
              .toList(),
        ],
      ),
    );
  }
}
