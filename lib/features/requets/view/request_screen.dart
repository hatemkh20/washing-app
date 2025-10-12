import 'package:clean_point/core/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../widget/card_request_widget.dart';

class RequestsScreen extends StatelessWidget {
  const RequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 3,
      padding: EdgeInsets.all(10.0),
      itemBuilder: (context, index) {
        return CardRequestWidget(index: index);
      },
      separatorBuilder: (context, index) => 10.ph,
    );
  }
}
