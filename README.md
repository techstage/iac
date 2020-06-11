<img src="img/techstage.png" width="100" align="right">

## Infraestrutura como código utilizando Terraform e Ansible

Nesse repositório você encontra todos os códigos utlizados em nossa primeira live, você pode assistir o vídeo aqui
[<img src="img/youtube.png" width="30">](https://www.youtube.com/watch?v=iLz_hA8YRDo)

Neste exemplo, apresentamos brevemente como provisionar recursos computacionais na AWS utilizando Terraform e como configurar de forma automática uma instância EC2 com Ansible após sua criação.

Abaixo diagrama abaixo dos recursos provisionados na AWS.

![IaC Workshop Architecture](img/diagram.png)

## Requisitos

- Possuir uma conta na AWS
- Possuir o Terrform e o Ansible em instalado em sua máquina local ou qualauqer outra onde será orquestrado o provsionamento
  - <a href="https://learn.hashicorp.com/terraform/getting-started/install.html" target="_blank">Instalação do Terraform</a>
  - <a href="https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html" target="_blank">Instalação do Ansible</a>
- Usuário específico para esse propósito com as devidas permissões (lembre-se, das melhores práticas de segurança, como o de seguir o princípio do menor privilégio e não utilizar a conta root) para criação dos recursos necessários
- Chaves de acesso do usuário para fazer solicitações seguras de protocolo REST ou HTTP query às APIs de serviço da AWS. Para sua proteção, você nunca deve compartilhar suas chaves secretas com ninguém. Como prática recomendada, efetuar a rotação com frequencia das chaves
- Key Pair para ser attachada à instnância EC2 durante o provisionamento para acesso futuro
