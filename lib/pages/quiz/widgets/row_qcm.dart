import 'package:flutter/material.dart';

class RowQCM extends StatefulWidget {
  const RowQCM({
    Key? key,
    required this.prop,
  }) : super(key: key);

  final String prop;

  @override
  State<RowQCM> createState() => _RowQCMState();
}

class _RowQCMState extends State<RowQCM> {
  bool isSelected = false;
  // Variable pour stocker la proposition sélectionnée
  // String? selectedProposition;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: InkWell(
        onTap: () {
          setState(() {
            isSelected = !isSelected; // inverser l'état de sélection
          });
          // Appeler le rappel sur la ligne pour notifier la sélection de la ligne
          // widget.onRowSelected?.call(isSelected);
        },
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue : Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(widget.prop),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
