import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart' as rxdart;

class PositionData {
  const PositionData(
    this.position,
    this.bufferedPosition,
    this.duration
  );

  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;
}

class AudioPlayerViewmodel extends GetxController {
  AudioPlayer? audioPlayer;

  AudioPlayer get player {
    audioPlayer ??= AudioPlayer();
    return audioPlayer!;
  }

  @override
  void onClose() {
    audioPlayer?.dispose();
    super.onClose();
  }

  Future<void> seekBy(Duration offset, AudioPlayer audioP) async {
    final position = audioP.position;
    final duration = audioP.duration;

    if (duration == null) return;

    var newPosition = position + offset;

    // clamp
    if (newPosition < Duration.zero) {
      newPosition = Duration.zero;
    } else if (newPosition > duration) {
      newPosition = duration;
    }

    await audioP.seek(newPosition);
  }


  Stream<PositionData> get positionDataStream => rxdart.Rx.combineLatest3(
    player.positionStream,
    player.bufferedPositionStream,
    player.durationStream,
    (position, bufferedPosition, duration) => PositionData(position, bufferedPosition, duration ?? Duration.zero)
  );
}