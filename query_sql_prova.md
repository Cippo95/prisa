# QUERY DELLA APPLICAZIONE

Consiglio di leggere la descrizione in accoppiata con lo statechart della applicazione.

Il LOGIN a seconda dell'utente porta in una pagina dedicata allo studente o al docente.

Parlando dello studente: 

Esso come prima cosa potrà vedere i suoi progetti:

> select cod_pro

> from sviluppa
 
> where mat_stu = "<matricola_studente>"; 

Se non ho progetti posso aggiungere un progetto alla volta, 
azione che porta ad aggiornare le tabelle progetto, sviluppa e controlla.

(Query alter table etc.)

Cliccando uno dei progetti già esistenti apro una pagina dove ho i 
vari allegati:

select numero,messaggio
from allegato
where cod_pro='<codice_progetto>';

Qui posso aggiungere un allegato testuale e/o di tipo file.

(Query alter table etc.)

Dal punto di vista del docente:
Esso può vedere i corsi che insegna:

select nom_cor
from insegna
where mat_doc = '<matricola_docente>';

Può selezionarne uno vedendo i vari progetti legati ad esso:

select cod_pro
from controlla
where nom_cor = '<nom_corso>';

Ora cliccando uno dei progetti apro una pagina dove ho i 
vari allegati.

select numero,messaggio
from allegato
where cod_pro='<codice_progetto>';

Qui può aggiungere allegati al progetto.

Nuove problematiche da risolvere...

Ragioniamo sul progetto, la sua creazione e i vari stati in 
cui passa.

Uno studente deve poter creare un progetto: possibilità di
creare un progetto legato a più corsi, possibilità di collaborare
con più studenti.

Devo controllare che il corso possa avere progetti?
Se corso un anno necessità di progetto e quello dopo no?

Dal punto di vista del db:

Creando il progetto esso viene inserito dentro la tabella dei 
progetti (gli viene assegnato un codice e lo stato iniziale).

Viene aggiunto il progetto alla tabella controlla con relativo
corso che controlla, e alla tabella sviluppa che lega l'utente 
al progetto e al corso.

Creato il progetto si scrive un messaggio per proporre/richiedere
un progetto, raggiunto un accordo il prof. potrà accettare
i requisiti progettuali e quindi il progetto passerà ad accettato.
Si possono comunque fare domande dopo l'accettazione etc.
Concluso il progetto lo si comunica tramite messaggio al prof.
con eventuale allegato con file finale o link al progetto finale.
Valutato il progetto il prof può passare il progetto a concluso.
Scrivere il voto per messaggio ma dovrà essere riportato 
sul sito studiare.unife.it quindi direi no problema.

Posso provare a creare macchine a stati finiti o statechart
per l'utilizzo da parte dello studente, docente e del passaggio
di stato del progetto.


Ok, macchina a stati finiti, da rifinire come da rifinire
le query all'inizio e cose scritte














