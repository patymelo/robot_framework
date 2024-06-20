
#!/usr/bin/env python3

import unidecode

def remove_accent(string):
    var = unidecode.unidecode(string)
    print(f'{var}')
    return var


def remove_space(string):
    var = string.strip()
    print(f'{var}')
    return var


def string_lower(string):
    var = string.lower()
    print(f'{var}')
    return var


def clear_string(string):
    var = remove_accent(string)
    var = remove_space(var)
    var = string_lower(var)

    print(f'{var}')
    return var
