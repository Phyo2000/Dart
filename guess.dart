// 1. User Register (including user money)

// 2. Earn ur money

// 3. Guess ur number between 1 to 9

// 4. Calculate win or lose with the process of +2 or -2

// 5. Check user can play to continue and if can, ask to play again

/// This class is to guess the number between 1 to 9 and if you are win , you can play again
/// ```
///
/// ```
import 'dart:io';
import 'dart:math';
import 'dart:async';

class Guess {
  late String name;
  late int balance;
  late int guessNumber;
  late int earn;
  late int answer;
  // late bool play;

  Guess(
      {required this.name,
      required this.balance,
      required this.guessNumber,
      required this.earn,
      required this.answer});

  void winOrLose() {
    if (guessNumber >= answer - 2 && guessNumber <= answer + 2) {
      print("-----------------------------------------------");
      print("CONGRATS! YOU WIN!");
      balance += earn;
      print("Your balance has been added ${earn} dollars.");
    } else {
      print("-----------------------------------------------");
      print("SORRY! YOUR GUESS IS WRONG.");
      balance -= earn;
      print("Your balance has been substracted ${earn} dollars.");
    }
  }
}

void main() async {
  String? userName;
  bool checkReq = false;
  int balance1 = 0;

  while (userName == null || userName.trim().isEmpty) {
    print("Enter your name : ");
    userName = stdin.readLineSync()!;
  }

  while (true) {
    int? numb;
    int checkNumber(bool check) {
      final int max = 9;
      int? number;
      if (check == true) {
        do {
          print("Enter your balance : ");
          number = int.tryParse(stdin.readLineSync()!);
        } while (number == null || number <= 0);
      } else {
        do {
          print("Enter your desire number (only 1 to 9) : ");
          number = int.tryParse(stdin.readLineSync()!);
        } while (number == null || number <= 0 || number > max);
      }
      return number;
    }

    if (checkReq == false) {
      numb = checkNumber(true);
      checkReq = true;
    } else {
      numb = balance1;
    }

    int bet(int maxforBal) {
      int? bet1;
      do {
        print("Enter your desire balance to bet : ");
        bet1 = int.tryParse(stdin.readLineSync()!);
      } while (bet1 == null || bet1 <= 0 || bet1 > maxforBal);

      return bet1;
    }

    int earn1 = bet(numb);
    int guessNumb = checkNumber(false);
    int ans = Random().nextInt(9) + 1;

    final game1 = Guess(
        name: userName,
        balance: numb,
        guessNumber: guessNumb,
        earn: earn1,
        answer: ans);

    print("-----------------------------------------------");
    await Future.delayed(Duration(seconds: 2));
    print("Hello ${game1.name}! Welcome to Guessing Game.");
    await Future.delayed(Duration(seconds: 2));
    print("You have ${game1.balance} dollar(s).");
    await Future.delayed(Duration(seconds: 2));
    print("You put ${game1.earn} dollar(s).");
    await Future.delayed(Duration(seconds: 2));
    print("You guessed ${game1.guessNumber}.");
    await Future.delayed(Duration(seconds: 2));
    print("Random Number is ${game1.answer}. ( Allows +/- 2 )");
    await Future.delayed(Duration(seconds: 2));

    game1.winOrLose();

    await Future.delayed(Duration(seconds: 2));
    print("-----------------------------------------------");
    await Future.delayed(Duration(seconds: 2));
    print("Dear ${game1.name}!");
    await Future.delayed(Duration(seconds: 2));
    print("You have ${game1.balance} dollar(s) now.");
    await Future.delayed(Duration(seconds: 2));

    balance1 = game1.balance;

    print("-----------------------------------------------");
    await Future.delayed(Duration(seconds: 5));

    print("Do you want to play again? (y/n)");
    String status = stdin.readLineSync()!;
    if (status.toLowerCase() != "y") {
      await Future.delayed(Duration(seconds: 2));
      print("-----------------------------------------------");
      print("Thanks for playing game.");
      print("-----------------------------------------------");
      break;
    }
    if (game1.balance == 0) {
      await Future.delayed(Duration(seconds: 3));
      print("-----------------------------------------------");
      print("Insufficient Balance!");
      print("Thanks for playing game.");
      print("-----------------------------------------------");
      break;
    }
  }
}
