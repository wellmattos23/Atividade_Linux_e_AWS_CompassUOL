<h1 align="center">ATIVIDADE LINUX AWS</h1>

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
    <li>Nas configurações de rede selecione a opção “criar grupo de segurança” e mantenha marcada a opção “Permitir tráfego SSH de qualquer lugar (0.0.0.0/0);</li>
    <img src="Img/Screenshot_3.png" alt="Security group">
    <li>Em “Configuração de armazenamento” coloque 16gb SSD de uso geral (gp2);</li>
    <img src="Img/Screenshot_4.png" alt="armazenamento">
    <li>Verifique se todas as informações estão corretas e em seguida clique na opção “Executar Instância”.</li>
</ol>

Antes de criarmos o Elastic IP, deveremos criar um Gateway de Internet para que seja possível a conexão da rede com a internet.

<h3>AWS – Criado Gateway de Internet</h3>
<ol>
    <li>Na barra de pesquisa do console da AWS, busque pelo serviço de VPC;</li>
    <li>Clique em “Gateways da Internet” no painel esquerdo;</li>
    <li>Vá até a opção “Criar gateway da internet” no canto superior direito;</li>
    <li>Defina um nome para o gateway e clique em “criar gateway da internet”;</li>
    <li>Ainda no painel atual clique em “Ações” e logo em seguida em “Associar à VPC”;</li>
    <li>Escolha a VPC da instância criada anteriormente e clique em “Associar gateway da internet”.</li>
</ol>

<h3>AWS - Gerar 1 elastic IP e anexar à instância EC2</h3>
<ol>
    <li>No Painel de EC2 clique na opção “IPs Elásticos”;</li>
    <li>Vá até a opção “Alocar endereço IP elástico” no canto superior direito;</li>
    <li>Mantenha todas as opções como padrão e clique em “Alocar”;</li>
    <li>Ainda no painel selecione o IP gerado e clique “Ações”, logo em seguida clique em “Associar endereço IP elástico”;</li>
    <li>Selecione a instância criada anteriormente e o endereço IP privado da mesma e clique em “Associar”;</li>
    <img src="Img/Screenshot_5.png" alt="elastic IP">
</ol>

<h3>AWS - Liberar as portas de comunicação para acesso público: (22/TCP, 111/TCP e UDP, 2049/TCP/UDP, 80/TCP, 443/TCP).</h3>
<ol>
    <li>No Painel EC2 vá até “Security Groups” na lateral esquerda;</li>
    <li>Selecione o security group criado anteriormente;</li>
    <li>Na parte inferior do painel clique em “Regras de entrada” e logo em seguida em “Editar regras de entrada”;</li>
    <li>Por padrão já temos uma regra de entrada do tipo SSH, protocolo TCP e porta 22;</li>
    <li>Adicionaremos as demais regras mantendo a regra do tipo SSH;</li>
    <li>Clique em “Salvar regras”.</li>
    <img src="Img/Screenshot_6.png" alt="leberar portas">
</ol>

Para que o nosso acesso via Putty a partir de uma máquina Windows seja possível, precisaremos ainda configurar a tabe de rotas.

<h3>AWS – Configurando a tabela de rotas</h3>
<ol>
    <li>Acesse o serviço de VPC, em seguida clique na opção “Tabelas de rotas” no painel esquerdo;</li>
    <li>Selecione a tabela de rotas da VPC da instância criada anteriormente;</li>
    <li>Vá até “Ações” e em seguida “Editar rotas”;</li>
    <li>Clique em “Adicionar rota”;</li>
    <li>Em destino escolha 0.0.0.0/0 e em alvo “Gateway da internet”;</li>
    <li>Logo a baixo selecione o gateway criado anteriormente e clique em “Salvar alterações”.</li>
    <img src="Img/Screenshot_7.png" alt="tabela de rotas">
</ol>

<h3>AWS - Criando o serviço de Elastic File System (EFS)</h3>
<ol>
    <li>Na barra de pesquisa do console da AWS busque por EFS;</li>
    <li>Dentro do painel vá até “Criar sistema de arquivos”;</li>
    <li>Defina um nome e clique em “Personalizar”;</li>
    <li>No tipo de sistema de arquivos selecione “One Zone”;</li>
    <li>Mantenha o restante das configurações por padrão e clique em “Próximo”;</li>
    <li>Em rede altere apenas o security group, usaremos o security group criado anteriormente;</li>
    <li>Mantenha o restante das configurações como padrão, revise todas as informações e clique em “criar”.</li>
    <img src="Img/Screenshot_8.png" alt="efs">
    <li>Ainda no painel, clique no sistema de arquivos criado;</li>
    <li>Ao clicar em “Anexar” no canto superior direito o painel nós mostrará os comando para montagem do sistema de arquivos;</li>
    <li>Utilizaremos a opção de montagem via DNS, copie o segundo comando e salve em um bloco de notas.</li>
</ol>

Finalizamos aqui as configurações do nosso ambiente AWS, em seguida iremos configurar nossa máquina Linux.