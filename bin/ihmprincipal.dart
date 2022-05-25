import 'dart:io';

import 'ihmfail2ban.dart';
import 'ihmip.dart';
import 'ihmipset.dart';

class IHMPrincipal {
  static void bienvenue() {
    print("\x1B[1m " + "\x1B[41m");
    print("<<<<<<<<<<<<<< Bienvenue dans le projet DevOps >>>>>>>>>>>>>>>");
    print("\x1B[0m");
    print("");
  }

  static void quitter() {
    print("bye bye");
  }

  static int choixMenu(int nbChoix) {
    bool saisieValide = false;
    int i = -1;
    while (!saisieValide) {
      print(">> Veuillez saisir une action (0-$nbChoix)");
      try {
        i = int.parse(stdin.readLineSync().toString());
        if (i >= 0 && i <= nbChoix) {
          saisieValide = true;
        } else {
          print(
              "La saisie est invalide, veuillez saisir une action existante.");
        }
      } catch (e) {
        print("Erreur dans la saisie, veuillez recommencer");
      }
    }
    return i;
  }

  static bool confirmation() {
    bool saisieValide = false;
    bool confirme = false;
    while (!saisieValide) {
      print("Confirmez-vous cette action ? (o:n)");
      String reponse = stdin.readLineSync().toString();
      if (reponse.toLowerCase() == "o") {
        saisieValide = true;
        confirme = true;
      } else if (reponse.toLowerCase() == "n") {
        saisieValide = true;
        print("Annulation");
      } else {
        print("Erreur");
      }
    }
    return confirme;
  }

  static void wait() {
    print("Appuyez sur entrer pour continuer...");
    stdin.readLineSync();
  }

  static Future<int> menu() async {
    int choix = -1;
    while (choix != 0) {
      print("\x1B[2J\x1B[0;0H"
              "\x1B[41m" +
          "\x1B[1m" +
          "############## Menu Principal ##############");
      print("#      1- Accéder au service Fail2Ban      #");
      print("#             2- Accéder aux IP            #");
      print("#         3- Accéder au service Ipset      #");
      print("#               0- Quitter                 #");
      print("############################################" + "\x1B[0m");

      choix = IHMPrincipal.choixMenu(3);

      if (choix == 1) {
        await IHMFail2ban.menu();
      } else if (choix == 2) {
        await IHMip.menu();
      } else if (choix == 3) {
        await IHMIpSet.menu();
      }
      print("Voulez-vous vraiment quitter ?");
    }
    await Future.delayed(Duration(seconds: 1));
    return 0;
  }
}
