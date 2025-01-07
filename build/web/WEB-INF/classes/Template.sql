/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  Sahy
 * Created: 12 déc. 2023
 */

create database meuble;
\c meuble


create table matiere(
    idmatiere serial primary key,
    nom varchar(50) unique not null,
    prixunitaire double precision
);

create table categorie(
    idcategorie serial primary key,
    nom varchar(50) unique not null
);

create table volume(
    idvolume serial primary key,
    nom varchar(50) unique not null,-- petite --moyenne --grande
    multiisa int
);

create table style(
    idstyle serial primary key,
    nom varchar(50) unique not null
);

create table meuble(
    idmeuble serial primary key,
    nom varchar(50) unique,
    idcategorie int references categorie(idcategorie),
    idstyle int references style(idstyle)
);

create table prixvente(
    idprixvente serial primary key,
    idmeuble int references meuble(idmeuble),
    idvolume int references volume(idvolume),
    prixvente double precision
);


create table stylematiere(
    idstylematiere serial primary key,
    idstyle int references style(idstyle),
    idmatiere int references matiere(idmatiere)
);

create table quantitematiere(
    idquantitematiere serial primary key,
    idmeuble int references meuble(idmeuble),
    idvolume int references volume(idvolume),
    idmatiere int references matiere(idmatiere),
    quantite double precision
);

create table mouvementstock(
    idmouvementstock serial primary key,
    date date,
    idmatiere int references matiere(idmatiere),
    quantite double  precision,
    typemouvement int
);


create table fabrication(
    idfabrication serial primary key,
    date date,
    idmeuble int references meuble(idmeuble),
    idvolume int references volume(idvolume),
    quantite double precision
);


create table typempiasa(
    idtypempiasa serial primary key,
    nom varchar(50) unique,
    salaireheure double precision
);

create table profil(
    idprofil serial primary key,
    nom varchar(30),
    annee int,
    tauxhoraire double precision
);


create table personne(
    idpersonne serial primary key,
    nom varchar(50),
    dateentree date,
    idtypempiasa int references typempiasa(idtypempiasa)
);

create or replace view v_personne as (
    select personne.*, typempiasa.nom as nomtypempiasa, typempiasa.salaireheure from personne
    join typempiasa on typempiasa.idtypempiasa = personne.idtypempiasa
);


create table maindoeuvre(
    idmaindoeuvre serial primary key,
    idstyle int references style(idstyle),
    idtypempiasa int references typempiasa(idtypempiasa),
    horaire double precision,
    isadefaut int
);

create table genre(
    idgenre serial primary key,
    nom varchar(15)
);

create table client(
    idclient serial primary key,
    nom varchar(50),
    idgenre int references genre(idgenre)    
);

create or replace view v_client as(
    select client.*,genre.nom as nomgenre from client
    join genre on client.idgenre = genre.idgenre
);

create table vente(
    idvente serial primary key,
    date date,
    idmeuble int references meuble(idmeuble),
    idvolume int references volume(idvolume),
    idclient int references client(idclient),
    quantite int
);

create or replace view v_vente as(
    select vente.*,meuble.nom as nommeuble, volume.nom as nomvolume,v_client.idgenre, v_client.nom as nomclient, v_client.nomgenre  from vente
    join meuble on meuble.idmeuble = vente.idmeuble
    join volume on volume.idvolume = vente.idvolume
    join v_client on v_client.idclient = vente.idclient
);

create or replace view v_quantitematiere as(
    select quantitematiere.*,meuble.nom as nommeuble,volume.nom as nomvolume,matiere.nom as nommatiere,matiere.prixunitaire, (matiere.prixunitaire*quantitematiere.quantite) as total from quantitematiere
    join meuble on meuble.idmeuble = quantitematiere.idmeuble
    join volume on volume.idvolume = quantitematiere.idvolume
    join matiere on matiere.idmatiere = quantitematiere.idmatiere
);


create or replace view v_mouvementstock as(
    select mouvementstock.*,matiere.nom as nommatiere,matiere.prixunitaire,matiere.prixunitaire*mouvementstock.quantite as prixmouvement  from mouvementstock
    join matiere on mouvementstock.idmatiere = matiere.idmatiere
);

create or replace view v_fabrication as(
    select fabrication.*,meuble.nom as nommeuble, volume.nom as nomvolume from fabrication
    join meuble on fabrication.idmeuble = meuble.idmeuble
    join volume on fabrication.idvolume = volume.idvolume
);

create or replace view v_provisoire1 as(
    select maindoeuvre.*,volume.* from maindoeuvre,volume
);

create or replace view v_maindoeuvre1 as(
    select maindoeuvre.*,typempiasa.nom as nomtypempiasa, typempiasa.salaireheure as salaireheure, style.nom as nomstyle from maindoeuvre 
    join typempiasa on maindoeuvre.idtypempiasa = typempiasa.idtypempiasa
    join style on maindoeuvre.idstyle = style.idstyle
);

create or replace view v_maindoeuvre as(
    select v_provisoire1.*,
    style.nom as nomstyle,
    typempiasa.nom as nomtypempiasa,
    typempiasa.salaireheure,
    (typempiasa.salaireheure*v_provisoire1.isadefaut*v_provisoire1.horaire*multiisa) as prixmaindoeuvre
    from v_provisoire1
    join style on style.idstyle = v_provisoire1.idstyle
    join typempiasa on typempiasa.idtypempiasa = v_provisoire1.idtypempiasa
);

create or replace view meublevolume as(
    select idmeuble,nommeuble,idvolume,nomvolume,sum(total) as prixfabrication from v_quantitematiere group by idmeuble,idvolume,nommeuble,nomvolume order by idmeuble
);

create or replace view meublevolume2 as(
    select meublevolume.*,meuble.idcategorie,categorie.nom as nomcategorie, meuble.idstyle, style.nom as nomstyle,(select sum(prixmaindoeuvre) from v_maindoeuvre where idstyle=meuble.idstyle and idvolume=meublevolume.idvolume) as totalmaindoeuvre from meublevolume
    join meuble on meuble.idmeuble = meublevolume.idmeuble
    join style on style.idstyle = meuble.idstyle
    join categorie on categorie.idcategorie = meuble.idcategorie
);

create or replace view meublevolume3 as(
    select *,(totalmaindoeuvre+prixfabrication) as prixrevient, (select prixvente from prixvente where idmeuble=meublevolume2.idmeuble and idvolume=meublevolume2.idvolume) from meublevolume2
);

create or replace view meublevolume4 as(
    select *,(prixvente-prixrevient)as benefice from meublevolume3
);