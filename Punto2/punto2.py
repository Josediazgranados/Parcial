def es_identificador(cadena: str) -> bool:
    if len(cadena) == 0:
        return False

    if not cadena[0].isalpha():
        return False

    for ch in cadena[1:]:
        if not (ch.isalpha() or ch.isdigit()):
            return False

    return True


def main():
    archivo = "prueba.txt"
    with open(archivo, "r") as f:
        for linea in f:
            cad = linea.strip()
            if es_identificador(cad):
                print(cad, "-> ACEPTA")
            else:
                print(cad, "-> NO ACEPTA")


if __name__ == "__main__":
    main()
