import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Todolist extends StatefulWidget {
  final String taskname; //late 用来延迟初始化
  bool? isChecked;
  Function(bool?)? onchanged;
  VoidCallback deletetask; //这是个函数

  //接下来要让这三个变量得到赋值

  Todolist(
      //key 是 Flutter 中用于标识组件的唯一标识符。它可以用于在构建相同类型的多个组件时进行区分。参数类型为 Key?，表示它是一个可选参数，可以为 null。
      {Key? key,
      required this.taskname,
      required this.isChecked,
      required this.onchanged,
      required this.deletetask})
      : super(key: key);

  //这是调用父类（StatefulWidget）的构造函数，并将 key 传递给父类。这样做是为了确保 key 被正确传递和处理。

  @override
  State<Todolist> createState() => _TodolistState();
}

class _TodolistState extends State<Todolist> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 10, left: 10, top: 10),
          child: Container(
            padding: EdgeInsets.all(12),
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.yellow[300],
            ),
            child: Slidable(
              actionPane: SlidableDrawerActionPane(),
              actionExtentRatio: 0.25,
              child: Row(
                children: [
                  Checkbox(
                    value: widget.isChecked,
                    onChanged: widget.onchanged,
                    activeColor: Colors.black,
                  ),
                  Text(
                    widget.taskname,
                    style: TextStyle(
                      fontSize: 25,
                      decoration: (widget.isChecked ?? false)
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                ],
              ),
              secondaryActions: [
                IconSlideAction(
                  //caption: '删除',
                  color: Colors.red,
                  icon: Icons.delete,
                  onTap: widget.deletetask,
                ),
              ],
            ),
          ),
        )
      ],
    );
    // Column(
    //   children: [
    //     Padding(
    //       padding: EdgeInsets.only(right: 10, left: 10, top: 10),
    //       child: Container(
    //         padding: EdgeInsets.all(12),
    //         height: 120,
    //         //width: 400,
    //         decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(50),
    //             color: Colors.yellow[300]),
    //         child: Row(
    //           children: [
    //             Checkbox(
    //               value: widget.isChecked,
    //               onChanged: widget.onchanged,
    //               activeColor: Colors.black,
    //             ),
    //             Text(
    //               widget.taskname,
    //               style: TextStyle(
    //                   fontSize: 25,
    //                   decoration: (widget.isChecked ?? false)
    //                       ? TextDecoration.lineThrough
    //                       : TextDecoration.none),
    //             ),
    //             SizedBox(width: 20),
    //             // MaterialButton(
    //             //   shape: RoundedRectangleBorder(
    //             //     borderRadius: BorderRadius.circular(20),
    //             //   ),
    //             //   minWidth: 10,
    //             //   color: Colors.red,
    //             //   onPressed: widget.deletetask,
    //             //   child: Icon(
    //             //     Icons.delete,
    //             //     //color: Colors.red,
    //             //   ),
    //             // )
    //           ],
    //         ),
    //       ),
    //     )
    //   ],
    // );
  }
}
