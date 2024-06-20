*** Keywords ***
que eu realize o cadastro de um novo participante emissor BANCO MULTIPLO 01 utilizando dados do ITAUBM para preencher a familia
    que eu defina a variavel TIPO_PARTICIPACAO com o valor PARTICIPANTE como uma variavel global
    que eu defina a variavel NATUREZA_JURIDICA com o valor EMPRESA PUBLICA como uma variavel global
    que eu defina a variavel GRUPOECON com o valor WEB-ROBOT como uma variavel global
    que eu defina a variavel HABILITA_COMPROMISSADA com o valor Sim como uma variavel global
    que eu realize o cadastro previo de um participante EMISSOR com natureza economica BANCO MULTIPLO 01
    que eu valide se o cadastro web foi realizado com sucesso
    Close Browser

    que eu defina a variavel TIPO_PARTICIPACAO com o valor PARTICIPANTE como uma variavel global
    que eu defina a variavel tipo_ficha com o valor EMISSOR como uma variavel global
    que eu defina a variavel HABILITA_COMPROMISSADA com o valor Sim como uma variavel global
    que eu defina a variavel NATUREZA_ECONOMICA com o valor BANCO MULTIPLO 01 como uma variavel global
    que eu defina a variavel TIPO_CONTA com o valor EMISSORA CETIP (40) como uma variavel global
    que eu defina a variavel MALOTE_NOME_CONTA com o valor 73410 como uma variavel global
    que eu defina a variavel MALOTE_NOME com o valor 73410 como uma variavel global
    que eu defina a variavel MALOTE_PRACA com o valor SP como uma variavel global
    que eu defina a variavel LIQUIDANTE_FAMILIA_NOME_SIMPLIFICADO com o valor ITAUBM como uma variavel global
    que eu defina a variavel LIQUIDANTE_FAMILIA_NOME com o valor ITAUBM como uma variavel global
    que eu defina a variavel LIQUIDANTE com o valor ITAUBM como uma variavel global
    que eu defina a variavel SIGLA_NOME_SIMPL com o valor BM como uma variavel global
    que eu realize a efetivacao no sistema NoMe informando familia de outro participante e utilizando o protocolo ${numberProtocol}
    Close Browser
que eu realize o cadastro de um novo participante emissor ACUCAR E ALCOOL utilizando dados do ITAUBM para preencher a familia
    que eu defina a variavel TIPO_PARTICIPACAO com o valor PARTICIPANTE como uma variavel global
    que eu defina a variavel NATUREZA_JURIDICA com o valor EMPRESA PUBLICA como uma variavel global
    que eu defina a variavel GRUPOECON com o valor WEB-ROBOT como uma variavel global
    que eu defina a variavel HABILITA_COMPROMISSADA com o valor Não como uma variavel global
    que eu realize o cadastro previo de um participante EMISSOR com natureza economica ACUCAR E ALCOOL
    que eu valide se o cadastro web foi realizado com sucesso
    Close Browser

    que eu defina a variavel TIPO_PARTICIPACAO com o valor PARTICIPANTE como uma variavel global
    que eu defina a variavel tipo_ficha com o valor EMISSOR como uma variavel global
    que eu defina a variavel HABILITA_COMPROMISSADA com o valor Não como uma variavel global
    que eu defina a variavel NATUREZA_ECONOMICA com o valor ACUCAR E ALCOOL como uma variavel global
    que eu defina a variavel TIPO_CONTA com o valor EMISSORA CETIP (40) como uma variavel global
    que eu defina a variavel MALOTE_NOME_CONTA com o valor 73410 como uma variavel global
    que eu defina a variavel MALOTE_NOME com o valor 73410 como uma variavel global
    que eu defina a variavel MALOTE_PRACA com o valor SP como uma variavel global
    que eu defina a variavel LIQUIDANTE_FAMILIA_NOME_SIMPLIFICADO com o valor ITAUBM como uma variavel global
    que eu defina a variavel LIQUIDANTE_FAMILIA_NOME com o valor ITAUBM como uma variavel global
    que eu defina a variavel LIQUIDANTE com o valor ITAUBM como uma variavel global
    que eu defina a variavel SIGLA_NOME_SIMPL com o valor ${EMPTY} como uma variavel global
    que eu realize a efetivacao no sistema NoMe informando familia de outro participante e utilizando o protocolo ${numberProtocol}
    Close Browser
