import 'package:flutter/material.dart';

class TexFieldWidget extends StatefulWidget {
  final String label;
  final String text;
  final ValueChanged<String> onChanged;
  final int maxLines;
  const TexFieldWidget(
      {Key? key,
      required this.label,
      required this.text,
      required this.onChanged,
      this.maxLines = 1})
      : super(key: key);

  @override
  State<TexFieldWidget> createState() => _TexFieldWidgetState();
}

class _TexFieldWidgetState extends State<TexFieldWidget> {
  late final TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.text);
  }

  void dispone() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label, //! hace referencia al wiget que lo use.
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            maxLines: widget.maxLines,
          ),
        ],
      );
}
