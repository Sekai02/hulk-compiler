#include <iostream>
#include <cstdlib>
#include "../include/tokens.hh"

extern int yyparse();
extern FILE* yyin;

int main(int argc, char* argv[]) {
    if (argc != 2) {
        std::cerr << "Uso: " << argv[0] << " <archivo.bs>\n";
        return EXIT_FAILURE;
    }

    yyin = fopen(argv[1], "r");
    if (!yyin) {
        std::cerr << "Error: No se pudo abrir el archivo " << argv[1] << "\n";
        return EXIT_FAILURE;
    }

    std::cout << "Analizando " << argv[1] << "...\n";
    
    // Ejecutar el parser
    int result = yyparse();
    
    fclose(yyin);

    if (result == 0) {
        std::cout << "Análisis completado: No se encontraron errores sintácticos";
        return EXIT_SUCCESS;
    } else {
        std::cout << "Se encontraron errores durante el análisis";
        return EXIT_FAILURE;
    }
}