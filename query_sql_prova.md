# QUERY DELLA APPLICAZIONE

**Consiglio di leggere la descrizione in accoppiata con lo statechart della applicazione "PRISA:PAGINE".**  

**NOTA: per qualche motivo mettere parole singole dentro a parantesi quadre le fa scomparire, per questo aggiungo un underscore alla fine di certe parole.**  

**PAGINA LOGIN**  
Corrisponde allo stato "LOGIN". 
Inserendo le credenziali in questa pagina a seconda dell'utente si apre una pagina dedicata allo studente o al docente. 

**LOGIN DI UNO STUDENTE:**

1. Se si tratta di uno studente, avviene l'azione "LOGIN STUDENTE" che porta quindi nello stato "MOSTRA_PROGETTI_S" che mostra i progetti dello studente:

> SELECT cod_pro  
> FROM sviluppa  
> WHERE mat_stu = <matricola_studente>;  

2. Da questa pagina lo studente può aggiungere progetti per i corsi che segue, corrisponde alla azione "AGGIUNGI PROGETTO", che porta in una nuova pagina "SELEZIONE_CORSO" dove bisogna indicare il corso per il quale si vuole fare il progetto.

Per trovare i corsi che lo studente segue:
> SELECT nom_cor  
> FROM segue  
> WHERE mat_stu = <numero_matricola>;  

Selezionato un corso verrà creato un progetto legato a tale corso (andando ad aggiornare le tabelle progetto, sviluppa e controlla), questo corrisponde all'azione "AGGIUNTA CORSO":

> INSERT INTO progetto(CODICE_PROGETTO,STATO)  
> VALUES (<codice_progetto>,"CREATO");  
>   
> INSERT INTO controlla(NOM_COR, COD_PRO)  
> VALUES ("<nome_corso>", <codice_progetto>);  
>   
> INSERT INTO sviluppa(MAT_STU, NOM_COR, COD_PRO)  
> VALUES (<numero_matricola>, "<nome_corso>", <codice_progetto>);  

Nel caso di progetti multi-corso allora si possono aggiungere anche i rimanenti corsi uno alla volta, mantenendo il codice di progetto e matricola, questo corrisponde all'azione "AGGIUNTA CORSI": 

> INSERT INTO controlla(NOM_COR, COD_PRO)  
> VALUES ("<nome_corso>", <codice_progetto>);  
>   
> INSERT INTO sviluppa(MAT_STU, NOM_COR, COD_PRO)  
> VALUES (<numero_matricola>, "<nome_corso>", <codice_progetto>); 

Nel caso di progetti multi-studente allora si possono aggiungere anche i rimanenti studenti, tenendo in cosiderazione il loro numero di matricola e i corsi a cui è legato il progetto, questo corrisponde all'azione "AGGIUNTA STUDENTI": 

> INSERT INTO sviluppa(MAT_STU, NOM_COR, COD_PRO)  
> VALUES (<numero_matricola>, "<nome_corso>", <codice_progetto>); 

(Qui in realtà credo che sarebbe meglio invitare gli studenti con cui si collabora o forse dovrebbero essere loro ad aggiungersi, aggiungerli direttamente non so se sia una buona pratica, devo ragionarci su.)

Terminate le modifiche si riceve un risultato positivo o negativo e dopo di che si può tornare indietro alla pagina dei progetti.

3. Cliccando uno dei progetti già esistenti apro una pagina dove ho i vari allegati, questo corrisponde alla azione "SELEZIONA UNO" passando allo stato "MOSTRA_ALLEGATI":

> SELECT numero,messaggio  
> FROM allegato  
> WHERE cod_pro = <codice_progetto>;  

4. Qui posso aggiungere un allegato testuale e/o di tipo file, corrisponde all'azione "SCRIVI ALLEGATO":  

> INSERT INTO prisa_v2.allegato (COD_PRO, NUMERO, MAT_MIT, messaggio_)   
> VALUES (<codice_progetto>, <numero_allegato>, <numero_matricola>, <messaggio_>);  

**LOGIN DI UN DOCENTE**

1. Se si tratta di un docente avviene l'azione "LOGIN DOCENTE" che porta allo stato "MOSTRA_CORSI_D", il docente vedrà i corsi che insegna:

> SELECT nom_cor  
> FROM insegna  
> WHERE mat_doc = <matricola_docente>;  

2. Da qui il docente può selezionare un corso e vedere i progetti legati ad esso, questo corrisponde a fare l'azione "SELEZIONA CORSO" e spostarsi quindi nello stato "MOSTRA_PROGETTI":

> SELECT cod_pro  
> FROM controlla  
> WHERE nom_cor = "<nome_corso>";  

3. Ora selezionando uno dei progetti si apre la pagina degli allegati, questo corrisponde a fare l'azione "SELEZIONA PR." e passare allo stato "MOSTRA_ALLEGATI".

> SELECT numero,messaggio    
> FROM allegato  
> WHERE cod_pro = <codice_progetto>;  

4. Da qui il docente può aggiungere allegati al progetto che corrisponde alla azione "SCRIVI ALLEGATO".

> INSERT INTO prisa_v2.allegato (COD_PRO, NUMERO, MAT_MIT, messaggio_)   
> VALUES (<codice_progetto>, <numero_allegato>, <numero_matricola>, <messaggio_>);

5. Il docente può inoltre cambiare lo stato al processo ad accettato o concluso, azione "CAMBIA STATO PROGETTO".

> UPDATE prisa_v2.progetto   
> SET STATO = "<stato_>"   
> WHERE (CODICE_PROGETTO = <codice_progetto>);  

**IN GENERALE**

- Da ogni stato diverso dal login si può effettuare il logout.  
- Negli altri stati/pagine si può andare indietro tramite l'azione "INDIETRO" o in caso alla prima pagina con l'azione "HOME".  
- Ci saranno query per aggiornare UTENTE, STUDENTE, DOCENTE, CORSO, SEGUE, INSEGNA legate al sistema universitario.  
- Gli studenti aggiungendo progetti aggiornano PROGETTO, CONTROLLA, SVILUPPA.  
- Gli utenti scrivendo allegati aggiornano ALLEGATO.   
- I docenti possono modificare lo stato di progetto per accettare i requisiti, concludere il progetto.  









