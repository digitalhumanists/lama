#!/bin/bash

today=$(date)
timestamp=$(date +%Y%m%d%H%M%S)
remote="origin" #bitte den Namen des Remote Repository einfuegen
branch="main" #bitte den Namen des entsprechenden branches einfuegen
conflictPath="${timestamp}-conflict.txt"
SCRIPT=`realpath $0`
directory=`dirname $SCRIPT`
corpusServicesJar="../corpus-services-1.0.jar" #bitte den Pfad zur corpus-services jar Datei einfuegen
user=`git config user.name`
user="${user%\"}"
user="${user#\"}"
#Messages im Skript
conflictecho="ACHTUNG: Das lokale Repository kann nicht auf den neuesten Stand gebracht werden, weil ein Konflikt vorliegt. Der Merge Prozess wird abgebrochen und eine Nachricht wird an die Git Maintainer gesendet."
pullsuccessful="Das Updaten der Dateien war erfolgreich, vielen Dank."
jarnotfound="Die JAR Datei ist nicht verfuegbar in ${directory} von ${user}."
localchanges="ACHTUNG: There are local changes on the files. Please remove them or save them with LAMA before updating."
nolocalchanges="Es liegen keine lokalen Aenderungen vor." 
#Messages fuer Mattermost oder in Konflikt Text Dateien
conflictmessage="ACHTUNG: Der Konflikt muss manuell geloest werden in ${directory} von ${user}."
#dieser Fehler kann auftreten wenn große binaere Dateien ohne git lfs comitted werden
pullerror="ACHTUNG: Der Pull konnte nicht durchgefuehrt werden in ${directory} von ${user}."
#Mattermost hook URL
mattermosturl="https://your.mattermost.server.com/mattermost/hooks/HOOKSHA"
#oder fuer mehrere repositories und entsprechende Mattermost Channels
#if [[ "$(git config --get remote.origin.url)" == reponame.git ]]; then
#    mattermosturl="https://your.mattermost.server.com/mattermost/hooks/HOOKSHA"
#elif [[ "$(git config --get remote.origin.url)" == otherreponame.git ]]; then
#    mattermosturl="https://your.mattermost.server.com/mattermost/hooks/HOOKSHA"
#else
#    mattermosturl="https://your.mattermost.server.com/mattermost/hooks/HOOKSHA"
#fi																	 
version="3.0-de" #Version von LAMA

echo "

.____       _____      _____      _____   
|    |     /  _  \    /     \    /  _  \  
|    |    /  /_\  \  /  \ /  \  /  /_\  \ 
|    |___/    |    \/    Y    \/    |    \
|
|_______ \____|__  /\____|__  /\____|__  /
        \/       \/         \/         \/ 



Willkommen bei Git mit LAMA
"
echo " "
echo "############### Konfiguration ###############"
echo "LAMA Version: ${version}"
echo "Git Version:" 
git --version            
echo "Java Version:" 
java -version
echo "Corpus-Services version: " $corpusServicesJar
if [ -f "$corpusServicesJar" ]; then
    echo "$corpusServicesJar wurde gefunden. "
else 
    echo "FEHLER: $corpusServicesJar wurde nicht gefunden. "
    #curl -i -X POST --data-urlencode "payload={\"text\": \"${jarnotfound}\"}" ${mattermosturl}
fi
if [ "$(git ls-remote 2> /dev/null)" ]; then
    echo "Git repository ist erreichbar"
else
    echo "FEHLER: Git repository ist nicht erreichbar"
fi
echo "#############################################"
echo " "

