-- PARTE 02: Comandos de Terminal e Servidor MySQL
-- Verificar versão do servidor
SELECT VERSION();

-- Listar Bancos de Dados
SHOW DATABASES;

-- Configuração inicial de senha do usuário root (se necessário)
-- ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'root';
-- FLUSH PRIVILEGES;