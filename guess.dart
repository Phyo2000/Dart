// 1. User Register (including user money)

// 2. Earn ur money

// 3. Guess ur number between 1 to 9

// 4. Calculate win or lose with the process of +2 or -2

// 5. Check user can play to continue and if can, ask to paly again

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
  late bool play;

  Guess({required this.name, required this.balance, required this.earn});

  // String getName() {
  //   print("Enter your name : ");
  //   name = stdin.readLineSync()!;
  //   return name;
  //}

  void winOrLose() {}
}

void main() {
  String? userName;

  while (userName == null || userName.trim().isEmpty) {
    print("Enter your name : ");
    userName = stdin.readLineSync()!;
  }

  // void checkNumber(int? number) {
  //   while (number == null || (number.isNegative && number == 0)) {
  //     numb = number;
  //   }
  // }

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

  int numb = checkNumber(true);
  int guessNumb = checkNumber(false);
  int answer = Random().nextInt(9) + 1;

  final game1 = Guess(name: userName, balance: numb, earn: guessNumb);

  print("----------");
  print("Hello ${game1.name}.");
  print("You have ${game1.balance} dollor(s).");
  print("You guessed ${game1.earn}.");
  print("Random Number is $answer.");
}
