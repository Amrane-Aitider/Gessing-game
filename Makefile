# Fichier : Makefile
# Cible principale pour générer le README.md
README.md: guessinggame.sh
	@echo "# Le Jeu de Devinettes Bash" > README.md
	@echo "" >> README.md
	@echo "## Date et Heure de la Génération" >> README.md
	# La commande 'date' au format souhaité
	@echo "Le fichier README.md a été généré par 'make' le **$$(date "+%Y-%m-%d à %H:%M:%S %Z")**." >> README.md
	@echo "" >> README.md
	@echo "## Informations sur le Script" >> README.md
	# La commande 'wc -l <guessinggame.sh' compte les lignes. 
	# La variable $(shell ...) capture la sortie de la commande.
	@echo "Le script \`guessinggame.sh\` contient **$$(wc -l < guessinggame.sh | tr -d '[:space:]')** lignes de code." >> README.md
	@echo "" >> README.md
	@echo "### Exécution du Jeu" >> README.md
	@echo "\`\`\`bash" >> README.md
	@echo "bash guessinggame.sh" >> README.md
	@echo "\`\`\`" >> README.md

# Cible 'clean' optionnelle pour le nettoyage
clean:
	rm -f README.md

# Rendre la cible 'README.md' "phony" si nécessaire (bien que non critique ici)
.PHONY: all clean
