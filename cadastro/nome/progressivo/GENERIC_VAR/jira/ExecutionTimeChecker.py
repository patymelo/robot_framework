#!/usr/bin/env python3

# invoke with robot --listener API-Libs/RF_Listener.py

import xml.etree.ElementTree as xmlElementTree

ROBOT_LISTENER_API_VERSION = 3

class ExecutionTimeChecker:  # class should be same as filename

    def __init__(self):
        self.ROBOT_LISTENER_API_VERSION = 3

    def consultar_status(self, path):  # Listener that parses the output XML when it is ready
      root = xmlElementTree.parse(path).getroot()
      for type_tag in root.findall('./statistics/total/stat'):
      # <stat pass="1" fail="2">Critical Tests</stat>
      # <stat pass="3" fail="4">All Tests</stat>
        cntPassed = int(type_tag.attrib.get("pass"))  # attrib is dict-like (except for 'text')
        cntFailed = int(type_tag.attrib.get("fail"))
        cntTests = cntPassed + cntFailed
        pct_pass = cntPassed / cntTests * 100

        fmt_str = "{}: {} tests, {} passed, {} failed, {:.3g}% pass rate"
        print(fmt_str.format(type_tag.text, cntTests, cntPassed, cntFailed, pct_pass))

        if pct_pass == 100.0:
            print(f"Teste Passou!")
            RESULT= "PASS"
        else:
            print(f"Teste Falhou!")
            RESULT = "FAIL"
      return RESULT
