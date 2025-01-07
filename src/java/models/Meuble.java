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
@Table(nom = "meuble", view="meuble")
public class Meuble extends BDDObject{
    
    @PrimaryKey
    @Column(name = "idmeuble")
    private int  idmeuble;
    @Column(name = "nom")
    private String nom;
    @Column(name = "idcategorie")
    private int  idcategorie;
    @Column(name = "idstyle")
    private int  idstyle;
    
    public int getIdmeuble() {
        return idmeuble;
    }

    public void setIdmeuble(int idmeuble) throws Exception{
        if(idmeuble<0){
            throw new Exception("setIdmeuble : valeur negative");
        }
        this.idmeuble = idmeuble;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) throws Exception{
        if(nom.equals("")){
            throw new Exception("setNom Meuble vide");
        }
        this.nom = nom;
    }
    
    public int getIdcategorie() {
        return idcategorie;
    }

    public void setIdcategorie(int idcategorie) throws Exception{
        if(idcategorie<0){
            throw new Exception("setIdcategorie : valeur negative");
        }
        this.idcategorie = idcategorie;
    }

    public int getIdstyle() {
        return idstyle;
    }

    public void setIdstyle(int idstyle) throws Exception{
        if(idstyle<0){
            throw new Exception("setIdcategorie : valeur negative");
        }
        this.idstyle = idstyle;
    }

    public Meuble() {
    }
    
    public Meuble(int idMeuble,String nom,String idcategorie,String idStyle ) {
        this.idmeuble = idMeuble;
        this.nom = nom;
        this.idcategorie = Integer.parseInt(idcategorie);
        this.idstyle = Integer.parseInt(idStyle);
    }

    public Meuble(int idMeuble,String nom,int idcategorie,int idStyle ) {
        this.idmeuble = idMeuble;
        this.nom = nom;
        this.idcategorie = idcategorie;
        this.idstyle = idStyle;
    }
    
    public Meuble(int idcategorie, String nom) {
        this.idcategorie = idcategorie;
        this.nom = nom;
    }
    
    public Meuble(String nom)throws Exception{
        this.setIdcategorie(0);
        this.setNom(nom);
    }
    
    @Override
    public Meuble[] find(String filtre, Connection co)throws Exception{
        Object[] obj = super.find(filtre, co);
        return Arrays.copyOf(obj,obj.length,Meuble[].class);
    }
    
    public static Meuble findById(int id,Connection co)throws Exception{
        Meuble[] cats = new Meuble().find("idmeuble="+id , co);
        if(cats.length==0){
            throw new Exception("meuble innexistante");
        }
        return cats[0];
    }
    
    public Style getStyle(Connection co)throws Exception{
        return Style.findById(this.getIdstyle(), co);
    }
    
    
}
