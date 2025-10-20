import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phirus/core/theme/colors_manager.dart';
import 'package:phirus/features/body/body/data/result_model.dart';
import 'package:phirus/core/shared/item_result_widget.dart';

class CardResultList extends StatelessWidget {
  const CardResultList({
    super.key,
    required this.infoList,
  });

  final List<ResultModel> infoList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: infoList.length,
      itemBuilder: (context, index) {
        return ItemResultWidget(
          title: infoList[index].title,
          value: infoList[index].value,
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          height: 20.h,
          color: ColorsManager.lightGrey,
        );
      },
    );
  }
}
