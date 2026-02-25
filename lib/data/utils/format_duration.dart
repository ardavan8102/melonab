String formatDuration(int milliseconds) {

  final minutes = (milliseconds / 60000).floor();
  final seconds = ((milliseconds % 60000) / 1000).floor();
  return "$minutes:${seconds.toString().padLeft(2, '0')}";

}