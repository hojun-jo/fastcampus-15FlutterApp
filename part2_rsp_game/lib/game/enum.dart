const assetPath = 'assets/images';

enum InputType {
  rock,
  scissors,
  paper;

  String get path => '$assetPath/$name.png';
}

enum Result {
  playerWin('Player Win'),
  draw('Draw'),
  cpuWin('Player Loose');

  const Result(this.displayString);

  final String displayString;
}