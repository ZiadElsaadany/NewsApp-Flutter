import 'package:flutter/material.dart';

import '../../model/Sources.dart';

class TabItem extends StatelessWidget {
  Sources source;
  bool isSelected;
  TabItem(this.source, this.isSelected);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0,vertical: 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color:
              isSelected ? Theme.of(context).primaryColor : Colors.transparent,
          border: Border.all(color: Theme.of(context).primaryColor)),
      child: Text(
        source.name ?? "",
        style: TextStyle(
            color: isSelected ? Colors.white : Theme.of(context).primaryColor),
      ),
    );
  }
}
