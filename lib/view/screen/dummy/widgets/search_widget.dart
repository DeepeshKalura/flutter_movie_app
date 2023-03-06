import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  final Function(String)? onSumbitted;

  final TextEditingController textEditingController;
  const SearchBarWidget(
      {Key? key, this.onSumbitted, required this.textEditingController})
      : super(key: key);

  @override
  SearchBarWidgetState createState() => SearchBarWidgetState();
}

class SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  void dispose() {
    widget.textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
      ),
      child: TextField(
        controller: widget.textEditingController,
        onSubmitted: widget.onSumbitted,
        decoration: const InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
