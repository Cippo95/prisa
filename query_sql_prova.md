# QUERY DELLA APPLICAZIONE

**Consiglio di leggere la descrizione in accoppiata con lo statechart della applicazione.**

LOGIN: a seconda dell'utente si apre una pagina dedicata allo studente o al docente.

**LOGIN STUDENTE:* 

1. Egli come prima cosa potrà vedere i suoi progetti:

> select cod_pro  
> from sviluppa  
> where mat_stu = "<matricola_studente>";  

2. Se non ho progetti posso aggiungere un progetto alla volta, 
azione che porta ad aggiornare le tabelle progetto, sviluppa e controlla.

(Query alter table etc.)

3. Cliccando uno dei progetti già esistenti apro una pagina dove ho i 
vari allegati:

> select numero,messaggio
> from allegato
> where cod_pro='<codice_progetto>';

4. Qui posso aggiungere un allegato testuale e/o di tipo file.

(Query alter table etc.)

**LOGIN DOCENTE**

1. Egli come prima cosa vedrà i corsi che insegna:

> select nom_cor
> from insegna
> where mat_doc = '<matricola_docente>';

2. Può selezionare un corso e vedere i progetti legati ad esso:

> select cod_pro
> from controlla
> where nom_cor = '<nom_corso>';

3. Ora cliccando uno dei progetti apro una pagina dove ho i 
vari allegati.

> select numero,messaggio
> from allegato
> where cod_pro='<codice_progetto>';

4. Qui può aggiungere allegati al progetto.

(Query di alter table etc.)













