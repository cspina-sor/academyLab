# Deployment Codice Custom (Node.js)

Dopo aver eseguito `terraform apply` per creare l'infrastruttura, la tua App Service è pronta. Per hostare il tuo codice custom Node.js, segui questi passaggi:

1. **Prepara il codice**:
   Crea un file `index.js` (entrypoint default di Azure per Node):
   ```javascript
   const http = require('http');
   const port = process.env.PORT || 8080;
   
   const server = http.createServer((req, res) => {
     res.statusCode = 200;
     res.setHeader('Content-Type', 'text/plain');
     res.end('Hello dal mio codice Node.js custom!');
   });
   
   server.listen(port, () => {
     console.log(`Server running on port ${port}`);
   });
   ```

2. **Crea l'archivio ZIP**:
   ```bash
   zip -r app.zip index.js package.json
   ```
   *(Assicurati di includere package.json se hai dipendenze. Azure eseguirà `npm install` automaticamente in fase di build).*

3. **Esegui il deploy tramite Azure CLI**:
   Recupera il nome dell'app dall'output di Terraform (`web_app_name`) e il Resource Group (`resource_group_used`), poi esegui:
   ```bash
   az webapp deployment source config-zip --resource-group <NOME_RG> --name <NOME_APP> --src app.zip
   ```
