import 'dart:math';

String generateId() {
  List<String> uppercaseAlphabet =
      List.generate(26, (index) => String.fromCharCode(65 + index));
  List<String> numbers = List.generate(10, (index) => "$index");
  List<String> lowercaseAlphabet =
      List.generate(26, (index) => String.fromCharCode(97 + index));
  Random random = Random();
  List allCharacters = uppercaseAlphabet + lowercaseAlphabet + numbers;
  final String id = List.generate(
          10, (index) => allCharacters[random.nextInt(allCharacters.length)])
      .join();
  return id;
}
