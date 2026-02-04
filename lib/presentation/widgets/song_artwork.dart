import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:melonab/core/consts/colors.dart';
import 'package:melonab/core/utils/artwork_cache.dart';
import 'package:melonab/data/services/media_store.dart';

class SongArtworkWidget extends StatefulWidget {
  final int songId;
  const SongArtworkWidget({super.key, required this.songId});

  @override
  State<SongArtworkWidget> createState() => _SongArtworkWidgetState();
}

class _SongArtworkWidgetState extends State<SongArtworkWidget> {
  Uint8List? _bytes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadArt();
  }

  @override
  void didUpdateWidget(covariant SongArtworkWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.songId != widget.songId) {
      _loadArt();
    }
  }

  Future<void> _loadArt() async {
    // ۱. ابتدا بررسی کن آیا عکس در کش موجود است؟
    if (ArtworkCache.has(widget.songId)) {
      if (mounted) {
        setState(() {
          _bytes = ArtworkCache.get(widget.songId);
          _isLoading = false;
        });
      }
      return;
    }

    if (!mounted) return;
    setState(() => _isLoading = true);
    
    final bytes = await MediaStoreService.getArt(widget.songId);

    if (mounted) {
      if (bytes != null) {
        ArtworkCache.set(widget.songId, bytes);
      }
      
      setState(() {
        _bytes = bytes;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const double size = 50;
    const double radius = 10;

    if (_isLoading) {
      // ویجت سبک‌تر برای لودینگ
      return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.grey.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(radius),
        ),
      );
    }

    if (_bytes != null && _bytes!.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Image.memory(
          _bytes!,
          width: size,
          height: size,
          fit: BoxFit.cover,
          gaplessPlayback: true, 
          // نکته مهم برای پرفورمنس:
          // این باعث می‌شود عکس دقیقاً به اندازه مورد نیاز دیکود شود و حافظه کمتری بگیرد
          cacheWidth: (size * MediaQuery.of(context).devicePixelRatio).toInt(), 
          errorBuilder: (_, _, _) => _buildPlaceholder(size, radius),
        ),
      );
    } 
    
    return _buildPlaceholder(size, radius);
  }

  Widget _buildPlaceholder(double size, double radius) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppSolidColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: const Icon(Icons.music_note, color: AppSolidColors.primary),
    );
  }
}