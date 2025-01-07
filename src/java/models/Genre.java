/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
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
@Table(nom = "genre", view = "genre")
public class Genre extends BDDObject{
    @PrimaryKey
    @Column(name = "idgenre")
    private int idgenre;
    @Column(name = "nom")
    private String nom;

    public int getIdgenre() {
        return idgenre;
    }

    public void setIdgenre(int idgenre) {
        this.idgenre = idgenre;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public Genre() {
    }

    public Genre(int idgenre, String nom) {
        this.idgenre = idgenre;
        this.nom = nom;
    }
    
    @Override
    public Genre[] find(String filtre, Connection co)throws Exception{
        Object[] obj = super.find(filtre, co);
        return Arrays.copyOf(obj,obj.length,Genre[].class);
    }
        
}
