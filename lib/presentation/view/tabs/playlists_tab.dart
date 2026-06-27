import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melonab/core/consts/dimens.dart';
import 'package:melonab/core/extensions/sized_box.dart';
import 'package:melonab/data/controllers/playlists_controller.dart';
import 'package:melonab/presentation/widgets/grids/playlists_gridview.dart';

class CustomPlaylistsTabPage extends StatelessWidget {
  CustomPlaylistsTabPage({super.key});

  final PlaylistsController controller = Get.put(PlaylistsController());

  @override
  Widget build(BuildContext context) {
    final playlists = controller.playlists;
    final isPlaylistsEmpty = playlists.isEmpty;

    return isPlaylistsEmpty
      ? Center(child: Text('پلی لیستی ندارید'))
      : Padding(
        padding: EdgeInsets.fromLTRB(
          AppDimens.paddingMedium,
          AppDimens.paddingMedium,
          AppDimens.paddingMedium,
          Get.height * .22
        ),
        child: Column(
          children: [
            AppDimens.marginMedium.height,
        
            Expanded(
              child: CustomPlaylistsGridView(playlists: playlists),
            ),
          ],
        ),
      );
  }
}