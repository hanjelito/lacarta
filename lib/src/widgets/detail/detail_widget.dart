import 'package:flutter/material.dart';


class DetailWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container(
            // height: 50,
            // alignment: Alignment.center,
            // color: Colors.orange[100 * (index % 9)],
            // child: Text(datos[index].name),
          );
        },
        childCount: 4,
      ),
    );
  }
}
