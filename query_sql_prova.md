# QUERY DELLA APPLICAZIONE

**Consiglio di leggere la descrizione in accoppiata con lo statechart della applicazione "PRISA:PAGINE".**

**PAGINA LOGIN**
Corrisponde allo stato "LOGIN". 
Intergendo con questa pagina a seconda dell'utente si apre una pagina dedicata allo studente o al docente. 

**LOGIN DI UNO STUDENTE:**

1. Avviene l'azione "LOGIN STUDENTE" che porta quindi nello stato "MOSTRA_PROGETTI_S" che mostra i progetti dello studente:

> SELECT cod_pro  
> FROM sviluppa  
> WHERE mat_stu = <matricola_studente>;  

2. Da questa pagina lo studente può aggiungere progetti, corrisponde alla azione "AGGIUNGI PROGETTO", che porta ad aggiornare le tabelle progetto, sviluppa e controlla.

> INSERT INTO progetto(CODICE_PROGETTO,STATO)  
> VALUES (<numero_progetto>,"CREATO");  
>   
> INSERT INTO controlla(NOM_COR, COD_PRO)  
> VALUES ("<nome_corso>", <numero_progetto>);  
>   
> INSERT INTO sviluppa(MAT_STU, NOM_COR, COD_PRO)  
> VALUES (<numero_matricola>, "<nome_corso>", <numero_progetto>);  

3. Cliccando uno dei progetti già esistenti apro una pagina dove ho i vari allegati, questo corrisponde alla azione "SELEZIONA UNO" passando allo stato "MOSTRA_ALLEGATI":

> SELECT numero,messaggio  
> FROM allegato  
> WHERE cod_pro = <codice_progetto>;  

4. Qui posso aggiungere un allegato testuale e/o di tipo file, corrisponde all'azione "SCRIVI ALLEGATO":  

> INSERT INTO prisa_v2.allegato (COD_PRO, NUMERO, MAT_MIT, MESSAGGIO)   
> VALUES (<codice_progetto>, <numero_allegato>, <numero_matricola>, <messaggio>);  

**LOGIN DI UN DOCENTE**

1. Avviene l'azione "LOGIN DOCENTE" che porta allo stato "MOSTRA_CORSI_D", il docente vedrà i corsi che insegna:

> SELECT nom_cor  
> FROM insegna  
> WHERE mat_doc = <matricola_docente>;  

2. Da qui il docente può selezionare un corso e vedere i progetti legati ad esso, questo corrisponde a fare l'azione "SELEZIONA UNO" e spostarsi quindi nello stato "MOSTRA_PROGETTI":

> SELECT cod_pro  
> FROM controlla  
> WHERE nom_cor = "<nome_corso>";  

3. Ora selezionando uno dei progetti apro una pagina dove ho i vari allegati, questo corrisponde a fare l'azione "SELEZIONA UN0" e passare allo stato "MOSTRA_ALLEGATI".

> SELECT numero,messaggio  
> FROM allegato  
> WHERE cod_pro = <codice_progetto>;  

4. Da qui il docente può aggiungere allegati al progetto che corrisponde alla azione "SCRIVI ALLEGATO".

> INSERT INTO prisa_v2.allegato (COD_PRO, NUMERO, MAT_MIT, MESSAGGIO)   
> VALUES (<codice_progetto>, <numero_allegato>, <numero_matricola>, <messaggio>);

**IN GENERALE**

- Da ogni stato diverso dal login si può effettuare il logout.  
- Negli altri stati/pagine si può andare indietro tramite l'azione "INDIETRO" o in caso alla prima pagina con l'azione "HOME".  
- Ci saranno query per aggiornare UTENTE, STUDENTE, DOCENTE, CORSO, SEGUE, INSEGNA legate al sistema universitario.  
- Gli studenti aggiungendo progetti aggiornano PROGETTO, CONTROLLA, SVILUPPA.  
- Gli utenti scrivendo allegati aggiornano ALLEGATO.   
- I docenti possono modificare lo stato di progetto per accettare i requisiti, concludere il progetto.  









