import 'dart:io';

import 'package:flutter/material.dart';

void showErrorDialog(BuildContext context) {
  showingDialog = true;
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Something Went Wrong"),
        content: const Text("An error occurred. Please try again later."),
        actions: [
          ElevatedButton(
            child: const Text("Exit"),
            onPressed: () {
              exit(0);
            },
          ),
        ],
      );
    },
  );
}

bool showingDialog = false;
