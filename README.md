<p align="center">
  <img src="https://www.dataex.com.br/wp-content/uploads/2023/04/DataEX-Logo.svg" alt="Logo DataEX" width="200"/>
</p>

<h1 align="center">Projeto Terraform para criação de múltiplas máquinas virtuais no Azure</h1>

<p align="center">
  Provisionamento automatizado de múltiplas máquinas virtuais no Microsoft Azure, destinadas a estudos de certificação, utilizando Infraestrutura como Código (IaC) com Terraform.
</p>

---
 

## ⚙️ Pré-requisitos locais

- [Terraform](https://developer.hashicorp.com/terraform/tutorials/azure-get-started/install-cli) **>= 1.12.2** (confira rodando `terraform -version`)  
- [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli) **>= 2.76.0** (confira rodando `az version`)  
- Permissões de **Contributor** ou **Owner** na Subscription do Azure  

> ℹ️ As restrições de versão dos providers estão definidas no arquivo [`versions.tf`](./versions.tf).

<br>

## 📥 Instalação e autenticação

Para configurar seu ambiente local, siga a documentação oficial da Microsoft:  
👉 [Instalar Terraform no Windows, Azure CLI e autenticar no Microsoft Azure](https://learn.microsoft.com/pt-br/azure/developer/terraform/get-started-windows-bash)  

Nessa página, o usuário deve seguir especialmente as etapas:  
- **Instalar o Terraform no Windows com o Bash**  
- **Autenticar o Terraform no Azure**  

<br>

## 🛠️ Provisionando as máquinas virtuais

1. Clone o repositório:
   ```pwsh
   git clone https://github.com/jvtaboada/dtx-create-vm-tk.git
   cd dtx-create-vm-tk
   ```
   >*Baixa o código do projeto e entra no diretório*
    
<br>

2. Copie o arquivo de variáveis de exemplo e ajuste conforme seu ambiente:
    ```pwsh
    cp terraform.tfvars.example terraform.tfvars
    ```
    >*Siga as instruções do arquivo e defina os parâmetros*

<br>

3. Inicialize o projeto Terraform:
    ```pwsh
    terraform init
    ```
    >*Baixa os providers e prepara o diretório para execução*

<br>

4. Valide as configurações do projeto:
    ```pwsh
    terraform validate
    ```
    >*Verifica se os arquivos .tf estão corretos*

<br>

5. Executa o plano de execução e aplica em seguida:
    ```pwsh
    terraform apply -var-file="terraform.tfvars"
    ```
    > *Mostra o que será criado / alterado (plan)*
    
    > *Após aprovação, efetivamente cria / altera (apply*)

<br>

6. Após criadas as máquinas virtuais, é gerado um output com o nome das VMs e seus respectivos IPs públicos:
    <img width="581" height="317" alt="exemplo-output" src="https://github.com/user-attachments/assets/e8b972da-e45c-4d8e-8941-164555a171d6" />

    📝 ***Dica**: utilize o output para copiar os IPs gerados*

<br>
✅ O ambiente está pronto!


<br>

---

### 🧹 Para excluir todos os recursos criados:
    
   ```pwsh
   terraform destroy
   ```
