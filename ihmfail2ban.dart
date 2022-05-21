import 'dart:io';
import 'ihmipset.dart';
import 'ihmprincipal.dart';

class IHMFail2ban {
  static Future<void> menu() async {
    int choix = -1;
    while (choix != 0) {
      print("\x1B[1m" +
          "\x1B[41m" +
          "<------------- Menu Fail2Ban ------------->" +
          "\x1B[0m");
      print("\x1B[1m" + "1- Accéder aux différents services Fail2ban");
      print("\x1B[1m" + "2- Accéder au service IpSet");
      print("\x1B[1m" + "0- Retour au menu précédent" + "\x1B[0m");
      choix = IHMPrincipal.choixMenu(2);
      print(
          "__________________________________________________________________");
      if (choix == 1) {
        await IHMFail2ban.menuService();
      } else if (choix == 2) {
        await IHMIpSet.menu();
      }
    }
    print("Retour au menu principal");
    print("__________________________________________________________________");
    await Future.delayed(Duration(seconds: 2));
  }

  static Future<void> menuService() async {
    int choix = -1;
    while (choix != 0) {
      print("\x1B[1m" +
          "\x1B[41m" +
          "<------------- Services de Fail2ban ------------->" +
          "\x1B[0m");
      print("\x1B[1m" + "\x1B[1m" + "1- Configurer une sécurité manuellement");
      print("\x1B[1m" + "\x1B[1m" + "2- Voir la configuration de la sécurité");
      print("0- Retourner au menu précédent" + "\x1B[0m");
      choix = IHMPrincipal.choixMenu(2);
      print(
          "__________________________________________________________________");

      if (choix == 1) {
        await IHMFail2ban.ConfigSecu();
      } else if (choix == 2) {
        await IHMFail2ban.VoirConfig();
      }
    }
    print("Retour au menu précédent");
    print("__________________________________________________________________");
    await Future.delayed(Duration(seconds: 1));
  }

//a faire fonctionner
  static Future<void> ConfigSecu() async {
    print("\x1B[1m" +
        "\x1B[41m" +
        "<------------- Configuration Sécurité avec Fail2ban ------------->" +
        "\x1B[0m");

    String cmd = "nano /etc/fail2ban/jail.d/defaults-debian.conf";
    Process p = await Process.start("bash", ["-c", cmd]);
    print(p.stdout);
    await Future.delayed(Duration(seconds: 1));
    print("Appuyez sur entrer pour continuer...");
    stdin.readLineSync();
  }

//fonctionnel
  static Future<void> VoirConfig() async {
    print("\x1B[1m" +
        "\x1B[41m" +
        "<------------- Voici la configuration Fail2ban ------------->" +
        "\x1B[0m");
    String cmd = "cat /etc/fail2ban/jail.d/defaults-debian.conf";
    Process p = await Process.start("bash", ["-c", cmd]);
    stdout.addStream(p.stdout);
    await Future.delayed(Duration(seconds: 1));
  }
}
