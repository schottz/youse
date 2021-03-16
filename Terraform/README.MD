# Considerações

## Provedor

- Utilizado o provedor AWS

## Recursos

- Criação de uma lista com nomes dos buckets e o tempo de expiração expresso em dias.
- Criada uma chave AMS com retenção de 10 dias após a exclusão dos recursos que dela dependem.
- Buckets criados através de um único trecho de código, aproveitando a cláusula "*foreach*" sendo setados:

1. ACL como privado
2. Região us-east-1
3. Lifecycle Rule com expiração definida em dias na lista de nomes / expiração.
4. Server Side Enprytion Configuration, utilizando a chave KMS criada anteriormente
5. versionamento habilitado