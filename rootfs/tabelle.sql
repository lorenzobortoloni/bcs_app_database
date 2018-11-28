CREATE TABLE IF NOT EXISTS tabella_utenti (
    username       varchar(30),
    password       varchar(30),
    userid         int
);

CREATE TABLE IF NOT EXISTS dati_connessione (
    anvizIpAddress    varchar(15),
    anvizPort         int,
    anvizDeviceCode   int
);

INSERT INTO dati_connessione
    ('192.168.16.3', 5010, 0);

COPY tabella_utenti FROM '/tabella_utenti.txt' (DELIMITER '=');
