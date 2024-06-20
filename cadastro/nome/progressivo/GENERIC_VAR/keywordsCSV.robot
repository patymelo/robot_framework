*** Keywords ***
Salvar resultado ${result} na planilha CSV ${dir_name} utilizando header ${header}
    [Documentation]  Converte o resultado de uma consulta SQL em um arquivo CSV e salva esse arquivo no diretório informado
    ${arqcsv}=  Set Variable   ${dir_name}.csv
    Create File  ${arqcsv}
    ${header_string}  Convert List To Comma Seperated String   ${header}

    # Create the header
    Append To File  ${arqcsv}  ${header_string}

    # Append all the values row by row
    ${NumRowns} =      Get Length    ${result}
    FOR  ${indexRown}  IN RANGE  0  ${NumRowns}
        ${NumColumns}=  Get Length  ${result[${indexRown}]}
        @{random_row_list}  Create List
        FOR  ${indexColumn}  IN RANGE  0  ${NumColumns}
            ${value}   Convert To String  ${result[${indexRown}][${indexColumn}]}
            Append To List  ${random_row_list}  ${value}
        END
        ${row_values}  Convert List To Comma Seperated String   ${random_row_list}
        Append To File  ${arqcsv}  \n${row_values}
    END

o usuário exporta em arquivo CSV os registros inluidos na tabela EXTR_FILA_ATUALIZACAO para o CNPJ ${cnpj}
    ${results}=                 Consulta fila EXTR_FILA_ATUALIZACAO bucando o valor ${cnpj} no parametro e data inclusao entre ${hora_inicio} e ${hora_fim}
    Salvar resultado ${results} na planilha CSV ${PATH_CSV}\\${TAG_NUMBER}-EXTR_FILA_ATUALIZACAO utilizando header ${header_resultado_extrato}

o usuário exporta em arquivo CSV os registros inluidos na tabela TCTPEVENTO_CADASTRO_B3I para o CNPJ ${cnpj}
    ${results}=                 Consulta fila TCTPEVENTO_CADASTRO_B3I bucando o valor ${cnpj} no parametro e data inclusao entre ${hora_inicio} e ${hora_fim}
    Converter resultado XML ${results} em planilha csv com nome ${TAG_NUMBER}-TCTPEVENTO_CADASTRO_B3I utilizando o header ${header_resultado_evento_cadastro}
