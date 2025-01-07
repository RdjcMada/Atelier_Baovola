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
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Sahy
 */
@Table(nom = "personne",view="v_personne")
public class Personne extends BDDObject {

    @PrimaryKey
    @Column(name = "idpersonne")
    private int idpersonne;
    @Column(name = "nom")
    private String nom;
    @Column(name = "dateentree")
    private java.sql.Date dateentree;
    @Column(name = "idtypempiasa")
    private int idtypempiasa;

    private String nomtypempiasa;
    private double salaireheure;

    Profil profil;

    public Personne() {

    }

    public int getIdpersonne() {
        return idpersonne;
    }

    public void setIdpersonne(int idpersonne) {
        this.idpersonne = idpersonne;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public Date getDateentree() {
        return dateentree;
    }

    public void setDateentree(Date dateentree) {
        this.dateentree = dateentree;
    }

    public int getIdtypempiasa() {
        return idtypempiasa;
    }

    public void setIdtypempiasa(int idtypempiasa) {
        this.idtypempiasa = idtypempiasa;
    }

    public String getNomtypempiasa() {
        return nomtypempiasa;
    }

    public void setNomtypempiasa(String nomtypempiasa) {
        this.nomtypempiasa = nomtypempiasa;
    }

    public double getSalaireheure() {
        return salaireheure;
    }

    public void setSalaireheure(double salaireheure) {
        this.salaireheure = salaireheure;
    }

    public Profil getProfil() {
        return profil;
    }

    public void refreshProfil(Connection co) throws Exception {
        Date datenow = utilitaires.Util.DateNow();
        System.out.println(this.getDateentree());
        double dif = utilitaires.Util.differenceEnAnnees(this.getDateentree(), datenow);
        this.profil = Profil.findByAnnee(dif, co);
    }

    public Personne(int idpersonne, String nom, Date dateentree, int idtypempiasa, String nomtypempiasa, double salaireheure) {
        this.idpersonne = idpersonne;
        this.nom = nom;
        this.dateentree = dateentree;
        this.idtypempiasa = idtypempiasa;
        this.nomtypempiasa = nomtypempiasa;
        this.salaireheure = salaireheure;
    }

    public Personne(int idpersonne, String nom, Date dateentree, int idtypempiasa) {
        this.idpersonne = idpersonne;
        this.nom = nom;
        this.dateentree = dateentree;
        this.idtypempiasa = idtypempiasa;
    }
    
    public double getSalaireTotal(){
        return this.getSalaireheure()*this.getProfil().getTauxhoraire();
    }   
    

    @Override
    public Personne[] find(String filtre, Connection co) throws Exception {
        Statement state = co.createStatement();
        List<Personne> valiny = new ArrayList<>();
        try {
            String sql = "select * from v_personne where " + filtre;

            ResultSet res = state.executeQuery(sql);
            while (res.next()) {

                int idpersonne = res.getInt("idpersonne");
                String nom = res.getString("nom");;
                java.sql.Date dateentree = res.getDate("dateentree");
                int idtypempiasa = res.getInt("idtypempiasa");
                String nomtypempiasa = res.getString("nomtypempiasa");
                double salaireheure = res.getDouble("salaireheure");;

                Personne qm = new Personne(idpersonne, nom, dateentree, idtypempiasa, nomtypempiasa, salaireheure);
               
                qm.refreshProfil(co);
                valiny.add(qm);
            }
            return valiny.toArray(new Personne[valiny.size()]);
        } catch (Exception ex) {
            throw ex;
        } finally {
            state.close();
        }
    }

}
