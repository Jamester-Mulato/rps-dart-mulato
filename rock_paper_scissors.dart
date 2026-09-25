import 'dart:io';

/// Gets a player's name from the keyboard.
String getPlayerName(String playerNumber) {
  stdout.write('Enter $playerNumber name: ');
  String? input = stdin.readLineSync();

  return input?.trim().isEmpty ?? true
      ? playerNumber
      : input!.trim();
}

/// Checks whether a move is valid and returns it in lowercase.
String? validateMove(String input) {
  const List<String> validMoves = ['rock', 'paper', 'scissors'];

  String move = input.trim().toLowerCase();

  if (validMoves.contains(move)) {
    return move;
  }

  return null;
}

/// Gets a valid move from a player.
String getMove(String playerName) {
  while (true) {
    stdout.write(
      '$playerName, enter your move (rock/paper/scissors): ',
    );

    String? input = stdin.readLineSync();

    String? validMove = validateMove(input ?? '');

    if (validMove != null) {
      return validMove;
    }

    print('Invalid move. Please type rock, paper, or scissors.');
  }
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

  int playerOneScore = 0;
  int playerTwoScore = 0;
  int roundNumber = 1;

  String playAgain;

  do {
    print('\n--- Round $roundNumber ---');

    String playerOneMove = getMove(playerOneName);

    // Print blank lines to hide Player 1's move.
    for (int i = 0; i < 30; i++) {
      print('');
    }

    String playerTwoMove = getMove(playerTwoName);

    String? winner = decideWinner(
      playerOneMove,
      playerTwoMove,
    );

    if (winner == 'Player 1') {
      playerOneScore++;
    } else if (winner == 'Player 2') {
      playerTwoScore++;
    }

    print('\n$playerOneName chose $playerOneMove.');
    print('$playerTwoName chose $playerTwoMove.');

    if (winner == 'Player 1') {
      print('Result: $playerOneName wins the round!');
    } else if (winner == 'Player 2') {
      print('Result: $playerTwoName wins the round!');
    } else {
      print('Result: ${winner ?? "It\'s a draw!"}');
    }

    print(
      'Score -> $playerOneName: $playerOneScore | '
      '$playerTwoName: $playerTwoScore',
    );

    stdout.write('Play again? (y/n): ');
    playAgain = stdin.readLineSync()?.trim().toLowerCase() ?? 'n';

    roundNumber++;
  } while (playAgain == 'y');

  print('\n===== FINAL SCORE =====');
  print(
    '$playerOneName: $playerOneScore | '
    '$playerTwoName: $playerTwoScore',
  );

  if (playerOneScore > playerTwoScore) {
    print('Overall winner: $playerOneName');
  } else if (playerTwoScore > playerOneScore) {
    print('Overall winner: $playerTwoName');
  } else {
    print('Overall winner: It\'s a draw!');
  }
}