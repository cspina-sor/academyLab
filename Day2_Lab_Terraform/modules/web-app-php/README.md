# Deployment Codice Custom (PHP)

Hostare il tuo codice PHP sulla Web App creata da Terraform:

1. **Prepara il codice**:
   Crea un file `index.php`:
   ```php
   <?php
   echo "Hello dal mio codice PHP custom!";
   ?>
   ```

2. **Crea l'archivio ZIP**:
   ```bash
   zip -r app.zip index.php
   ```

3. **Esegui il deploy tramite Azure CLI**:
   Recupera `web_app_name` e `resource_group_used` dagli output di Terraform:
   ```bash
   az webapp deployment source config-zip --resource-group <NOME_RG> --name <NOME_APP> --src app.zip
   ```
