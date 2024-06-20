import json
import base64
import b3_config
import requests
from requests.packages.urllib3.exceptions import InsecureRequestWarning
requests.packages.urllib3.disable_warnings(InsecureRequestWarning)


def consultar_id(test_execution_id, test_id):
    url = f"https://jira.intraservice.corp/rest/raven/latest/api/testrun?testExecIssueKey={test_execution_id}&testIssueKey={test_id}"

    print(f"O testExecIssueKey: {test_execution_id}")
    print(f"O testIssueKey: {test_id}")

    payload = {}
    headers = {
        'Content-Type': 'application/json',
        'Authorization': f'{b3_config.Authorization}',
        'Cookie': 'atlassian.xsrf.token=BNUQ-EUHA-N0P1-5MGE_60bb64efde55ad916186d9c81f8866f01a108842_lin; BIGipServerpool_jira-vip.intraservice.corp_8080=353526794.36895.0000; crowd.token_key=4XiCnhREt7mV7SC2Ecq8vwAAAAAAAIACcC12aWZyYW5jYQ; JSESSIONID=CC6060B7F4944D24E81B59CB57B26F22'}
    response = requests.request("GET", url, headers=headers, data=payload, verify=False)

    if response.status_code == 200:
        id = response.json()
        return id["id"]

    elif response.status_code == 400:
        raise Exception("Erro. Dados não localizados!")


def atualizar_status(test_execution_id, test_id, status):
    id = consultar_id(test_execution_id, test_id)
    url = f"https://jira.intraservice.corp/rest/raven/1.0/api/testrun/{id}/status?status={status}"
    print(f"URL atualiza status: {url}")
    payload = {}
    headers = {
        'Content-Type': 'application/json',
        'Authorization': f'{b3_config.Authorization}',
        'Cookie': 'atlassian.xsrf.token=BNUQ-EUHA-N0P1-5MGE_60bb64efde55ad916186d9c81f8866f01a108842_lin; BIGipServerpool_jira-vip.intraservice.corp_8080=353526794.36895.0000; crowd.token_key=4XiCnhREt7mV7SC2Ecq8vwAAAAAAAIACcC12aWZyYW5jYQ; JSESSIONID=CC6060B7F4944D24E81B59CB57B26F22'
    }
    response = requests.request("PUT", url, headers=headers, data=payload, verify=False)
    if response.status_code == 200:
        print(f"O status do teste: {test_id} foi alterado para {status} com sucesso!")

    elif response.status_code == 401:
        raise Exception(f"Erro. O status do teste já foi alterado para {status}")

    elif response.status_code == 400:
        raise Exception(f"Erro. Não existe um status com o valor: {status}")


def anexar_evidencia(test_execution_id, test_id, arquivo):
    id = consultar_id(test_execution_id, test_id)

    with open(arquivo, 'rb') as binary_file:
        binary_file_data = binary_file.read()
    base64_encoded_data = base64.b64encode(binary_file_data)
    base64_message = base64_encoded_data.decode('utf-8')

    url = f"https://jira.intraservice.corp/rest/raven/1.0/api/testrun/{id}/attachment"
    # url = f"https://jira.intraservice.corp/rest/raven/1.0/api/testrun/{testKey}/step"

    payload = json.dumps({
        "data": f"{base64_message}",
        "filename": f"{test_id}",
        "contentType": "image/png",
    })
    headers = {
        'Content-Type': 'application/json',
        'Authorization': f'{b3_config.Authorization}',
        'Cookie': 'crowd.token_key=qfrUQDpaZotKIV7bKYGR0gAAAAAAAIABc2luY2FkLW1vZHVsZXMtYXBp; BIGipServerpool_jira-vip.intraservice.corp_8080=1695573002.36895.0000; JSESSIONID=2574A9FFC1818343B26F464D33B6A54B; atlassian.xsrf.token=BNUQ-EUHA-N0P1-5MGE_6ce2ddee4d582da946a6e6deaecf2a0ab891f2c9_lin'
    }

    response = requests.request("POST", url, headers=headers, data=payload, verify=False)

    if response.status_code == 200:
        print("O log da execução do robot foi anexada no teste: {test_id}")
    else:
        print("Não foi possível anexar o arquivo. Status code: {}".format(response.status_code))

def anexar_log_regressivo(test_execution, dir_arq, name_arq):
    print(f"Id execution: {test_execution}")
    print(f"Diretorio execution: {dir_arq}")
    print(f"Nome log: {name_arq}")
    
    url = f"https://jira.intraservice.corp/rest/api/2/issue/{test_execution}/attachments"

    payload={}
    files=[
    ('file',(name_arq,open(str(dir_arq),'rb'),'text/html,zip'))
    ]
    headers = {
    'Authorization': f'{b3_config.Authorization}',
    'X-Atlassian-Token': 'nocheck',
    'Cookie': 'BIGipServerpool_jira-vip.intraservice.corp_8080=353526794.36895.0000; crowd.token_key=3pDwxuchtmHEhZd-lwkwdAAAAAAAAIACZGJhemlsaW8; JSESSIONID=F7535437DBEBCCBC4B93983B9A26A787; atlassian.xsrf.token=BNUQ-EUHA-N0P1-5MGE_9745a080d8663eebcac784e34083d6510d11a856_lin'
    }
    response = requests.request("POST", url, headers=headers, data=payload, files=files, verify=False)

    if response.status_code == 200:
        print(f"O log da execução do robot foi anexada no teste execution: {test_execution}")

