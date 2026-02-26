import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:melonab/data/models/local_song.dart';
import 'package:on_audio_query/on_audio_query.dart';

class AudioController {

  static final AudioController instance = AudioController._instance();
  factory AudioController () => instance;
  AudioController._instance() {
    _setupAudioPlayer();
  }

  final AudioPlayer audioPlayer = AudioPlayer();
  final OnAudioQuery audioQuery = OnAudioQuery();

  final ValueNotifier<List<LocalSongModel>> songs = ValueNotifier<List<LocalSongModel>>([]);
  final ValueNotifier<int> currentIndex = ValueNotifier<int>(-1);
  final ValueNotifier<bool> isPlaying = ValueNotifier<bool>(false);

  final Map<int, Uint8List?> _artworkCache = {};
  ConcatenatingAudioSource? _playlist;


  LocalSongModel? get currentSong => 
    currentIndex.value != -1 && currentIndex.value < songs.value.length 
      ? songs.value[currentIndex.value] 
      : null;


  void _setupAudioPlayer() {

    // Sync currentIndex with audio player's actual index
    audioPlayer.currentIndexStream.listen((index) {
      if (index != null) {
        currentIndex.value = index;
      }
    });

    audioPlayer.playingStream.listen((playing) {
      isPlaying.value = playing;
    });

    audioPlayer.positionStream.listen(
      (_) {
        // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
        isPlaying.notifyListeners();
      }
    );

  }

  // Load Songs
  Future<void> loadSongs() async {

    final fetchSongs = await audioQuery.querySongs(
      sortType: .DATE_ADDED,
      orderType: .ASC_OR_SMALLER,
      uriType: .EXTERNAL,
      ignoreCase: true,
    );

    songs.value = fetchSongs.map(
      (songs) => LocalSongModel(
        id: songs.id,
        title: songs.title,
        artist: songs.artist == null 
          ? 'هنرمنـد ناشنـاس' 
          : songs.artist == '<unknown>' 
            ? 'هنرمنـد ناشنـاس' 
            : songs.artist ?? '',
        uri: songs.uri ?? '',
        albumTitle: songs.album ?? '',
        duration: songs.duration ?? 0,
      )
    ).toList();

    await buildPlaylist();

  }


  Future<void> buildPlaylist() async {
    final List<AudioSource> audioSources = [];

    for (final song in songs.value) {

      audioSources.add(
        AudioSource.uri(
          Uri.parse(song.uri),
          tag: MediaItem(
            id: song.id.toString(),
            title: song.title,
            artist: song.artist,
            album: song.albumTitle,
            artUri: null,
          ),
        ),
      );
    }

    _playlist = ConcatenatingAudioSource(children: audioSources);

    await audioPlayer.setAudioSource(_playlist!);
  }

  // Functions for controlls
  // play song
  Future<void> playSong(int index) async {
    if (index < 0 || index >= songs.value.length) return;

    try {
      if (currentIndex.value == index) {
        if (isPlaying.value) {
          await pauseSong();
        } else {
          await resumeSong();
        }
        return;
      }

      // آهنگ جدید انتخاب شده
      currentIndex.value = index;

      await audioPlayer.seek(
        Duration.zero,
        index: index,
      );

      await audioPlayer.play();
      isPlaying.value = true;

    } catch (e) {
      debugPrint('playSong error: $e');
    }
  }

  // Pause
  Future<void> pauseSong() async {

    await audioPlayer.pause();
    isPlaying.value = false;

  } 

  // Resume
  Future<void> resumeSong() async {

    await audioPlayer.play();
    isPlaying.value = true;

  }

  // Toggle play/pause
  void togglePlayPause() async {

    if ( currentIndex.value == -1 ) return;

    try {
      
      if (isPlaying.value) {
        
        await pauseSong();

      } else {

        await resumeSong();

      }

    } catch (e) {
      debugPrint('Toggle play/pause Error : $e');
    }

  }


  // Next Song
  Future<void> nextSong() async {

    if (currentIndex.value < songs.value.length - 1) {
      
      await playSong(currentIndex.value + 1);

    }
    
  }


  // Previous Song
  Future<void> previousSong() async {

    if (currentIndex.value > 0) {
      
      await playSong(currentIndex.value - 1);

    }
    
  }

  // Get Artwork
  Future<Uint8List?> getArtwork(LocalSongModel song) async {
    if (_artworkCache.containsKey(song.id)) {
      return _artworkCache[song.id];
    }

    final art = await audioQuery.queryArtwork(
      song.id,
      ArtworkType.AUDIO,
      size: 200,
      quality: 80,
    );

    _artworkCache[song.id] = art;
    song.thumbnail = art;

    return art;
  }


  // destroy audio player
  void dispose() {
    audioPlayer.dispose();
  }

}