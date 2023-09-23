import 'dart:async';

import 'package:flutter/material.dart';
import 'package:netflix_clone/core/notifiers.dart';
import 'package:netflix_clone/presentation/search_screen/core.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    Timer? debounceTimer;
    bool typing = false;
    TextEditingController queryContoller = TextEditingController();
    return TextField(
      decoration: const InputDecoration(
          prefixIcon: Icon(Icons.search_outlined),
          prefixIconColor: Colors.grey,
          hintText: 'Search Movies, TV Shows & more'),
      controller: queryContoller,
      onChanged: (currentQuery) {
        typing = true;
        if (typing && debounceTimer != null) {
          debounceTimer!.cancel();
        }
        debounceTimer = Timer(const Duration(milliseconds: 500), () {
          typing = false;
          query = currentQuery;
          searchNotifier.value = currentQuery;
        });
      },
    );
  }
}
