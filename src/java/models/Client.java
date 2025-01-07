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
@Table(nom = "client", view="v_client")
public class Client extends BDDObject {

    @PrimaryKey
    @Column(name = "idclient")
    private int idclient;
    @Column(name = "nom")
    private String nom;
    @Column(name = "idgenre")
    private int idgenre;
    private String nomgenre;

    public int getIdclient() {
        return idclient;
    }

    public void setIdclient(int idclient) {
        this.idclient = idclient;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public int getIdgenre() {
        return idgenre;
    }

    public void setIdgenre(int idgenre) {
        this.idgenre = idgenre;
    }

    public String getNomgenre() {
        return nomgenre;
    }

    public void setNomgenre(String nomgenre) {
        this.nomgenre = nomgenre;
    }

    public Client() {
    }

    public Client(int idclient, String nom, int idgenre, String nomgenre) {
        this.idclient = idclient;
        this.nom = nom;
        this.idgenre = idgenre;
        this.nomgenre = nomgenre;
    }

    public Client(int idclient, String nom, int idgenre) {
        this.idclient = idclient;
        this.nom = nom;
        this.idgenre = idgenre;
    }
    

    @Override
    public Client[] find(String filtre, Connection co) throws Exception {
        Statement state = co.createStatement();
        List<Client> valiny = new ArrayList<>();
        try {
            String sql = "select * from v_client where " + filtre;
            ResultSet res = state.executeQuery(sql);
            while (res.next()) {
                int idclient = res.getInt("idclient");
                String nom = res.getString("nom");
                int idgenre = res.getInt("idgenre");
                String nomgenre = res.getString("nomgenre");
                Client cl = new Client(idclient, nom, idgenre, nomgenre);
                valiny.add(cl);
            }
            return valiny.toArray(new Client[valiny.size()]);
        } catch (Exception ex) {
            throw ex;
        } finally {
            state.close();
        }
    }
    
}
