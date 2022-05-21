import 'ihmprincipal.dart';
import 'dart:io';

import 'mes_fonctions.dart';

class IHMIpSet {
  static Future<void> menu() async {
    int choix = -1;
    while (choix != 0) {
      print("\x1B[1m" +
          "\x1B[41m" +
          "<------------- Menu IpSet ------------->" +
          "\x1B[0m");
      print("\x1B[1m" + "1-" + "\x1B[1m" + " Bloquer mannuellement une IP");
      print("\x1B[1m" + "2-" + "\x1B[1m" + " Voir les IP bloquées");
      print("\x1B[1m" + "3- Bloquer mannuellement un réseau IP");
      print(
          "\x1B[1m" + "\x1B[1m" + "0- Retourner au menu précédent" + "\x1B[0m");
      choix = IHMPrincipal.choixMenu(3);
      print("\x1B[1m" +
          "__________________________________________________________________");

      if (choix == 1) {
        await IHMIpSet.bloquerIP();
      } else if (choix == 2) {
        await IHMIpSet.voirIP();
      } else if (choix == 3) {
        await IHMIpSet.bloquerReseau();
      }
    }
    print("\x1B[1m" + "Retour au menu précédent");
    print("__________________________________________________________________" +
        "\x1B[0m");
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> bloquerIP() async {
    print("\x1B[1m" +
        "\x1B[41m" +
        "<------------- Bloquage d'IP ------------->" +
        "\x1B[0m");

    String cmd = "ipset create maliste hash:net";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    print("La liste a été crée !");
    await Future.delayed(Duration(seconds: 1));

    print("Veuillez saisir l'IP à bloquer: ");
    stdin.readLineSync();
    await Future.delayed(Duration(seconds: 1));

    String a = "192.168.16.96";
    String commande = "ipset add maliste $a";
    ProcessResult result = await Process.run("bash", ["-c", commande]);
    print(result.stdout);

    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> voirIP() async {
    print("\x1B[1m" +
        "\x1B[41m" +
        "<------------- Liste des IP bloquées ------------->" +
        "\x1B[0m");

    String b = "192.168.16.96";
    String cmd = "ipset list maliste";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    print("$b");
    print(p.stdout);

    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> bloquerReseau() async {}
}
