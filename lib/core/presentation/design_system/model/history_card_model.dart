import 'package:flutter/cupertino.dart';


class HistoryCardAction {
  final String label;
  final IconData icon;
  final Color? color;
  final VoidCallback onTap;

  const HistoryCardAction({
    required this.label,
    required this.icon,
    this.color,
    required this.onTap,
  });
}

class HistoryCardModel  {
  final String id;
  final DateTime date;
  final IconData headerIcon;
  final Color? headerIconColor;
  final Color? backgroundColor;
  final DateTime? dateAddedStatus;

  final List<InfoItem> infoItems;

  final StatusCard? statusCard;
  final String? statusAddedByName;
  final String? statusImage;
  final String? additionalNote;
  final List<HistoryCardAction> actions;

  const HistoryCardModel({
    required this.id,
    required this.date,
    required this.headerIcon,
    this.headerIconColor,
    this.backgroundColor,
    required this.infoItems,
    this.statusCard,
    this.dateAddedStatus,
    this.statusAddedByName,
    this.statusImage,
    this.additionalNote,
    this.actions = const [],
  });
}

class InfoItem {
  final String label;
  final String value;

  InfoItem({
    required this.label,
    required this.value,
  });
}

enum StatusCard { approved, rejected }