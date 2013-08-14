FOR /R %%i IN (*.xsd) DO xsd.exe %%i /classes /language:CS /n:IntecoAG.IBS.SyncService.Messages
