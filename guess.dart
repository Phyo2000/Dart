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
  late int earn;
  late int answer;
  // late bool play;

  Guess(
      {required this.name,
      required this.balance,
      required this.earn,
      required this.answer});

  void winOrLose() {
    if (earn == answer) {
      print("Congrats! You Win!");
      balance += 2;
      print("Your balance has been added 2 dollars.");
    } else {
      print("Sorry! Your guess is wrong.");
      balance -= 2;
      print("Your balance has been substracted 2 dollars.");
    }
  }
}

void main() {
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
          print("Enter your disire number (only 1 to 9) : ");
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
    int guessNumb = checkNumber(false);
    int ans = Random().nextInt(9) + 1;

    final game1 =
        Guess(name: userName, balance: numb, earn: guessNumb, answer: ans);

    print("----------");
    print("Hello ${game1.name}.");
    print("You have ${game1.balance} dollar(s).");
    print("You guessed ${game1.earn}.");
    print("Random Number is ${game1.answer}.");

    game1.winOrLose();

    print("----------");
    print("Dear ${game1.name}!");
    print("You have ${game1.balance} dollar(s) now.");
    balance1 = game1.balance;

    print("----------");
    print("Do you want to play again? (y/n)");
    String status = stdin.readLineSync()!;
    if (status.toLowerCase() != "y") {
      print("Thanks for playing game.");
      break;
    }
    if (game1.balance < 2) {
      print("Insufficient Balance!");
      print("Thanks for playing game.");
      break;
    }
  }
}
