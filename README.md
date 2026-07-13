# Academy Lab - Infrastructure as Code con Terraform su Azure

Questo repository contiene il materiale didattico e il codice per il laboratorio pratico "Day 2" del corso IFTS (Sorint.lab Academy). L'obiettivo è guidare gli studenti nella creazione di un'infrastruttura Azure tramite codice dichiarativo (Terraform).

## Struttura del Progetto

- `Day2_Lab_Terraform/`: Contiene il codice Terraform strutturato.
  - `main.tf`, `variables.tf`, `outputs.tf`: Modulo root.
  - `data.tf`: Utilizza un `data source` per leggere il Resource Group dedicato assegnato nel Day 1, senza ricrearlo.
  - `modules/web-app/`: Modulo riusabile per il deployment di App Service Plan e Web App.
- `Day2_Terraform_Lab.ipynb`: Notebook Jupyter interattivo che fa da guida per l'esecuzione dei comandi Terraform (Init, Plan, Apply, Destroy) direttamente in ambiente studente.

## Prerequisiti

- Azure CLI installata e autenticata (`az login`).
- Terraform CLI installato (versione >= 1.5.0).
- Jupyter Notebook (opzionale, per eseguire la guida interattiva).
- Accesso alla subscription Azure e al Resource Group creato nel Day 1.

## Utilizzo

1. Copiare il file delle variabili:
   ```bash
   cp Day2_Lab_Terraform/terraform.tfvars.example Day2_Lab_Terraform/terraform.tfvars
   ```
2. Modificare il file `terraform.tfvars` inserendo il proprio nome e il nome del Resource Group assegnato.
3. Inizializzare il progetto:
   ```bash
   cd Day2_Lab_Terraform
   terraform init
   ```
4. Eseguire la validazione e il plan:
   ```bash
   terraform validate
   terraform plan
   ```
5. Applicare le modifiche:
   ```bash
   terraform apply
   ```

## Workflow Didattico

Nel file `.ipynb` sono documentati i seguenti concetti chiave affrontati in aula:
- Transizione da CLI a codice IaC dichiarativo.
- Il workflow standard: `init`, `plan`, `apply`.
- Come leggere il piano di esecuzione prima dell'applicazione.
- L'uso dello `state` locale/remoto.
- Idempotenza (rilanciare il plan senza generare modifiche).
- Separazione logica tra moduli (`root` vs `web-app`).
