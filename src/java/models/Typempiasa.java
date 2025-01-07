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
@Table(nom = "typempiasa", view = "typempiasa")
public class Typempiasa extends BDDObject{
    @PrimaryKey
    @Column(name = "idtypempiasa")
    private int idtypempiasa;
    @Column(name = "nom")
    private String nom;
    @Column(name = "salaireheure")
    private double salaireheure;

    public Typempiasa() {
    }

    public int getIdtypempiasa() {
        return idtypempiasa;
    }

    public void setIdtypempiasa(int idtypempiasa) {
        this.idtypempiasa = idtypempiasa;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public double getSalaireheure() {
        return salaireheure;
    }

    public void setSalaireheure(double salaireheure) {
        this.salaireheure = salaireheure;
    }

    public Typempiasa(int idtypempiasa, String nom, double salaireheure) {
        this.idtypempiasa = idtypempiasa;
        this.nom = nom;
        this.salaireheure = salaireheure;
    }
    
    @Override
    public Typempiasa[] find(String filtre, Connection connexion) throws Exception {
        Object[] obj = super.find(filtre, connexion);
        return Arrays.copyOf(obj,obj.length,Typempiasa[].class);
    }
        
    
}
