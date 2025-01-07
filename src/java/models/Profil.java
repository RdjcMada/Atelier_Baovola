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
@Table(nom = "profil", view = "profil")
public class Profil extends BDDObject{
    @PrimaryKey
    @Column(name = "idprofil")
    private int idprofil;
    @Column(name = "nom")
    private String nom;
    @Column(name = "annee")
    private int annee;
    @Column(name = "tauxhoraire")
    private double tauxhoraire;

    public int getIdprofil() {
        return idprofil;
    }

    public void setIdprofil(int idprofil) {
        this.idprofil = idprofil;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public int getAnnee() {
        return annee;
    }

    public void setAnnee(int annee) {
        this.annee = annee;
    }

    public double getTauxhoraire() {
        return tauxhoraire;
    }

    public void setTauxhoraire(double tauxhoraire) {
        this.tauxhoraire = tauxhoraire;
    }

    public Profil() {
    }

    public Profil(int idprofil, String nom, int annee, double tauxhoraire) {
        this.idprofil = idprofil;
        this.nom = nom;
        this.annee = annee;
        this.tauxhoraire = tauxhoraire;
    }

    
    
    @Override
    public Profil[] find(String filtre, Connection connexion) throws Exception {
        Object[] obj = super.find(filtre, connexion);
        return  Arrays.copyOf(obj,obj.length,Profil[].class);
    }
    
    public static Profil findById(int id, Connection co)throws Exception{
        Profil[] profils = new Profil().find("idprofil="+id, co);
        if(profils.length == 0){
            throw new Exception("profil innexistant");
        }
        return profils[0];
    }
    public static Profil findByAnnee(double annee, Connection co)throws Exception{
        Profil[] profils = new Profil().find("annee<"+annee+" order by annee desc limit 1", co);
        if(profils.length == 0){
            throw new Exception("profil innexistant");
        }
        return profils[0];
    }
}
