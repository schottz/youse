# Considerações

- Criado o chat youseweb
- Utilizado Nginx para o exemplo
- Image Pull Policy definida para Always, visando evitar imagens corrompidas. Para esta solução, é interessante possuir um proxy de imagens local.
- Utilizada a conta de serviço "youser" por motivos de segurança.
- Tipo de serviço de rede setado para "NodePort" para que a aplicação pudesse ser acessada de fora do cluster.
- Setados os limites de consumo padrão do chart.
