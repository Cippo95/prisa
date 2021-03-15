# DOCUMENTO DEI REQUISITI DEL PROGETTO

Si vuole gestire il ciclo di vita dei progetti dei corsi universitari attraverso una applicazione web apposita piuttosto che tramite email.

### CASO D'USO TIPICO
L'applicazione verrà usata dagli studenti e i docenti per la gestione dei progetti universitari.
Effettutato il login gli studenti e i docenti avranno opzioni diverse:
- Gli studenti potranno gestire i loro progetti per i vari corsi.
Nello specifico potranno proporre o richiede (se possibile) un progetto per un corso (o più corsi), il docente (o docenti) quindi valuterà i requisiti e proporrà in caso modifiche.
Raggiunto un accordo sui requisiti il progetto sarà approvato dal docente(o docenti) e al termine del progetto lo studente condividerà la documentazione e il codice sorgente tramite allegato o tramite link a repository remoti.
- I docenti potranno vedere i vari progetti legati ai corsi che insegnano e quindi interagire con essi nella definizione dei requisiti, accettandoli e chiudendoli una volta terminati.

### REQUISITI DELLA BASE DI DATI

La base di dati deve tenere traccia degli utenti (studenti e docenti), dei corsi, dei progetti e degli allegati (note o file).

- Gli utenti hanno una matricola che li identifica univocamente, un nome e un cognome.

- Gli studenti sono utenti che seguono dei corsi e sviluppano per essi dei progetti. 

- I docenti sono utenti che insegnano i corsi (almeno 1).

- I corsi hanno un nome del corso che li identifica univocamente. Un corso avrà diversi progetti sviluppati per esso dagli studenti (userò per questa relazione la parola "controlla").

- I progetti hanno un codice progetto e uno stato.

- Gli allegati sono contenuti all'interno dei progetti, essi contengono messaggi, file binari, o entrambi, creati dagli utenti. Ad esempio un utente può scrivere un messaggio e condividere dei file di documentazione o sorgenti del progetto. Gli allegati all'interno del progetto si distinguono per il loro numero d'ordine.

### NOTE SUL FUNZIONAMENTO E QUESTIONI APERTE

Per quanto riguarda gli stati di un progetto:

- Il progetto va in stato di "specifica" (dei requisiti) appena l'utente propone o richiede il progetto attraverso un messaggio.

- Lo stato del progetto diventa "accettato" dopo che il prof convalida i requisiti.

- Lo stato del progetto è "concluso" una volta che lo studente ha consegnato il necessario, cioè documentazione, sorgenti del software ed è stato valutato il suo operato.

Per quanto riguarda progetti multi-corso, multi-utente:

- A livello di database non ci sono problemi con progetti multi-corso, multi-studente, di fatto un progetto può essere legato a più corsi e studenti, devo però ragionare su come gestire a livello applicazione questa evenienza al meglio.








