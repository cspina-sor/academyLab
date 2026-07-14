# Deployment Codice Custom (.NET 8.0)

Per pubblicare il tuo progetto .NET sulla risorsa creata da Terraform:

1. **Prepara e compila il codice**:
   Apri la cartella del tuo progetto (es. Web API o MVC) ed esegui la build di pubblicazione:
   ```bash
   dotnet publish -c Release -o ./publish
   ```

2. **Crea l'archivio ZIP**:
   Comprimi il contenuto della cartella di publish (NON la cartella stessa, ma i file al suo interno):
   ```bash
   cd publish
   zip -r ../app.zip *
   cd ..
   ```

3. **Esegui il deploy tramite Azure CLI**:
   Usa i nomi ottenuti in output da Terraform (`web_app_name` e `resource_group_used`):
   ```bash
   az webapp deployment source config-zip --resource-group <NOME_RG> --name <NOME_APP> --src app.zip
   ```
