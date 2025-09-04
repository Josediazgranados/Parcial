def gramatica(cadena):
    i = 0
    a = 0
    b = 0
    c = 0

    # Contar 'a's
    while i < len(cadena) and cadena[i] == 'a':
        a += 1
        i += 1

    # Contar 'b's
    while i < len(cadena) and cadena[i] == 'b':
        b += 1
        i += 1

    # Contar 'c's
    while i < len(cadena) and cadena[i] == 'c':
        c += 1
        i += 1

    return i == len(cadena)


def main():
    archivo = "prueba.txt" 
    with open(archivo, "r") as f:
        for linea in f:
            cad = linea.strip()
            if gramatica(cad):
                print(cad, "-> ACEPTA")
            else:
                print(cad, "-> NO ACEPTA")


if __name__ == "__main__":
    main()

