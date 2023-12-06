import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final double height;
  final double width;
  final List<String> items;
  final String hint;
  final Function(String) onChanged;

  CustomDropdown({
    required this.height,
    required this.width,
    required this.items,
    required this.hint,
    required this.onChanged,
  });

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String dropdownValue = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton(
        value: dropdownValue.isNotEmpty ? dropdownValue : null,
        icon: const Icon(Icons.keyboard_arrow_down),
        items: widget.items.map((String item) {
          return DropdownMenuItem(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });

          // Call the callback function with the updated value
          widget.onChanged(newValue!);
        },
        hint: Text(widget.hint),
      ),
    );
  }
}
