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
import java.util.Arrays;
import java.util.List;

/**
 *
 * @author Sahy
 */
@Table(nom = "vente", view = "v_vente")
public class Vente extends BDDObject {

    @PrimaryKey
    @Column(name = "idvente")
    private int idvente;
    @Column(name = "date")
    private java.sql.Date date;
    @Column(name = "idmeuble")
    private int idmeuble;
    @Column(name = "idvolume")
    private int idvolume;
    @Column(name = "idclient")
    private int idclient;
    @Column(name = "quantite")
    private int quantite;
    private int idgenre;
    private String nommeuble;
    private String nomvolume;
    private String nomclient;
    private String nomgenre;

    public int getIdvente() {
        return idvente;
    }

    public void setIdvente(int idvente) {
        this.idvente = idvente;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getIdmeuble() {
        return idmeuble;
    }

    public void setIdmeuble(int idmeuble) {
        this.idmeuble = idmeuble;
    }

    public int getIdvolume() {
        return idvolume;
    }

    public void setIdvolume(int idvolume) {
        this.idvolume = idvolume;
    }

    public int getIdclient() {
        return idclient;
    }

    public void setIdclient(int idclient) {
        this.idclient = idclient;
    }

    public int getQuantite() {
        return quantite;
    }

    public void setQuantite(int quantite) {
        this.quantite = quantite;
    }

    public String getNommeuble() {
        return nommeuble;
    }

    public void setNommeuble(String nommeuble) {
        this.nommeuble = nommeuble;
    }

    public String getNomvolume() {
        return nomvolume;
    }

    public void setNomvolume(String nomvolume) {
        this.nomvolume = nomvolume;
    }

    public String getNomclient() {
        return nomclient;
    }

    public void setNomclient(String nomclient) {
        this.nomclient = nomclient;
    }

    public String getNomgenre() {
        return nomgenre;
    }

    public void setNomgenre(String nomgenre) {
        this.nomgenre = nomgenre;
    }

    public int getIdgenre() {
        return idgenre;
    }

    public void setIdgenre(int idgenre) {
        this.idgenre = idgenre;
    }
    
    

    public Vente() {
    }

    public Vente(int idvente, Date date, int idmeuble, int idvolume, int idclient, int quantite, int idgenre, String nommeuble, String nomvolume, String nomclient, String nomgenre) {
        this.idvente = idvente;
        this.date = date;
        this.idmeuble = idmeuble;
        this.idvolume = idvolume;
        this.idclient = idclient;
        this.quantite = quantite;
        this.idgenre = idgenre;
        this.nommeuble = nommeuble;
        this.nomvolume = nomvolume;
        this.nomclient = nomclient;
        this.nomgenre = nomgenre;
    }

    public Vente(int idvente, Date date, int idmeuble, int idvolume, int idclient, int quantite) {
        this.idvente = idvente;
        this.date = date;
        this.idmeuble = idmeuble;
        this.idvolume = idvolume;
        this.idclient = idclient;
        this.quantite = quantite;
    }

    @Override
    public Vente[] find(String filtre, Connection co)throws Exception{
        Object[] obj = super.find(filtre, co);
        
        return Arrays.copyOf(obj,obj.length,Vente[].class);
    }

    /*@Override
    public Vente[] find(String filtre, Connection co) throws Exception {
        Statement state = co.createStatement();
        List<Vente> valiny = new ArrayList<>();
        try {
            String sql = "select * from v_vente where " + filtre;
            ResultSet res = state.executeQuery(sql);
            while (res.next()) {
                int idvente = res.getInt("idvente");
                java.sql.Date date = res.getDate("date");
                int idmeuble = res.getInt("idmeuble");
                int idvolume = res.getInt("idvolume");
                int idclient = res.getInt("idclient");
                int quantite = res.getInt("quantite");
                int idgenre = res.getInt("idgenre");
                String nommeuble = res.getString("nommeuble");
                String nomvolume = res.getString("nomvolume");
                String nomclient = res.getString("nomclient");
                String nomgenre = res.getString("nomgenre");
                
                Vente v = new Vente(idvente, date, idmeuble, idvolume, idclient, quantite,idgenre, nommeuble, nomvolume, nomclient, nomgenre);
                
                valiny.add(v);
            }
            return valiny.toArray(new Vente[valiny.size()]);
        } catch (Exception ex) {
            throw ex;
        } finally {
            state.close();
        }
    }*/

    public static Vente[]  findByIdmeubleIdvolume(int idmeuble, int idvolume, Connection co)throws Exception{
        return new Vente().find("idmeuble="+idmeuble+" and idvolume="+idvolume, co);
    }
    
    public static int getVenteTotal(Vente[] ventes){
        int valiny = 0;
        for(Vente v : ventes){
            valiny = valiny + v.getQuantite();
        }
        return valiny;
    }
    
    public static int getVenteHommeTotal(Vente[] ventes){
        int valiny = 0;
        for(Vente v : ventes){
            if(v.getIdgenre()==1){
                valiny = valiny + v.getQuantite();
            }
        }
        return valiny;
    }
    
    public static int getVenteFemmeTotal(Vente[] ventes){
        int valiny = 0;
        for(Vente v : ventes){
            if(v.getIdgenre()==2){
                valiny = valiny + v.getQuantite();
            }
        }
        return valiny;
    }
}
