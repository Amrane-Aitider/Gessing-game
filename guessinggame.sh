#!/usr/bin/env bash
# Fichier : guessinggame.sh

function guessing_game {
  
          local FILE_COUNT=$(find . -maxdepth 1 -type f 2>/dev/null | wc -l)
      local GUESS=-1 

    echo "--- Jeu de Devinez le Nombre de Fichiers ---"
    
   
    while [[ $GUESS -ne $FILE_COUNT ]]
    do
      
        read -p "Combien de fichiers y a-t-il dans le répertoire actuel ? Entrez votre devinette : " GUESS
        
        # S'assurer que l'entrée est un nombre
        if ! [[ "$GUESS" =~ ^[0-9]+$ ]]; then
            echo "Erreur : Veuillez entrer un nombre entier positif."
            continue
            fi

        
         if [[ $GUESS -lt $FILE_COUNT ]]; then
            echo "Votre devinette est TROP BASSE. Essayez encore."
        elif [[ $GUESS -gt $FILE_COUNT ]]; then
            echo "Votre devinette est TROP ÉLEVÉE. Essayez encore."
        else
            # Le bon nombre a été trouvé
                  echo " FÉLICITATIONS ! "
            echo "Vous avez trouvé le bon nombre de fichiers : $FILE_COUNT."
            echo "Le programme va maintenant se terminer."
        fi
    done
}

# Appel de la fonction pour démarrer le jeu
guessing_game
