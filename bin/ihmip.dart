import 'dart:io';
import 'ihmfail2ban.dart';
import 'ihmprincipal.dart';

class IHMip {
  static Future<void> menu() async {
    int choix = -1;
    while (choix != 0) {
      print("##################### Menu Adresse Ip #####################");
      print("#                     1- Ping une IP                      #");
      print("#             2- Voir les adresses ip bannies             #");
      print("#              3- Accéder au service Fail2Ban             #");
      print("#               0- Retour au menu précédent               #");
      print("###########################################################");

      choix = IHMPrincipal.choixMenu(3);
      print(
          "__________________________________________________________________");
      if (choix == 1) {
        await IHMip.PingIP();
      } else if (choix == 2) {
        await IHMip.SelectIP();
      } else if (choix == 3) {
        await IHMFail2ban.menu();
      }
    }
    print("Retour au menu précédent");
    print("__________________________________________________________________");
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> PingIP() async {
    print("\x1B[1m" +
        "\x1B[41m" +
        "<------------- Anaylise d'une IP ------------->" +
        "\x1B[0m");

    print("Veuillez saisir une ip à ping :");
    String a = "";
    stdin.readLineSync();
    String cmd = "ping $a";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    print(p.stdout);
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> SelectIP() async {
    print("\x1B[1m" +
        "\x1B[41m" +
        "<------------- IP bannies ------------->" +
        "\x1B[0m");
    String cmd = "iptables -L";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    print(p.stdout);

    await Future.delayed(Duration(seconds: 1));
  }
}
