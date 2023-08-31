import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/downloads_screen/widgets/app_bar.dart';

class DownloadsScreen extends StatelessWidget {
  const DownloadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50), child: CustomAppBar(title: "Downloads",)),
    );
  }
}
