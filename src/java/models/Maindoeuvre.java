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
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Sahy
 */
@Table(nom = "maindoeuvre", view="v_maindoeuvre1")
public class Maindoeuvre extends BDDObject {

    @PrimaryKey
    @Column(name = "idmaindoeuvre")
    private int idmaindoeuvre;
    @Column(name = "idstyle")
    private int idstyle;
    private String nomstyle;
    @Column(name = "idtypempiasa")
    private int idtypempiasa;
    private String nomtypempiasa;
    @Column(name = "horaire")
    private double horaire;
    @Column(name = "isadefaut")
    private int isadefaut;

    public int getIdmaindoeuvre() {
        return idmaindoeuvre;
    }

    public void setIdmaindoeuvre(int idmaindoeuvre) {
        this.idmaindoeuvre = idmaindoeuvre;
    }

    public int getIdstyle() {
        return idstyle;
    }

    public void setIdstyle(int idstyle) {
        this.idstyle = idstyle;
    }

    public String getNomstyle() {
        return nomstyle;
    }

    public void setNomstyle(String nomstyle) {
        this.nomstyle = nomstyle;
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

    public double getHoraire() {
        return horaire;
    }

    public void setHoraire(double horaire) {
        this.horaire = horaire;
    }

    public int getIsadefaut() {
        return isadefaut;
    }

    public void setIsadefaut(int isadefaut) {
        this.isadefaut = isadefaut;
    }

    public Maindoeuvre() {
    }

    public Maindoeuvre(int idmaindoeuvre, int idstyle, int idtypempiasa, double horaire, int isadefaut) {
        this.idmaindoeuvre = idmaindoeuvre;
        this.idstyle = idstyle;
        this.idtypempiasa = idtypempiasa;
        this.horaire = horaire;
        this.isadefaut = isadefaut;
    }

    private Maindoeuvre(int idmaindoeuvre, int idstyle, String nomstyle, int idtypempiasa, String nomtypempiasa, double horaire, int isadefaut) {
        this.idmaindoeuvre = idmaindoeuvre;
        this.idstyle = idstyle;
        this.nomstyle = nomstyle;
        this.idtypempiasa = idtypempiasa;
        this.nomtypempiasa = nomtypempiasa;
        this.horaire = horaire;
        this.isadefaut = isadefaut;
    }

    @Override
    public Maindoeuvre[] find(String filtre, Connection co) throws Exception {
        Statement state = co.createStatement();
        List<Maindoeuvre> valiny = new ArrayList<>();
        try {
            String sql = "select * from v_maindoeuvre1 where " + filtre;
            System.out.println(sql);
            ResultSet res = state.executeQuery(sql);
            while (res.next()) {

                int idmaindoeuvre = res.getInt("idmaindoeuvre");
                int idstyle = res.getInt("idstyle");
                String nomstyle = res.getString("nomstyle");
                int idtypempiasa = res.getInt("idtypempiasa");
                String nomtypempiasa = res.getString("nomtypempiasa");
                double horaire = res.getDouble("horaire");
                int isadefaut = res.getInt("isadefaut");

                Maindoeuvre md = new Maindoeuvre(idmaindoeuvre, idstyle, nomstyle, idtypempiasa, nomtypempiasa, horaire, isadefaut);
                valiny.add(md);
            }
            return valiny.toArray(new Maindoeuvre[valiny.size()]);
        } catch (Exception ex) {
            throw ex;
        } finally {
            state.close();
        }
    }
    
    public static Maindoeuvre findByIdstyleIdtypempiasa(int idstyle, int idtypempiasa, Connection co)throws Exception{
        Maindoeuvre[] obj = new Maindoeuvre().find("idstyle="+idstyle+" and idtypempiasa="+idtypempiasa, co);
        if(obj.length == 0){
            return null;
        }
        return obj[0];
    }

    @Override
    public void insert(Connection co)throws Exception{
        if(Maindoeuvre.findByIdstyleIdtypempiasa(this.getIdstyle(), this.getIdtypempiasa(), co)==null){
            super.insert(co);
        }else{
            throw new Exception("Maindoeuvre deja existant");
        }
    }
}
