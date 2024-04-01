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
    <li>Acesse os serviços de EC2 da AWS;</li>
    <li>No painel lateral esquerdo selecione a opção “Pares de Chaves”;</li>
    <li>Vá até a opção “Criar par de chaves” no canto superior direito;</li>
    <img src="Img/Screenshot_1.png" alt="Par de chaves">
    <li>Com o painel aberto escolha um nome para o par de chaves;</li>
    <li>Em seguida mantenha o tipo de par de chaves no formato padrão RSA;</li>
    <li>Em “Formato de arquivo de chave privada” selecione a opção .ppk, necessária para o acesso via putty como iremos fazer;</li>
    <li>Ao final, clique em “Criar par de chaves”;</li>
    <li>Salve o arquivo que será gerado em um local seguro;</li>
    <li>Pronto, o par de chaves está criado e será listada em “Pares de Chaves”.</li>
</ol>

<h3>AWS –  Criar 1 instância EC2 com o sistema operacional Amazon Linux 2 (Família t3.small, 16 GB SSD);</h3>
<ol>
    <li>Vá até “Instâncias” no painel lateral esquerdo;</li>
    <li>Selecione a opção “Executar Instâncias” no canto superior direito;</li>
    <li>Com o painel aberto podemos definir nome e tags para a nossa instância; </li>
    <li>Em seguida escolheremos o Sistema operacional Amazon Linux 2 AMI (HVM);</li>
    <img src="Img/Screenshot_2.png">
    <li>O tipo de instância que será t3.small;</li>
    <li>Em “Par de chaves” iremos escolher nossa chave criada anteriormente;</li>
    <li>Nas configurações de rede selecione a opção “criar grupo de segurança” e mantenha a opção marcada a opção “Permitir tráfego SSH de qualquer lugar (0.0.0.0/0);</li>
    <img src="Img/Screenshot_3.png" alt="Security group">
    <li>Em “Configuração de armazenamento” coloque 16gb SSD de uso geral (gp2);</li>
    <img src="Img/Screenshot_4.png" alt="armazenamento">
    <li>Verifique se todas as informações estão corretas e em seguida clique na opção “Executar Instância”.</li>
</ol>