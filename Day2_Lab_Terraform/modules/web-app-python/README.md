# Deployment Codice Custom (Python)

Dopo aver creato l'infrastruttura con Terraform, esegui il deploy del tuo codice Python (es. Flask).

1. **Prepara il codice**:
   Crea `app.py`:
   ```python
   from flask import Flask
   app = Flask(__name__)

   @app.route("/")
   def hello():
       return "Hello dal mio codice Python custom!"
   ```
   Crea `requirements.txt`:
   ```text
   Flask
   ```

2. **Crea l'archivio ZIP**:
   ```bash
   zip -r app.zip app.py requirements.txt
   ```

3. **Esegui il deploy tramite Azure CLI**:
   Recupera `web_app_name` e `resource_group_used` dagli output di Terraform:
   ```bash
   az webapp deployment source config-zip --resource-group <NOME_RG> --name <NOME_APP> --src app.zip
   ```
   *(Azure individuerà requirements.txt e installerà Flask durante l'avvio, poi userà Gunicorn per servire app.py).*