que eu realize o cadastro de um novo participante INVESTIDOR NAO RESIDENTE utilizando dados do RIOBM para preencher a familia
    que eu defina a variavel NATUREZA_JURIDICA com o valor EMPRESA PUBLICA como uma variavel global
    que eu defina a variavel GRUPOECON com o valor WEB-ROBOT como uma variavel global
    que eu realize o cadastro previo de um participante INR com natureza economica INVESTIDOR NAO RESIDENTE
    que eu valide se o cadastro web INR foi realizado com sucesso
    Close Browser

    que eu defina a variavel TIPO_PARTICIPACAO com o valor PARTICIPANTE como uma variavel global
    que eu defina a variavel tipo_ficha com o valor INR como uma variavel global
    que eu defina a variavel HABILITA_COMPROMISSADA com o valor Sim como uma variavel global
    que eu defina a variavel SIGLA_NOME_SIMPL com o valor ${EMPTY} como uma variavel global
    que eu defina a variavel TIPO_CONTA com o valor PROPRIA (00) como uma variavel global
    que eu defina a variavel MALOTE_NOME_CONTA com o valor 05000 como uma variavel global
    que eu defina a variavel MALOTE_NOME com o valor 05000 como uma variavel global
    que eu defina a variavel MALOTE_PRACA com o valor SP como uma variavel global
    que eu defina a variavel LIQUIDANTE_FAMILIA_NOME_SIMPLIFICADO com o valor RIOBM como uma variavel global
    que eu defina a variavel LIQUIDANTE_FAMILIA_NOME com o valor RIOCUST como uma variavel global
    que eu defina a variavel LIQUIDANTE com o valor RIOBM como uma variavel global
    que eu realize a efetivacao no sistema NoMe informando familia de outro participante e utilizando o protocolo ${numberProtocol}
    Close Browser
que eu realize o cadastro de um novo participante demais participantes BANCO MULTIPLO 01 utilizando dados do ITAUBM para preencher a familia
    que eu defina a variavel TIPO_PARTICIPACAO com o valor PARTICIPANTE como uma variavel global
    que eu defina a variavel NATUREZA_JURIDICA com o valor EMPRESA PUBLICA como uma variavel global
    que eu defina a variavel GRUPOECON com o valor WEB-ROBOT como uma variavel global
    que eu defina a variavel HABILITA_COMPROMISSADA com o valor Sim como uma variavel global
    que eu realize o cadastro previo de um participante DEMAIS com natureza economica BANCO MULTIPLO 01
    que eu valide se o cadastro web foi realizado com sucesso
    Close Browser

    que eu defina a variavel TIPO_PARTICIPACAO com o valor PARTICIPANTE como uma variavel global
    que eu defina a variavel tipo_ficha com o valor DEMAIS como uma variavel global
    que eu defina a variavel HABILITA_COMPROMISSADA com o valor Sim como uma variavel global
    que eu defina a variavel NATUREZA_ECONOMICA com o valor BANCO MULTIPLO 01 como uma variavel global
    que eu defina a variavel TIPO_CONTA com o valor PROPRIA (00) como uma variavel global
    que eu defina a variavel MALOTE_NOME_CONTA com o valor 73410 como uma variavel global
    que eu defina a variavel MALOTE_NOME com o valor 73410 como uma variavel global
    que eu defina a variavel MALOTE_PRACA com o valor SP como uma variavel global
    que eu defina a variavel LIQUIDANTE_FAMILIA_NOME_SIMPLIFICADO com o valor ITAUBM como uma variavel global
    que eu defina a variavel LIQUIDANTE_FAMILIA_NOME com o valor ITAUBM como uma variavel global
    que eu defina a variavel LIQUIDANTE com o valor ITAUBM como uma variavel global
    que eu defina a variavel SIGLA_NOME_SIMPL com o valor BM como uma variavel global
    que eu realize a efetivacao no sistema NoMe informando familia de outro participante e utilizando o protocolo ${numberProtocol}
    Close Browser
que eu realize o cadastro de um novo participante demais participantes ACUCAR E ALCOOL utilizando dados do ITAUBM para preencher a familia
    que eu defina a variavel TIPO_PARTICIPACAO com o valor PARTICIPANTE como uma variavel global
    que eu defina a variavel NATUREZA_JURIDICA com o valor EMPRESA PUBLICA como uma variavel global
    que eu defina a variavel GRUPOECON com o valor WEB-ROBOT como uma variavel global
    que eu defina a variavel HABILITA_COMPROMISSADA com o valor Não como uma variavel global
    que eu realize o cadastro previo de um participante DEMAIS com natureza economica ACUCAR E ALCOOL
    que eu valide se o cadastro web foi realizado com sucesso
    Close Browser

    que eu defina a variavel TIPO_PARTICIPACAO com o valor PARTICIPANTE como uma variavel global
    que eu defina a variavel tipo_ficha com o valor DEMAIS como uma variavel global
    que eu defina a variavel HABILITA_COMPROMISSADA com o valor Não como uma variavel global
    que eu defina a variavel NATUREZA_ECONOMICA com o valor ACUCAR E ALCOOL como uma variavel global
    que eu defina a variavel TIPO_CONTA com o valor PROPRIA (00) como uma variavel global
    que eu defina a variavel MALOTE_NOME_CONTA com o valor 73410 como uma variavel global
    que eu defina a variavel MALOTE_NOME com o valor 73410 como uma variavel global
    que eu defina a variavel MALOTE_PRACA com o valor SP como uma variavel global
    que eu defina a variavel LIQUIDANTE_FAMILIA_NOME_SIMPLIFICADO com o valor ITAUBM como uma variavel global
    que eu defina a variavel LIQUIDANTE_FAMILIA_NOME com o valor ITAUBM como uma variavel global
    que eu defina a variavel LIQUIDANTE com o valor ITAUBM como uma variavel global
    que eu defina a variavel SIGLA_NOME_SIMPL com o valor ${EMPTY} como uma variavel global
    que eu realize a efetivacao no sistema NoMe informando familia de outro participante e utilizando o protocolo ${numberProtocol}
    Close Browser
