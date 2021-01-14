import 'dart:io';
import '../lib/lib.dart';

void main(List<String> arguments) {
  if (Platform.isWindows) {
    print(Process.runSync("cls", [], runInShell: true).stdout);
  } else {
    print(Process.runSync("clear", [], runInShell: true).stdout);
  }
  print("\x1B[2J\x1B[0;0H");
  Game().run();
}
