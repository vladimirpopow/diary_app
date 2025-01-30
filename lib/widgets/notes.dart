import 'package:flutter/material.dart';

class Notes extends StatefulWidget {
  final Function(String) onTextChanged;

  const Notes({Key? key, required this.onTextChanged}) : super(key: key);

  @override
  _NotesWidgetState createState() => _NotesWidgetState();
}

class _NotesWidgetState extends State<Notes> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Заметки",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          textDirection: TextDirection.ltr,
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _controller,
          maxLines: 4,
          onChanged: widget.onTextChanged,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            hintText: "Опиши свои чувства...",
            hintStyle:
                const TextStyle(color: Color.fromARGB(202, 117, 117, 117)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
