import oracledb

def iniciar_client_oracle(path):
    oracledb.init_oracle_client(lib_dir=path)
