import 'package:assignment/app/widgets/empty_page.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../res/strings.dart';
import '../controllers/statistics_controller.dart';

class StatisticsView extends GetView<StatisticsController> {
  const StatisticsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Strings.statistics), centerTitle: true),
      body:  EmptyPage( title: Strings.noStatistics ,),
    );
  }
}