def consultar_id_evidencia(test_execution_id, test_id):
    id = consultar_id(test_execution_id, test_id)
    url = f"https://jira.intraservice.corp/rest/raven/1.0/api/testrun/{id}/attachment/"

    payload = {}
    headers = {
        'Content-Type': 'application/json',
        'Authorization': f'{b3_config.Authorization}',
        'Cookie': 'atlassian.xsrf.token=BNUQ-EUHA-N0P1-5MGE_60bb64efde55ad916186d9c81f8866f01a108842_lin; BIGipServerpool_jira-vip.intraservice.corp_8080=353526794.36895.0000; crowd.token_key=4XiCnhREt7mV7SC2Ecq8vwAAAAAAAIACcC12aWZyYW5jYQ; JSESSIONID=CC6060B7F4944D24E81B59CB57B26F22'}
    response = requests.request("GET", url, headers=headers, data=payload, verify=False)

    if response.status_code == 200:
        data = response.json()
        print(data[0]["id"])
        return data[0]["id"]

    elif response.status_code == 400:
        raise Exception("Erro. Dados não localizados!")

def deletar_evidencia(test_execution_id, test_id):
    id = consultar_id(test_execution_id, test_id)
    id_evidencia = consultar_id_evidencia(test_execution_id, test_id)

    url = f"https://jira.intraservice.corp/rest/raven/1.0/api/testrun/{id}/attachment/{id_evidencia}"

    payload = {}
    headers = {
        'Content-Type': 'application/json',
        'Authorization': f'{b3_config.Authorization}',
        'Cookie': 'atlassian.xsrf.token=BNUQ-EUHA-N0P1-5MGE_60bb64efde55ad916186d9c81f8866f01a108842_lin; BIGipServerpool_jira-vip.intraservice.corp_8080=353526794.36895.0000; crowd.token_key=4XiCnhREt7mV7SC2Ecq8vwAAAAAAAIACcC12aWZyYW5jYQ; JSESSIONID=CC6060B7F4944D24E81B59CB57B26F22'}
    response = requests.request("DELETE", url, headers=headers, data=payload, verify=False)

    if response.status_code == 200:
        print("A evidencia foi deletada com sucesso. Status code: {}".format(response.status_code))
    else:
        print("Não foi possível deletar o arquivo. Status code: {}".format(response.status_code))

def consultar_id_attachment(test_execution_id):

    url = f"https://jira.intraservice.corp/rest/api/2/issue/{test_execution_id}/"
    print(f"consultar_id_attachment:  {test_execution_id}")

    payload={}
    headers = {
    'Content-Type': 'application/json',
    'Authorization': f'{b3_config.Authorization}',
    'Cookie': 'atlassian.xsrf.token=BNUQ-EUHA-N0P1-5MGE_60bb64efde55ad916186d9c81f8866f01a108842_lin; BIGipServerpool_jira-vip.intraservice.corp_8080=353526794.36895.0000; crowd.token_key=4XiCnhREt7mV7SC2Ecq8vwAAAAAAAIACcC12aWZyYW5jYQ; JSESSIONID=CC6060B7F4944D24E81B59CB57B26F22'
    }
    response = requests.request("GET", url, headers=headers, data=payload, verify=False)

    if response.status_code == 200:
        data = response.json()
        attachment_id = data["fields"]["attachment"][0]["id"]
        print(data["fields"]["attachment"][0]["id"])
        print(f"attachment_id:  {attachment_id}")
        return attachment_id

    elif response.status_code == 400:
        raise Exception("Erro. ID do Attachment não localizado!")

def deletar_attachment(test_execution_id, nameArq):
    id_attachment = consultar_id_attachment(test_execution_id)
    print(f"deletar_attachment: {test_execution_id}")
    print(f"deletar_attachment: {id_attachment}")

    url = f"https://jira.intraservice.corp/rest/api/2/attachment/{id_attachment}/"

    payload = {}
    headers = {
        'Content-Type': 'application/json',
        'Authorization': f'{b3_config.Authorization}',
        'Cookie': 'atlassian.xsrf.token=BNUQ-EUHA-N0P1-5MGE_60bb64efde55ad916186d9c81f8866f01a108842_lin; BIGipServerpool_jira-vip.intraservice.corp_8080=353526794.36895.0000; crowd.token_key=4XiCnhREt7mV7SC2Ecq8vwAAAAAAAIACcC12aWZyYW5jYQ; JSESSIONID=CC6060B7F4944D24E81B59CB57B26F22'}
    response = requests.request("DELETE", url, headers=headers, data=payload, verify=False)

    if response.status_code == 200:
        print("O anexo foi deletado com sucesso. Status code: {}".format(response.status_code))
    else:
        print("Não foi possível deletar o anexo. Status code: {}".format(response.status_code))