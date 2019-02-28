CREATE TABLE IF NOT EXISTS tabella_utenti (
    username       varchar(30) primary key,
    password       varchar(30),
    userid         int
);

CREATE TABLE IF NOT EXISTS dati_connessione (
    anvizIpAddress    varchar(15),
    anvizPort         int,
    anvizDeviceCode   int,
    id_configurazione int primary key
);

--INSERT INTO dati_connessione
--    (192.168.16.3, 5010, 0, 1);

COPY tabella_utenti FROM '/tabella_utenti.txt' (DELIMITER '=');
COPY dati_connessione FROM '/dati_connessione.txt' (DELIMITER '=');
