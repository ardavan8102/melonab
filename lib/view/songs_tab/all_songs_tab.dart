import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melonab/view_model/song_lists_view_model.dart';

class AllSongsTab extends StatefulWidget {
  const AllSongsTab({super.key});

  @override
  State<AllSongsTab> createState() => _AllSongsTabState();
}

class _AllSongsTabState extends State<AllSongsTab> {

  final SongListsViewModel songListsViewModel = Get.find<SongListsViewModel>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text('All Songs Tab'),
      ],
    );
  }
}