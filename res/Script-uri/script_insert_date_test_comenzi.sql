-- Inserare in tabela Comenzi, produse_comenzi si UPDATE ingredientelor folosite

---------------------- COMANDA 1 ----------------------

BEGIN

DECLARE
    produse_comandate produse_comenzi.nr_produse_comandate%TYPE;
    produs_in_reteta Ingrediente.id_ingredient%TYPE;
    produs_in_stoc stocuri_produs.stoc_produs%TYPE;
BEGIN

    INSERT INTO Comenzi(id_comanda, data_comanda, nr_masa) VALUES(NULL,SYSDATE,3);

    -- Produs comandat: 2 X Ursus 330 ml
    BEGIN
        produse_comandate := 2;
        INSERT INTO produse_comenzi(nr_produse_comandate, Produse_nr_produs, Comenzi_id_comanda) VALUES(produse_comandate, (SELECT nr_produs FROM Produse WHERE nume_produs = 'Ursus 330 ml'), (SELECT MAX(id_comanda) FROM Comenzi));

        SELECT COUNT(Produse_nr_produs) INTO produs_in_reteta FROM Retete r WHERE r.Produse_nr_produs = (SELECT nr_produs FROM Produse WHERE nume_produs = 'Ursus 330 ml');
        SELECT COUNT(Produse_nr_produs) INTO produs_in_stoc FROM stocuri_produs sp WHERE sp.Produse_nr_produs = (SELECT nr_produs FROM Produse WHERE nume_produs = 'Ursus 330 ml');

        IF (produs_in_reteta > 0) THEN
            UPDATE Ingrediente i
            SET stoc_ingredient = stoc_ingredient - produse_comandate * (SELECT r.cantitate_ingredient FROM Retete r WHERE r.Produse_nr_produs = (SELECT nr_produs FROM Produse WHERE nume_produs = 'Ursus 330 ml') and r.Ingrediente_id_ingredient = i.id_ingredient)
            WHERE EXISTS (SELECT 1 FROM Retete r WHERE Produse_nr_produs = (SELECT nr_produs FROM Produse WHERE nume_produs = 'Ursus 330 ml') and r.Ingrediente_id_ingredient = i.id_ingredient);
        ELSIF (produs_in_stoc > 0) THEN
            UPDATE stocuri_produs sp
            SET stoc_produs = stoc_produs - produse_comandate
            WHERE sp.Produse_nr_produs = (SELECT nr_produs FROM Produse WHERE nume_produs = 'Ursus 330 ml');
        END IF;
    END;

    -- Produs comandat: 2 X Cotlet de porc la gratar
    BEGIN
        produse_comandate := 2;
        INSERT INTO produse_comenzi(nr_produse_comandate, Produse_nr_produs, Comenzi_id_comanda) VALUES(produse_comandate, (SELECT nr_produs FROM Produse WHERE nume_produs = 'Cotlet de porc la gratar'), (SELECT MAX(id_comanda) FROM Comenzi));

        SELECT COUNT(Produse_nr_produs) INTO produs_in_reteta FROM Retete r WHERE r.Produse_nr_produs = (SELECT nr_produs FROM Produse WHERE nume_produs = 'Cotlet de porc la gratar');
        SELECT COUNT(Produse_nr_produs) INTO produs_in_stoc FROM stocuri_produs sp WHERE sp.Produse_nr_produs = (SELECT nr_produs FROM Produse WHERE nume_produs = 'Cotlet de porc la gratar');

        IF (produs_in_reteta > 0) THEN
            UPDATE Ingrediente i
            SET stoc_ingredient = stoc_ingredient - produse_comandate * (SELECT r.cantitate_ingredient FROM Retete r WHERE r.Produse_nr_produs = (SELECT nr_produs FROM Produse WHERE nume_produs = 'Cotlet de porc la gratar') and r.Ingrediente_id_ingredient = i.id_ingredient)
            WHERE EXISTS (SELECT 1 FROM Retete r WHERE Produse_nr_produs = (SELECT nr_produs FROM Produse WHERE nume_produs = 'Cotlet de porc la gratar') and r.Ingrediente_id_ingredient = i.id_ingredient);
        ELSIF (produs_in_stoc > 0) THEN
            UPDATE stocuri_produs sp
            SET stoc_produs = stoc_produs - produse_comandate
            WHERE sp.Produse_nr_produs = (SELECT nr_produs FROM Produse WHERE nume_produs = 'Cotlet de porc la gratar');
        END IF;
    END;

END;

---------------------- COMANDA 2 ----------------------

