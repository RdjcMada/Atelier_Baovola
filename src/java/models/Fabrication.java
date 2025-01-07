/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import generalbdd.BDDObject;
import generalbdd.annotation.Column;
import generalbdd.annotation.PrimaryKey;
import generalbdd.annotation.Table;
import java.sql.Date;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Sahy
 */
@Table(nom = "fabrication", view="v_fabrication")
public class Fabrication extends BDDObject {

    @PrimaryKey
    @Column(name = "idfabrication")
    private int idfabrication;
    @Column(name = "date")
    private java.sql.Date date;
    @Column(name = "meuble")
    private int idmeuble;
    private String nommeuble;
    @Column(name = "idvolume")
    private int idvolume;
    private String nomvolume;
    @Column(name = "quantite")
    private double quantite;

    public int getIdfabrication() {
        return idfabrication;
    }

    public void setIdfabrication(int idfabrication) {
        this.idfabrication = idfabrication;
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

    public String getNommeuble() {
        return nommeuble;
    }

    public void setNommeuble(String nommeuble) {
        this.nommeuble = nommeuble;
    }

    public int getIdvolume() {
        return idvolume;
    }

    public void setIdvolume(int idvolume) {
        this.idvolume = idvolume;
    }

    public String getNomolume() {
        return nomvolume;
    }

    public void setNomvolume(String nomvolume) {
        this.nomvolume = nomvolume;
    }

    public double getQuantite() {
        return quantite;
    }

    public void setQuantite(double quantite) {
        this.quantite = quantite;
    }

    public Fabrication(int idfabrication, Date date, int idmeuble, int idvolume, double quantite) {
        this.setIdfabrication(idfabrication);
        this.setDate(date);
        this.setIdmeuble(idmeuble);
        this.setIdvolume(idvolume);
        this.setQuantite(quantite);
    }

    public Fabrication(int idfabrication, Date date, int idmeuble, String nommeuble, int idvolume, String nomvolume, double quantite) {
        this.setIdfabrication(idfabrication);
        this.setDate(date);
        this.setIdmeuble(idmeuble);
        this.setNomvolume(nomvolume);
        this.setIdvolume(idvolume);
        this.setNomvolume(nomvolume);
        this.setQuantite(quantite);
    }

    @Override
    public Fabrication[] find(String filtre, Connection co) throws Exception {
        Statement state = co.createStatement();
        List<Fabrication> valiny = new ArrayList<>();
        try {
            String sql = "select * from v_fabrication where " + filtre;
            System.out.println(sql);
            ResultSet res = state.executeQuery(sql);
            while (res.next()) {
                int idfabrication = res.getInt("idfabrication");
                java.sql.Date date = res.getDate("date");
                int idmeuble = res.getInt("idmeuble");
                String nommeuble = res.getString("nommeuble");
                int idvolume = res.getInt("idvolume");
                String nomvolume = res.getString("nomvolume");
                double quantite = res.getDouble("quantite");
                Fabrication fab = new Fabrication(idfabrication, date, idmeuble, nommeuble, idvolume, nomvolume, quantite);
                valiny.add(fab);
            }
            res.close();
            return valiny.toArray(new Fabrication[valiny.size()]);
        } catch (Exception ex) {
            throw ex;
        } finally {
            state.close();
        }

    }
    
    public Quantitematiere[] getAllQuantitematiere(Connection co)throws Exception{
        return Quantitematiere.findByIdMeubleIdvolume(this.getIdmeuble(), this.getIdvolume(), co);
    }
    
    @Override
    public void insert(Connection co)throws Exception{
        try{
            co.setAutoCommit(false);
            Quantitematiere[] liste = Quantitematiere.findByIdMeubleIdvolume(this.getIdmeuble(), this.getIdvolume(), co);
            for(Quantitematiere qm : liste){
                Mouvementstock mv = new Mouvementstock(0, qm.getIdmatiere(), utilitaires.Util.DateNow(), qm.getQuantite()*this.getQuantite(), 2);
                mv.insert(co);
            }
            super.insert(co);
            co.commit();
        }catch(Exception ex){
            try{
                co.rollback();
            }catch(Exception e){
                throw e;
            }
            throw ex;
            
        }finally{
            co.setAutoCommit(true);
        }
    }
    
}