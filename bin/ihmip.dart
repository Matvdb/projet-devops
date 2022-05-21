import 'dart:io';
import 'ihmfail2ban.dart';
import 'ihmprincipal.dart';

class IHMip {
  static Future<void> menu() async {
    int choix = -1;
    while (choix != 0) {
      print("\x1B[1m" +
          "\x1B[41m" +
          "<------------- Menu Adresse Ip ------------->" +
          "\x1B[0m");
      print("\x1B[1m" + "1-" + "\x1B[1m" + "Bannir une adresse ip");
      print("\x1B[1m" + "2-" + "\x1B[1m" + "Voir les adresses ip bannies");
      print("\x1B[1m" + "3-" + "\x1B[1m" + "Accéder au service Fail2Ban");
      print("\x1B[1m" +
          "0-" +
          "\x1B[1m" +
          "Retour au mennu principal ..." +
          "\x1B[0m");
      choix = IHMPrincipal.choixMenu(3);
      print(
          "__________________________________________________________________");
      if (choix == 1) {
        await IHMip.BanIP();
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

  static Future<void> BanIP() async {
    print("\x1B[1m" +
        "\x1B[41m" +
        "<------------- Bannir une IP ------------->" +
        "\x1B[0m");

    String cmd = "";
    Process p = await Process.start("bash", ["-c", cmd]);
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