que eu realize o cadastro de um novo participante instituição financeira BANCO MULTIPLO 01 utilizando dados do ITAUBM para preencher a familia
    que eu defina a variavel TIPO_PARTICIPACAO com o valor PARTICIPANTE como uma variavel global
    que eu defina a variavel NATUREZA_JURIDICA com o valor EMPRESA PUBLICA como uma variavel global
    que eu defina a variavel GRUPOECON com o valor WEB-ROBOT como uma variavel global
    que eu defina a variavel HABILITA_COMPROMISSADA com o valor Sim como uma variavel global
    que eu realize o cadastro previo de um participante INSTITUICAO com natureza economica BANCO MULTIPLO 01
    que eu valide se o cadastro web foi realizado com sucesso
    Close Browser

    que eu defina a variavel TIPO_PARTICIPACAO com o valor PARTICIPANTE como uma variavel global
    que eu defina a variavel tipo_ficha com o valor INSTITUICAO como uma variavel global
    que eu defina a variavel HABILITA_COMPROMISSADA com o valor Sim como uma variavel global
    que eu defina a variavel NATUREZA_ECONOMICA com o valor BANCO MULTIPLO 01 como uma variavel global
    que eu defina a variavel TIPO_CONTA com o valor PROPRIA (00) como uma variavel global
    que eu defina a variavel MALOTE_NOME_CONTA com o valor 73410 como uma variavel global
    que eu defina a variavel MALOTE_NOME com o valor 73410 como uma variavel global
    que eu defina a variavel MALOTE_PRACA com o valor SP como uma variavel global
    que eu defina a variavel LIQUIDANTE_FAMILIA_NOME_SIMPLIFICADO com o valor ITAUBM como uma variavel global
    que eu defina a variavel LIQUIDANTE_FAMILIA_NOME com o valor ITAUBM como uma variavel global
    que eu defina a variavel LIQUIDANTE com o valor ITAUBM como uma variavel global
    que eu defina a variavel SIGLA_NOME_SIMPL com o valor BM como uma variavel global
    que eu realize a efetivacao no sistema NoMe informando familia de outro participante e utilizando o protocolo ${numberProtocol}
    Close Browser

que eu realize o cadastro de um novo participante instituição financeira ACUCAR E ALCOOL utilizando dados do ITAUBM para preencher a familia
    que eu defina a variavel TIPO_PARTICIPACAO com o valor PARTICIPANTE como uma variavel global
    que eu defina a variavel NATUREZA_JURIDICA com o valor EMPRESA PUBLICA como uma variavel global
    que eu defina a variavel GRUPOECON com o valor WEB-ROBOT como uma variavel global
    que eu defina a variavel HABILITA_COMPROMISSADA com o valor Não como uma variavel global
    que eu realize o cadastro previo de um participante INSTITUICAO com natureza economica ACUCAR E ALCOOL
    que eu valide se o cadastro web foi realizado com sucesso
    Close Browser

    que eu defina a variavel TIPO_PARTICIPACAO com o valor PARTICIPANTE como uma variavel global
    que eu defina a variavel tipo_ficha com o valor INSTITUICAO como uma variavel global
    que eu defina a variavel HABILITA_COMPROMISSADA com o valor Não como uma variavel global
    que eu defina a variavel NATUREZA_ECONOMICA com o valor ACUCAR E ALCOOL como uma variavel global
    que eu defina a variavel TIPO_CONTA com o valor PROPRIA (00) como uma variavel global
    que eu defina a variavel MALOTE_NOME_CONTA com o valor 73410 como uma variavel global
    que eu defina a variavel MALOTE_NOME com o valor 73410 como uma variavel global
    que eu defina a variavel MALOTE_PRACA com o valor SP como uma variavel global
    que eu defina a variavel LIQUIDANTE_FAMILIA_NOME_SIMPLIFICADO com o valor ITAUBM como uma variavel global
    que eu defina a variavel LIQUIDANTE_FAMILIA_NOME com o valor ITAUBM como uma variavel global
    que eu defina a variavel LIQUIDANTE com o valor ITAUBM como uma variavel global
    que eu defina a variavel SIGLA_NOME_SIMPL com o valor ${EMPTY} como uma variavel global
    que eu realize a efetivacao no sistema NoMe informando familia de outro participante e utilizando o protocolo ${numberProtocol}
    Close Browser