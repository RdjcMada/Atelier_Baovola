/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import generalbdd.BDDObject;
import generalbdd.annotation.Column;
import generalbdd.annotation.PrimaryKey;
import generalbdd.annotation.Table;
import java.sql.Connection;
import java.util.Arrays;

/**
 *
 * @author Sahy
 */
@Table(nom = "categorie", view="categorie")
public class Categorie extends BDDObject{
    
    @PrimaryKey
    @Column(name = "idcategorie")
    private int  idcategorie;
    @Column(name = "nom")
    private String nom;

    public int getIdcategorie() {
        return idcategorie;
    }

    public void setIdcategorie(int idcategorie) throws Exception{
        if(idcategorie<0){
            throw new Exception("setIdcategorie : valeur negative");
        }
        this.idcategorie = idcategorie;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) throws Exception{
        if(nom.equals("")){
            throw new Exception("setNom Categorie vide");
        }
        this.nom = nom;
    }

    public Categorie() {
    }

    public Categorie(int idcategorie, String nom) {
        this.idcategorie = idcategorie;
        this.nom = nom;
    }
    
    public Categorie(String nom)throws Exception{
        this.setIdcategorie(0);
        this.setNom(nom);
    }
    
    @Override
    public Categorie[] find(String filtre, Connection co)throws Exception{
        Object[] obj = super.find(filtre, co);
        return Arrays.copyOf(obj,obj.length,Categorie[].class);
    }
    
    public static Categorie findById(int id,Connection co)throws Exception{
        Categorie[] cats = new Categorie().find("idcategorie="+id , co);
        if(cats.length==0){
            throw new Exception("categorie innexistante");
        }
        return cats[0];
    } 
    
    
}
