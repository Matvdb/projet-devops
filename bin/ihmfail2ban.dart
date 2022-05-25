import 'dart:io';
import 'ihmipset.dart';
import 'ihmprincipal.dart';

class IHMFail2ban {
  static Future<void> menu() async {
    int choix = -1;
    while (choix != 0) {
      print("##################### Menu Fail2Ban #####################");
      print("#      1- Accéder aux différents services Fail2ban      #");
      print("#             2- Accéder au service IpSet               #");
      print("#               0- Retour au menu précédent             #");
      print("#########################################################");

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
      print("##################### Services de Fail2ban #####################");
      print("#          1- Configurer une sécurité manuellement             #");
      print("#            2- Voir la configuration de la sécurité           #");
      print("#               0- Retour au menu précédent                    #");
      print("################################################################");

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
    print(
        "############### Configuration Sécurité avec Fail2ban ###############");

    String cmd = "nano /etc/fail2ban/jail.d/defaults-debian.conf";
    Process p = await Process.start("bash", ["-c", cmd]);
    print(p.stdout);
    await Future.delayed(Duration(seconds: 1));
    print("Appuyez sur entrer pour continuer...");
    stdin.readLineSync();
  }

//fonctionnel
  static Future<void> VoirConfig() async {
    print("############### Voici la configuration Fail2ban ###########");
    String cmd = "cat /etc/fail2ban/jail.d/defaults-debian.conf";
    Process p = await Process.start("bash", ["-c", cmd]);
    stdout.addStream(p.stdout);
    await Future.delayed(Duration(seconds: 1));
  }
}
