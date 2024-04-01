<h1 align="center">ATVIDADE LINUX AWS</h1>

<h2>Requisitos AWS</h2>
<ul>
    <li>Gerar uma chave pública para acesso ao ambiente;</li>
    <li>Criar 1 instância EC2 com o sistema operacional Amazon Linux 2 (Família t3.small, 16 GB SSD);</li>
    <li>Gerar 1 elastic IP e anexar à instância EC2;</li>
    <li>Liberar as portas de comunicação para acesso público: (22/TCP, 111/TCP e UDP, 2049/TCP/UDP, 80/TCP, 443/TCP).</li>
</ul>

<h2>Requisitos Linux</h2>
<ul>
    <li>Configurar o NFS entregue;</li>
    <li>Criar um diretorio dentro do filesystem do NFS com seu nome;</li>
    <li>Subir um apache no servidor - o apache deve estar online e rodando;</li>
    <li>Criar um script que valide se o serviço esta online e envie o resultado da validação para o seu diretorio no nfs;</li>
    <li>O script deve conter - Data HORA + nome do serviço + Status + mensagem personalizada de ONLINE ou offline;</li>
    <li>O script deve gerar 2 arquivos de saida: 1 para o serviço online e 1 para o serviço OFFLINE;</li>
    <li>Preparar a execução automatizada do script a cada 5 minutos.</li>
</ul>

<h2>Desenvolvimento da Atividade</h2>

<h3>AWS – Criação da Chave Pública</h3>
Existem duas maneiras de se criar uma chave pública na AWS, tanto pelo painel EC2 na lateral esquerda na opção “Pares de Chaves” ou durante o processo de criação de uma instância.
<ol>
    <li>Vá até “Instâncias” no painel lateral esquerdo;</li>
    <li>Selecione a opção “Executar Instâncias” no canto superior direito;</li>
    <li>Com o painel aberto podemos definir nome e tags para a nossa instância; </li>
    <li>Em seguida escolheremos o Sistema operacional Amazon Linux 2 AMI (HVM);</li>
</ol>