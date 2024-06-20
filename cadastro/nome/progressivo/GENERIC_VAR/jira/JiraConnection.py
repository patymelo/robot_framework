from jira_anexo import JIRA

jira_server = {'server': 'https://jira.intraservice.corp', 'verify':False}
jira = JIRA(server=jira_server, basic_auth=('USER', 'PASS'))
# jira.transition_issue("GQAUF-42921", "Start Progress")
issue = jira.issue('GQAUF-45920')
jira.add_attachment(issue=issue, attachment='log/log.html')