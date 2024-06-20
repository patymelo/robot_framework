
#!/usr/bin/env python3

import os
from robot.run import run

def executar_teste(caminho_teste, nome_teste,diretorio_resultado,tag_teste):
    # Criar diretório de resultados se não existir
    print(f"O caminho_teste é: {caminho_teste}")
    print(f"O nome_teste é: {nome_teste}")
    print(f"O diretorio_resultado é: {diretorio_resultado}")
    print(f"O tag_teste é: {tag_teste}")

    if not os.path.exists(diretorio_resultado):
        os.makedirs(diretorio_resultado)

    # Executar testes
    print(f"Iniciar execução teste")
    run(caminho_teste, variable=['BROWSER:chrome'], name=nome_teste,outputdir=diretorio_resultado,include=tag_teste)
    print(f"Fim execução teste")
