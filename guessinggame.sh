#!/usr/bin/env bash
# Fichier : guessinggame.sh

# Déclaration d'une fonction pour le cœur du jeu
function guessing_game {
    # 1. Compter le nombre de fichiers réguliers (non récursif) dans le répertoire courant
    # La commande 'find . -maxdepth 1 -type f' liste uniquement les fichiers
    # dans le répertoire courant (maxdepth 1).
    # 'wc -l' compte le nombre de lignes.
    # '2>/dev/null' supprime les messages d'erreur si la commande échoue.
    local FILE_COUNT=$(find . -maxdepth 1 -type f 2>/dev/null | wc -l)
    local GUESS=-1 

    echo "--- Jeu de Devinez le Nombre de Fichiers ---"
    
    # Début de la boucle, elle continue tant que la devinette n'est pas correcte
    while [[ $GUESS -ne $FILE_COUNT ]]
    do
        # 2. Demander à l'utilisateur de deviner
        read -p "Combien de fichiers y a-t-il dans le répertoire actuel ? Entrez votre devinette : " GUESS
        
        # S'assurer que l'entrée est un nombre
        if ! [[ "$GUESS" =~ ^[0-9]+$ ]]; then
            echo "Erreur : Veuillez entrer un nombre entier positif."
            continue
        fi

        # 3. Instruction 'if' pour comparer la devinette
        if [[ $GUESS -lt $FILE_COUNT ]]; then
            echo "Votre devinette est TROP BASSE. Essayez encore."
        elif [[ $GUESS -gt $FILE_COUNT ]]; then
            echo "Votre devinette est TROP ÉLEVÉE. Essayez encore."
        else
            # Le bon nombre a été trouvé
            echo "🎉 FÉLICITATIONS ! 🎉"
            echo "Vous avez trouvé le bon nombre de fichiers : $FILE_COUNT."
            echo "Le programme va maintenant se terminer."
        fi
    done
}

# Appel de la fonction pour démarrer le jeu
guessing_game
