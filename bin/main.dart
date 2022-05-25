import 'dart:io';

import 'ihmprincipal.dart';

main(List<String> args) async {
  String installation = "apt install fail2ban";
  ProcessResult i = await Process.run("bash", ["-c", installation]);
  String installation2 = "apt install ipset";
  ProcessResult p1 = await Process.run("bash", ["-c", installation2]);
  IHMPrincipal.bienvenue();
  await IHMPrincipal.menu();
  IHMPrincipal.quitter();
}
