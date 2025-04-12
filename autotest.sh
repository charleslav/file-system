#!/bin/bash

# Couleurs pour les messages
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}=== Script d'exécution automatique des tests FileSystem ===${NC}"

# Vérifier que nous sommes dans le bon répertoire (avec le CMakeLists.txt)
if [ ! -f "CMakeLists.txt" ]; then
    echo -e "${RED}Erreur: Ce script doit être exécuté depuis le répertoire racine du projet${NC}"
    exit 1
fi

# Créer le répertoire de build s'il n'existe pas
echo -e "${YELLOW}Configuration du projet avec CMake...${NC}"
cmake -Bbuild

# Vérifier si la commande précédente a réussi
if [ $? -ne 0 ]; then
    echo -e "${RED}Échec de la configuration CMake${NC}"
    exit 1
fi

# Compiler le projet
echo -e "${YELLOW}Compilation du projet...${NC}"
cmake --build build

# Vérifier si la compilation a réussi
if [ $? -ne 0 ]; then
    echo -e "${RED}Échec de la compilation${NC}"
    exit 1
fi

# Utiliser ceci pour exécuter directement les tests avec leurs couleurs
echo -e "${YELLOW}Exécution des tests...${NC}"
for test_bin in build/*test*.out; do
    echo -e "${YELLOW}Exécution de $test_bin...${NC}"
    $test_bin
    
    # Vérifier si le test a réussi
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✓ Test réussi!${NC}"
    else
        echo -e "${RED}✗ Test échoué${NC}"
        test_failed=1
    fi
    echo ""
done

# Vérifier si un test a échoué
if [ -n "$test_failed" ]; then
    echo -e "${RED}Certains tests ont échoué${NC}"
    exit 1
else
    echo -e "${GREEN}Tous les tests ont réussi!${NC}"
fi


exit 0