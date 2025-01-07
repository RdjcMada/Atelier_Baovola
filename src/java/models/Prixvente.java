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
@Table(nom = "prixvente",view = "prixvente")
public class Prixvente extends BDDObject{
    @PrimaryKey
    @Column(name = "idprixvente")
    private int  idprixvente;
    @Column(name = "idmeuble")
    private int idmeuble;
    @Column(name = "idvolume")
    private int  idvolume;
    @Column(name = "prixvente")
    private double prixvente;

    public int getIdprixvente() {
        return idprixvente;
    }

    public void setIdprixvente(int idprixvente) {
        this.idprixvente = idprixvente;
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

    public double getPrixvente() {
        return prixvente;
    }

    public void setPrixvente(double prixvente) {
        this.prixvente = prixvente;
    }
    
    
    public Prixvente() {
    }

    public Prixvente(int idprixvente, int idmeuble, int idvolume, double prixvente) {
        this.idprixvente = idprixvente;
        this.idmeuble = idmeuble;
        this.idvolume = idvolume;
        this.prixvente = prixvente;
    }
    
    
       
    @Override
    public Prixvente[] find(String filtre, Connection co)throws Exception{
        Object[] obj = super.find(filtre, co);
        return Arrays.copyOf(obj,obj.length,Prixvente[].class);
    }
    
    public static Prixvente findById(int id,Connection co)throws Exception{
        Prixvente[] cats = new Prixvente().find("idprixvente="+id , co);
        if(cats.length==0){
            throw new Exception("Prixvente innexistant");
        }
        return cats[0];
    }
    
    public static Prixvente findByIdmeubleIdvolume(int idmeuble, int idvolume, Connection co)throws Exception{
        Prixvente[] cats = new Prixvente().find("idmeuble="+idmeuble+" and idvolume="+idvolume , co);
        if(cats.length==0){
            return null;
        }
        return cats[0];
    }

    @Override
    public void insert(Connection connexion) throws Exception {
        Prixvente prixvente = Prixvente.findByIdmeubleIdvolume(this.getIdmeuble(), this.getIdvolume(), connexion);
        if(prixvente==null){
            super.insert(connexion);
        }else{
            throw new Exception("Prixvente deja existant");
        }
    }
    
    
}
