import 'package:flutter/material.dart';
import '../theme/helper/app_assets.dart';
import '../theme/helper/theme_extention.dart';

enum TaskStatus {
  inProgress,
  review,
  done;

  Color colorStatus(BuildContext context) {
    final colors = context.colors;
    return switch (this) {
      TaskStatus.inProgress => colors.gray200,
      TaskStatus.review => colors.yellow50,
      TaskStatus.done => colors.success50
    };
  }

  String get name => switch (this) {
    TaskStatus.inProgress => "In Progress",
    TaskStatus.review => "Review",
    TaskStatus.done => "Done"
  };

  String get iconStatus =>switch (this) {
    TaskStatus.inProgress => AppAssets.taskStatusInProgress,
    TaskStatus.review => AppAssets.taskStatusReview,
    TaskStatus.done => AppAssets.taskStatusDone,

  };

  double get status => switch (this) {
    TaskStatus.inProgress => 0.35,
    TaskStatus.review => 0.60,
    TaskStatus.done => 1.0
  };
}
