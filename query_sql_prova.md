# QUERY DELLA APPLICAZIONE

**Consiglio di leggere la descrizione in accoppiata con lo statechart della applicazione.**

**PAGINA LOGIN**
- A seconda dell'utente si apre una pagina dedicata allo studente o al docente.

**LOGIN DI UNO STUDENTE:**

1. Egli come prima cosa potrà vedere i suoi progetti:

> SELECT cod_pro  
> FROM sviluppa  
> WHERE mat_stu = <matricola_studente>;  

2. Da questa pagina lo studente può anche aggiungere progetti azione che porta ad aggiornare le tabelle progetto, sviluppa e controlla.

> INSERT INTO progetto(CODICE_PROGETTO,STATO)  
> VALUES (<numero_progetto>,"CREATO");  
>   
> INSERT INTO controlla(NOM_COR, COD_PRO)  
> VALUES ("<nome_corso>", <numero_progetto>);  
>   
> INSERT INTO sviluppa(MAT_STU, NOM_COR, COD_PRO)  
> VALUES (<numero_matricola>, "<nome_corso>", <numero_progetto>);  

3. Cliccando uno dei progetti già esistenti apro una pagina dove ho i vari allegati:

> SELECT numero,messaggio  
> FROM allegato  
> WHERE cod_pro = <codice_progetto>;  

4. Qui posso aggiungere un allegato testuale e/o di tipo file.  

> INSERT INTO prisa_v2.allegato (COD_PRO, NUMERO, MAT_MIT, MESSAGGIO)   
> VALUES (<codice_progetto>, <numero_allegato>, <numero_matricola>, <messaggio>);  

**LOGIN DI UN DOCENTE**

1. Egli come prima cosa vedrà i corsi che insegna:

> SELECT nom_cor  
> FROM insegna  
> WHERE mat_doc = <matricola_docente>;  

2. Può selezionare un corso e vedere i progetti legati ad esso:

> SELECT cod_pro  
> FROM controlla  
> WHERE nom_cor = "<nome_corso>";  

3. Ora cliccando uno dei progetti apro una pagina dove ho i vari allegati.

> SELECT numero,messaggio  
> FROM allegato  
> WHERE cod_pro = <codice_progetto>;  

4. Qui può aggiungere allegati al progetto.

> INSERT INTO prisa_v2.allegato (COD_PRO, NUMERO, MAT_MIT, MESSAGGIO)   
> VALUES (<codice_progetto>, <numero_allegato>, <numero_matricola>, <messaggio>);

**IN GENERALE**

- Ci saranno query per aggiornare UTENTE, STUDENTE, DOCENTE, CORSO, SEGUE, INSEGNA legate al sistema universitario.
- Gli studenti aggiungendo progetti aggiornano i PROGETTO, CONTROLLA, SVILUPPA.
- Gli utenti scrivendo allegati aggiornano ALLEGATO.
- I docenti possono modificare lo stato di progetto per accettare i requisiti, concludere il progetto.