DECLARE
    produse_comandate produse_comenzi.nr_produse_comandate%TYPE;
    produs_in_reteta Ingrediente.id_ingredient%TYPE;
    produs_in_stoc stocuri_produs.stoc_produs%TYPE;
BEGIN

    INSERT INTO Comenzi(id_comanda, data_comanda, nr_masa) VALUES(NULL,SYSDATE,2);

    -- Produs comandat: 2 X Supa cu legume
    BEGIN
        produse_comandate := 2;
        INSERT INTO produse_comenzi(nr_produse_comandate, Produse_nr_produs, Comenzi_id_comanda) VALUES(produse_comandate, (SELECT nr_produs FROM Produse WHERE nume_produs = 'Supa cu legume'), (SELECT MAX(id_comanda) FROM Comenzi));

        SELECT COUNT(Produse_nr_produs) INTO produs_in_reteta FROM Retete r WHERE r.Produse_nr_produs = (SELECT nr_produs FROM Produse WHERE nume_produs = 'Supa cu legume');
        SELECT COUNT(Produse_nr_produs) INTO produs_in_stoc FROM stocuri_produs sp WHERE sp.Produse_nr_produs = (SELECT nr_produs FROM Produse WHERE nume_produs = 'Supa cu legume');

        IF (produs_in_reteta > 0) THEN
            UPDATE Ingrediente i
            SET stoc_ingredient = stoc_ingredient - produse_comandate * (SELECT r.cantitate_ingredient FROM Retete r WHERE r.Produse_nr_produs = (SELECT nr_produs FROM Produse WHERE nume_produs = 'Supa cu legume') and r.Ingrediente_id_ingredient = i.id_ingredient)
            WHERE EXISTS (SELECT 1 FROM Retete r WHERE Produse_nr_produs = (SELECT nr_produs FROM Produse WHERE nume_produs = 'Supa cu legume') and r.Ingrediente_id_ingredient = i.id_ingredient);
        ELSIF (produs_in_stoc > 0) THEN
            UPDATE stocuri_produs sp
            SET stoc_produs = stoc_produs - produse_comandate
            WHERE sp.Produse_nr_produs = (SELECT nr_produs FROM Produse WHERE nume_produs = 'Supa cu legume');
        END IF;
    END;

END;

---------------------- COMANDA 3 ----------------------

DECLARE
    produse_comandate produse_comenzi.nr_produse_comandate%TYPE;
    produs_in_reteta Ingrediente.id_ingredient%TYPE;
    produs_in_stoc stocuri_produs.stoc_produs%TYPE;
BEGIN

    INSERT INTO Comenzi(id_comanda, data_comanda, nr_masa) VALUES(NULL,SYSDATE + 1,1);

    -- Produs comandat: 4 X Suc portocale 330 ml
    BEGIN
        produse_comandate := 4;
        INSERT INTO produse_comenzi(nr_produse_comandate, Produse_nr_produs, Comenzi_id_comanda) VALUES(produse_comandate, (SELECT nr_produs FROM Produse WHERE nume_produs = 'Suc portocale 330 ml'), (SELECT MAX(id_comanda) FROM Comenzi));

        SELECT COUNT(Produse_nr_produs) INTO produs_in_reteta FROM Retete r WHERE r.Produse_nr_produs = (SELECT nr_produs FROM Produse WHERE nume_produs = 'Suc portocale 330 ml');
        SELECT COUNT(Produse_nr_produs) INTO produs_in_stoc FROM stocuri_produs sp WHERE sp.Produse_nr_produs = (SELECT nr_produs FROM Produse WHERE nume_produs = 'Suc portocale 330 ml');

        IF (produs_in_reteta > 0) THEN
            UPDATE Ingrediente i
            SET stoc_ingredient = stoc_ingredient - produse_comandate * (SELECT r.cantitate_ingredient FROM Retete r WHERE r.Produse_nr_produs = (SELECT nr_produs FROM Produse WHERE nume_produs = 'Suc portocale 330 ml') and r.Ingrediente_id_ingredient = i.id_ingredient)
            WHERE EXISTS (SELECT 1 FROM Retete r WHERE Produse_nr_produs = (SELECT nr_produs FROM Produse WHERE nume_produs = 'Suc portocale 330 ml') and r.Ingrediente_id_ingredient = i.id_ingredient);
        ELSIF (produs_in_stoc > 0) THEN
            UPDATE stocuri_produs sp
            SET stoc_produs = stoc_produs - produse_comandate
            WHERE sp.Produse_nr_produs = (SELECT nr_produs FROM Produse WHERE nume_produs = 'Suc portocale 330 ml');
        END IF;
    END;

END;

---------------------- COMANDA 4 ----------------------

