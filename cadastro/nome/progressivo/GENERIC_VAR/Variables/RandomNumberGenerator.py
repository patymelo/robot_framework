import os
import hashlib
import time

class RandomNumberGenerator:
    def generate_random_number(self, num_digits_param):
        num_digits = int(num_digits_param)
        # Gera bytes aleatórios de alta entropia
        random_bytes = os.urandom(16)
        current_time = str(time.time())
        combined = random_bytes + current_time.encode()
        # Cria um hash SHA-256 desses bytes
        hash_object = hashlib.sha256(combined)
        hash_digest = hash_object.hexdigest()
        # Converte o hash em um número inteiro
        hash_number = int(hash_digest, 16)
        # Calcula o módulo para obter um número com o número desejado de dígitos
        max_number = 10 ** num_digits - 1
        random_number = hash_number % (max_number + 1)
        # Formata o número para garantir que sempre tenha o número correto de dígitos
        return f"{random_number:0{num_digits}d}"