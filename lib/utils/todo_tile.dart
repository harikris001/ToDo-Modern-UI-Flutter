import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskStatus;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? onDelete;
  final Function(BuildContext)? onEdit;

  const ToDoTile({
    Key? key,
    required this.taskName,
    required this.taskStatus,
    required this.onChanged,
    required this.onDelete,
    this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        startActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: onEdit,
              icon: Icons.edit,
              backgroundColor: Colors.blueAccent,
              borderRadius: BorderRadius.circular(22),
            )
          ],
        ),
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: onDelete,
              icon: Icons.delete_rounded,
              backgroundColor: Colors.red.shade400,
              borderRadius: BorderRadius.circular(22),
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: Theme.of(context).primaryColor,
          ),
          child: Row(
            children: [
              Checkbox(
                value: taskStatus,
                onChanged: onChanged,
                activeColor: Colors.deepPurpleAccent,
              ),
              Text(
                taskName,
                style: GoogleFonts.poppins(
                  decoration: taskStatus
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  fontSize: 18,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
