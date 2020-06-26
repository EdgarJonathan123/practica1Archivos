--  ***************************************************************************************************************
--  *********************************** 8. Romper Relacion ********************************************************
--  ***************************************************************************************************************
-- Después de un análisis más profundo se decidió que los Atletas pueden
-- participar en varias disciplinas y no sólo en una como está reflejado
-- actualmente en las tablas, por lo que se pide que realice lo siguiente.

-- a. Script que elimine la llave foránea de “cod_disciplina” que se
-- encuentra en la tabla “Atleta”.
\d ATLETA;
alter table ATLETA drop constraint atleta_disciplina_cod_disciplina_fkey;
\d ATLETA;


-- b. Script que cree una tabla con el nombre “Disciplina_Atleta” que
-- contendrá los siguiente campos:
-- i. Cod_atleta (llave foránea de la tabla Atleta)
-- ii. Cod_disciplina (llave foránea de la tabla Disciplina)
-- La llave primaria será la
create table DISCIPLINA_ATLETA
(
    cod_atleta                  integer not null,
    cod_disciplina              integer not null,

    foreign key(cod_atleta)     REFERENCES ATLETA(cod_atleta)           on delete cascade,
    foreign key(cod_disciplina) REFERENCES DISCIPLINA(cod_disciplina)   on delete cascade,

    primary key(cod_atleta,cod_disciplina)
);

\d DISCIPLINA_ATLETA;