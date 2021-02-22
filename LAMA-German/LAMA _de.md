# LAMA deutsch

LAMA = Linguistic Automation Management Assistent

Der Einsatz von LAMA beinhaltet einige Schritte, welche in festgelegter Reihenfolge ausgeführt werden müssen:

## Die aktuelle Konfiguration ansehen. (4)

Vor Beginn der Arbeit an den Daten muss zunächst sichergestellt werden, dass Nutzername und Email-Adresse korrekt in LAMA hinterlegt sind.
Um das zu überprüfen, kann die folgende Option verwendet werden:
*@4) Die aktuelle Konfiguration ansehen.@*

Der Nutzername sollte das Muster *@Vorname Nachname@* haben und die Email-Adresse sollte eine gültige Email-Adresse mit dem Muster *@name@mailserver.de@* sein.

## Die Konfiguration aendern (5)

Falls die im vorherigen Punkt erwähnte Konfiguration (Nutzername und Email) nicht korrekt ist oder zum ersten Mal eingerichtet werden muss, kann sie durch Aufruf der folgenden Option geändert werden:
*@5) Die Konfiguration aendern.@*

##  Lokales Repository auf den neuesten Stand bringen. (2)

Bevor man anfängt, an den Dateien zu arbeiten, muss sichergestellt werden, dass auf der aktuellsten Version der Daten gearbeitet wird. 
Die Dateien können per Auswahl der folgenden Option aktualisiert werden: 
*@2) Lokales Repository auf den neuesten Stand bringen.@*.

Hierbei wird zunächst sichergestellt, dass sich keine im Änderungsmodus befindlichen Dateien im lokalen Repository befinden, und dann werden die Dateien mit der letzten öffentlichen Version aktualisiert. 
Wenn es noch unveröffentlichte lokale Änderungen gibt, werden keine Dateien aktualisiert. Um zu sehen, welche Änderungen genau noch vorliegen, wählt man die Option 
*@1) Aktuellen Stand des lokalen Repository anschauen.@*.

## An den Dateien arbeiten

Jetzt kann mit der Arbeit an den Dateien begonnen werden und es können Änderungen vorgenommen werden.

## Alle ausgefuehrten Aenderungen speichern, eine Nachricht hinzufuegen, diese Aenderungen beim Main Repository veroeffentlichen und das lokale Repository auf den neuesten Stand bringen. (3)

Wenn ein Arbeitsschritt fertig ist, können die Änderungen gespeichert werden und den anderen Bearbeitern der Daten zugänglich gemacht werden. Das kann durch Auswahl des folgenden Punkts erfolgen: 
*@3) Alle ausgefuehrten Aenderungen speichern, eine Nachricht hinzufuegen, diese Aenderungen beim Main Repository veroeffentlichen und das lokale Repository auf den neuesten Stand bringen.@*

Dieser Schritt aktualisiert ebenfalls direkt das lokale Repository durch Hinzufügung der Änderungen anderer Bearbeiter, die zur gleichen Zeit erfolgt sind. 

Falls jemand anderes zur gleichen Zeit an den gleichen Dateien gearbeitet, kann es passieren, dass das Skript folgenden Inhalt anzeigt:

<img src="https://gitlab.rrz.uni-hamburg.de/corpus-services/lama/-/raw/main/logo/merge-screenshot.png" alt="Image" width="700" >

Wenn diese Zeilen zu sehen sind, wurde die korrekte Commit-Nachricht bereits automatisch vorausgefüllt. 
Um die Nachricht zu bestätigen und mit der Ausführung des Skripts fortzufahren, drückt man auf *ESC, und dann nacheinander auf die Tasten :wq (w= Speichern, q=Schließen) and drückt anschließend ENTER*.
Wenn die Eingabe von :wq nicht klappt, nachdem man ESC gedrückt hat, drückt man stattdessen auf die Taste i und gibt dann :wq ein und drückt ENTER.
 

Falls zwei Personen gleichzeitig an einem Teil der gleichen Datei gearbeitet haben, kann dieses zu einem Merge-Konflikt führen, den Git nicht automatisch auflösen kann. 
Wenn es hierzu kommt, wird in LAMA eine entsprechende Nachricht angezeigt und eine Datei names ZEITSTEMPEL-git-conflict.txt im bearbeiteten Ordner angelegt.
Solche Arten von Konflikten müssen manuell gelöst werden, entweder von einem Verantwortlichen für das Korpus oder vom technischen Team. In jedem Fall sollte eine/r von beiden kontaktiert werden, um das weitere Vorgehen zu besprechen.
Die Daten sind währenddessen weiterhin gesichert und eine Lösung ist in den meisten Fällen schnell gefunden.

## Weiter arbeiten mit den Dateien und Änderungen speichern, Commit Message hinzufügen, Änderungen im Haupt-Repository veröffentlichen und lokales Git Repository aktualisieren

Jetzt kann an den Dateien weiter gearbeitet werden, und die Änderungen können danach gespeichert und veröffentlicht werden. Bitte daran denken, den ersten Schritt erneut durchzuführen, nachdem eine Pause gemacht wurde. 

Um LAMA zu starten, Doppelklick auf die LAMA-*.sh Datei, welche sich im Ordner befindet, an dem gearbeitet werden soll. 
Das Menü sieht folgendermaßen aus:

<pre>

Willkommen bei Git mit LAMA

 
############### Konfiguration ###############
LAMA Version: 2.0-de
Git Version:
git version 2.7.4
Java Version:
java version "1.8.0_241"
Java(TM) SE Runtime Environment (build 1.8.0_241-b07)
Java HotSpot(TM) 64-Bit Server VM (build 25.241-b07, mixed mode)
Corpus-Services version:  ../hzsk-corpus-services-1.0-jar-with-dependencies.jar
../hzsk-corpus-services-1.0-jar-with-dependencies.jar wurde gefunden. 
Git repository ist erreichbar
#############################################
 
1) Aktuellen Stand des lokalen Repository anschauen.
2) Lokales Repository auf den neuesten Stand bringen.
3) Alle ausgefuehrten Aenderungen speichern, eine Nachricht hinzufuegen, diese Aenderungen beim Main Repository veroeffentlichen und das lokale Repository auf den neuesten Stand bringen.
4) Die aktuelle Konfiguration ansehen.
5) Die Konfiguration aendern.
6) Hilfe!
7) Beenden

Bitte waehle eine Option (1-7) oder druecke ENTER um das Menue anzuzeigen: 

</pre>
