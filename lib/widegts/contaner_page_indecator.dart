

import 'package:flutter/material.dart';
class ContainerPageIndicator extends StatelessWidget {
  const ContainerPageIndicator({
    Key? key, required  bool selected, required this.endMargin ,

  }) : _selected = selected , super(key: key);

  final bool _selected;
  final double endMargin  ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(end: endMargin),
      width: 17.8,
      height: 4,
      decoration: BoxDecoration(
        color: _selected ?  Colors.blue: Colors.grey,
        borderRadius: BorderRadius.circular(2),

      ),
    );
  }
}