DECLARE
    produse_comandate produse_comenzi.nr_produse_comandate%TYPE;
    produs_in_reteta Ingrediente.id_ingredient%TYPE;
    produs_in_stoc stocuri_produs.stoc_produs%TYPE;
BEGIN

    INSERT INTO Comenzi(id_comanda, data_comanda, nr_masa) VALUES(NULL,SYSDATE + 1, 2);

    -- Produs comandat: 4 X Pizza cu piept de pui
    BEGIN
        produse_comandate := 4;
        INSERT INTO produse_comenzi(nr_produse_comandate, Produse_nr_produs, Comenzi_id_comanda) VALUES(produse_comandate, (SELECT nr_produs FROM Produse WHERE nume_produs = 'Pizza cu piept de pui'), (SELECT MAX(id_comanda) FROM Comenzi));

        SELECT COUNT(Produse_nr_produs) INTO produs_in_reteta FROM Retete r WHERE r.Produse_nr_produs = (SELECT nr_produs FROM Produse WHERE nume_produs = 'Pizza cu piept de pui');
        SELECT COUNT(Produse_nr_produs) INTO produs_in_stoc FROM stocuri_produs sp WHERE sp.Produse_nr_produs = (SELECT nr_produs FROM Produse WHERE nume_produs = 'Pizza cu piept de pui');

        IF (produs_in_reteta > 0) THEN
            UPDATE Ingrediente i
            SET stoc_ingredient = stoc_ingredient - produse_comandate * (SELECT r.cantitate_ingredient FROM Retete r WHERE r.Produse_nr_produs = (SELECT nr_produs FROM Produse WHERE nume_produs = 'Pizza cu piept de pui') and r.Ingrediente_id_ingredient = i.id_ingredient)
            WHERE EXISTS (SELECT 1 FROM Retete r WHERE Produse_nr_produs = (SELECT nr_produs FROM Produse WHERE nume_produs = 'Pizza cu piept de pui') and r.Ingrediente_id_ingredient = i.id_ingredient);
        ELSIF (produs_in_stoc > 0) THEN
            UPDATE stocuri_produs sp
            SET stoc_produs = stoc_produs - produse_comandate
            WHERE sp.Produse_nr_produs = (SELECT nr_produs FROM Produse WHERE nume_produs = 'Pizza cu piept de pui');
        END IF;
    END;

END;

---------------------- COMANDA 5 ----------------------

DECLARE
    produse_comandate produse_comenzi.nr_produse_comandate%TYPE;
    produs_in_reteta Ingrediente.id_ingredient%TYPE;
    produs_in_stoc stocuri_produs.stoc_produs%TYPE;
BEGIN

    INSERT INTO Comenzi(id_comanda, data_comanda, nr_masa) VALUES(NULL,SYSDATE + 2,1);

    -- Produs comandat: 2 X Limonada 330 ml
    BEGIN
        produse_comandate := 2;
        INSERT INTO produse_comenzi(nr_produse_comandate, Produse_nr_produs, Comenzi_id_comanda) VALUES(produse_comandate, (SELECT nr_produs FROM Produse WHERE nume_produs = 'Limonada 330 ml'), (SELECT MAX(id_comanda) FROM Comenzi));

        SELECT COUNT(Produse_nr_produs) INTO produs_in_reteta FROM Retete r WHERE r.Produse_nr_produs = (SELECT nr_produs FROM Produse WHERE nume_produs = 'Limonada 330 ml');
        SELECT COUNT(Produse_nr_produs) INTO produs_in_stoc FROM stocuri_produs sp WHERE sp.Produse_nr_produs = (SELECT nr_produs FROM Produse WHERE nume_produs = 'Limonada 330 ml');

        IF (produs_in_reteta > 0) THEN
            UPDATE Ingrediente i
            SET stoc_ingredient = stoc_ingredient - produse_comandate * (SELECT r.cantitate_ingredient FROM Retete r WHERE r.Produse_nr_produs = (SELECT nr_produs FROM Produse WHERE nume_produs = 'Limonada 330 ml') and r.Ingrediente_id_ingredient = i.id_ingredient)
            WHERE EXISTS (SELECT 1 FROM Retete r WHERE Produse_nr_produs = (SELECT nr_produs FROM Produse WHERE nume_produs = 'Limonada 330 ml') and r.Ingrediente_id_ingredient = i.id_ingredient);
        ELSIF (produs_in_stoc > 0) THEN
            UPDATE stocuri_produs sp
            SET stoc_produs = stoc_produs - produse_comandate
            WHERE sp.Produse_nr_produs = (SELECT nr_produs FROM Produse WHERE nume_produs = 'Limonada 330 ml');
        END IF;
    END;

END;

END;