#options=("Viewing your current Git configuration." "Setting up your Git configuration." "See the current state of your local Git repository." "See the changes in the files of your local Git repository." "Update your local Git repository." "Save all your changes, add a message, publish your changes to the main Git repository and update your local Git repository." "Help!" "Quit")
options=("Aktuellen Stand des lokalen Repository anschauen." "Lokales Repository auf den neuesten Stand bringen." "Alle ausgefuehrten Aenderungen speichern, eine Nachricht hinzufuegen, diese Aenderungen beim Main Repository veroeffentlichen und das lokale Repository auf den neuesten Stand bringen." "Die aktuelle Konfiguration ansehen." "Die Konfiguration aendern." "Hilfe!" "Beenden")
PS3="
Bitte waehle eine Option (1-${#options[@]}) oder druecke ENTER um das Menue anzuzeigen: "
select opt in "${options[@]}"
do
	case $opt in
		"Die aktuelle Konfiguration ansehen.")
			echo "Name:"	
			git config user.name
			echo "Email-Adresse:"
			git config user.email
			;;
		"Die Konfiguration aendern.")
			read -p "Vorname Nachname eingeben: " usrname
					 git config --global user.name "\"$usrname\""
			read -p "Email-Adresse eingeben: " usrmail
					 git config --global user.email "\"$usrmail\""
            echo "Danke dass Sie Ihren Nutzernamen zu"
            git config user.name
            echo "und Ihre Nutzeremail zu"
            git config user.email
            echo "geandert haben!"
			;;
		"Aktuellen Stand des lokalen Repository anschauen.")
			git status
			;;		
		"Lokales Repository auf den neuesten Stand bringen.")
			CONFLICTS=$(git ls-files -u | wc -l)
			if [ "$CONFLICTS" -gt 0 ]
				then
                    echo $conflictecho
                    #this is important so people can work further on the files and the conflict can be solved later
					git merge --abort
					git status >> $conflictPath
					echo $conflictmessage >> $conflictPath
					curl -i -X POST --data-urlencode "payload={\"text\": \"${conflictmessage}\"}" ${mattermosturl}
					read
					exit 1
				else
					if [ -z "$(git status --porcelain)" ] 
													then
														echo $nolocalchanges
                                                        echo "Das Updaten wird vorbereitet."
														git fetch
														git merge ${remote}/${branch}  
														CONFLICTS=$(git ls-files -u | wc -l)
														if [ "$CONFLICTS" -gt 0 ]
															then
																echo $conflictecho
                                                                #this is important so people can work further on the files and the conflict can be solved later
																git merge --abort
																git status >> $conflictPath
																echo $conflictmessage >> $conflictPath
																curl -i -X POST --data-urlencode "payload={\"text\": \"${conflictmessage}\"}" ${mattermosturl}
																read
                                                                exit 1
														else											
                                                                echo "Updating will be carried out." 
														fi
														if [ -z "$(git status --porcelain)" ] 
															then
																echo $pullsuccessful
														else
																git status
																echo $pullerror
																git status >> $conflictPath
																echo $pullerror >> $conflictPath
																curl -i -X POST --data-urlencode "payload={\"text\": \"${$pullerror}\"}" ${mattermosturl}
																read																
														fi	
													else									            								            
														git status
														echo $localchanges
														read														
					fi				
			fi
			;;	
		"Alle ausgefuehrten Aenderungen speichern, eine Nachricht hinzufuegen, diese Aenderungen beim Main Repository veroeffentlichen und das lokale Repository auf den neuesten Stand bringen.")
			CONFLICTS=$(git ls-files -u | wc -l)
			if [ "$CONFLICTS" -gt 0 ]
				then
                    echo $conflictecho
                    #this is important so people can work further on the files and the conflict can be solved later
				    git merge --abort
				    git status >> $conflictPath
				    echo $conflictmessage >> $conflictPath
				    curl -i -X POST --data-urlencode "payload={\"text\": \"${conflictmessage}\"}" ${mattermosturl}
				    read
                    exit 1
				else
					echo "Super, es gibt bisher keinen Merge Konflikt."
						#show all the files that are changed and ask if they should be added
						echo "Die geanderten Dateien sind:"
						git status
						read -p "Sollen folgende geaenderte Dateien im Main Repository veroeffentlicht werden? (j/n)" yn
						case $yn in
							[YyJj]* ) 
									while true; do
										read -p "Commit Nachricht eingeben: " message		
										echo "Die Commit Nachricht ist: $message"
										read -p "Ist die Nachricht korrekt? (j/n)" yn2
										case $yn2 in
											[YyJj]* )	break;;
											[Nn]* )  	echo "Bitte Nachricht erneut eingeben";;		
											* ) 		echo "Bitte mit j (ja) oder n (nein) antworten.";;
										esac
									done		
									git add -A
									git commit -m "$message"
									java -Xmx3g -jar $corpusServicesJar -i $directory -o $directory/prettyprint-output.html -c RemoveAutoSaveExb -c PrettyPrintData -f
									git add -A 
									git reset -- curation/CorpusServices_Errors.xml
									git checkout curation/CorpusServices_Errors.xml
									git commit -m "Automatically pretty printed on $today" 
									git fetch
									git merge ${remote}/${branch} 
									CONFLICTS=$(git ls-files -u | wc -l)
									if [ "$CONFLICTS" -gt 0 ]
										then
											echo $conflictecho
											git merge --abort
											echo $conflictmessage >> $conflictPath
											curl -i -X POST --data-urlencode "payload={\"text\": \"${conflictmessage}\"}" ${mattermosturl}
											echo "ACHTUNG: Der Vorgang wurde abgebrochen und LAMA-${version} wird geschlossen."																		   
											read
											exit
									else
											echo "Merging war erfolgreich bzw. nicht noetig." 
											git push $remote $branch
									fi
									if [ -z "$(git status --porcelain)" ] 
										then
											echo $pullsuccessful
											read	
									else
											git status
											echo "ACHTUNG: Der Pull konnte nicht korrekt durchgefuehrt werden. Bitte reparieren Sie den Pull."
											git status >> $conflictPath
											echo $pullerror >> $conflictPath
											curl -i -X POST --data-urlencode "payload={\"text\": \"$pullerror\"}" ${mattermosturl}
											read		
									fi												
									;;		
							[Nn]* ) echo "Der Vorgang wurde abgebrochen.";;
							* ) echo "Bitte mit j (ja) oder n (nein) antworten.";;
						esac				
			fi
			;;
		"Hilfe!")
			clear
			echo "Dieses Skript kann genutzt werden, um Aenderungen, die lokal gemacht wurden, dem Main Git Repository hinzuzufuegen, sodass alle, die mit den Daten arbeiten, sie sehen und nutzen koennen. "
			echo "Bitte ENTER druecken um das Menue anzuzeigen und die Nummer des Vorgangs, der ausgefuehrt werden soll, eingeben und mit ENTER bestaetigen. "
			echo "Wenn ein Konflikt oder ein Fehler auftritt bitte beim technischen Team melden. "
			echo " "
            echo "LAMA Version: ${version}"
            echo "Git Version:" 
            git --version            
            echo "Java Version:" 
            java -version
            echo "Corpus-Services version: " $corpusServicesJar
            if [ -f "$corpusServicesJar" ]; then
                echo "$corpusServicesJar wurde gefunden. "
            else 
                echo "FEHLER: $corpusServicesJar wurde nicht gefunden. "
				curl -i -X POST --data-urlencode "payload={\"text\": \"${jarnotfound}\"}" ${mattermosturl}
            fi
            if [ "$(git ls-remote 2> /dev/null)" ]; then
                echo "Git repository ist erreichbar"
            else
                echo "FEHLER: Git repository ist nicht erreichbar"
            fi
			;;
		"Beenden")
			clear
			break
			;;
		*) echo "ACHTUNG: Die Option $REPLY ist nicht verfuegbar.";;
	esac
done




