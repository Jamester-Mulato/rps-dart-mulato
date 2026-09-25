import 'dart:io';

/// Gets a player's name from the keyboard.
String getPlayerName(String playerNumber) {
  stdout.write('Enter $playerNumber name: ');
  String? input = stdin.readLineSync();

  return input?.trim().isEmpty ?? true
      ? playerNumber
      : input!.trim();
}

/// Gets a player's move from the keyboard.
String getMove(String playerName) {
  stdout.write(
    '$playerName, enter your move (rock/paper/scissors): ',
  );

  String? input = stdin.readLineSync();

  return input?.trim().toLowerCase() ?? '';
}

/// Decides the winner between two moves.
String? decideWinner(String playerOneMove, String playerTwoMove) {
  if (playerOneMove == playerTwoMove) {
    return null;
  }

  if ((playerOneMove == 'rock' && playerTwoMove == 'scissors') ||
      (playerOneMove == 'paper' && playerTwoMove == 'rock') ||
      (playerOneMove == 'scissors' && playerTwoMove == 'paper')) {
    return 'Player 1';
  }

  return 'Player 2';
}

void main() {
  print('===== ROCK, PAPER, SCISSORS =====');

  String playerOneName = getPlayerName('Player 1');
  String playerTwoName = getPlayerName('Player 2');

  String playerOneMove = getMove(playerOneName);
  String playerTwoMove = getMove(playerTwoName);

  String? winner = decideWinner(playerOneMove, playerTwoMove);

  print('$playerOneName chose $playerOneMove.');
  print('$playerTwoName chose $playerTwoMove.');
  print('Result: ${winner ?? "It\'s a draw!"}');
}