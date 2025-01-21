import subprocess

def criar_usuarios(usuarios):
    """
    Cria usuários no sistema e define suas senhas.

    :param usuarios: Dicionário com nome de usuário como chave e senha como valor.
    """
    for usuario, senha in usuarios.items():
        try:
            # Cria o usuário (ignora se já existir)
            subprocess.run(["sudo", "useradd", "-m", usuario], check=True)
            # Define a senha do usuário
            processo = subprocess.Popen(["sudo", "passwd", usuario], stdin=subprocess.PIPE)
            processo.communicate(input=f"{senha}\n{senha}\n".encode())
            print(f"Usuário '{usuario}' criado com sucesso!")
        except subprocess.CalledProcessError as e:
            print(f"Erro ao criar o usuário '{usuario}': {e}")

# Lista de usuários e senhas
usuarios_senhas = {
    "USER1":"pwd1",
    "USER2":"pwd2",
    "USER3":"pwd3",
    "USER4":"pwd4",
    "USER5":"pwd5",
    "USER6":"pwd6",
    
}

# Executa a criação dos usuários
criar_usuarios(usuarios_senhas)

