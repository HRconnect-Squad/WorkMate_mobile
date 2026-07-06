import 'package:flutter/cupertino.dart';

class HistoryCardModel  {
  final DateTime date;
  final IconData headerIcon;
  final Color? headerIconColor;
  final Color? backgroundColor;
  final DateTime? dateAddedStatus;

  final List<InfoItem> infoItems;

  final StatusCard? statusCard;
  final String? statusAddedByName;
  final String? statusImage;
  const HistoryCardModel({
    required this.date,
    required this.headerIcon,
    this.headerIconColor,
    required this.infoItems,
    this.statusCard,
    this.statusAddedByName,
    this.statusImage,
    this.backgroundColor,
    this.dateAddedStatus,
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