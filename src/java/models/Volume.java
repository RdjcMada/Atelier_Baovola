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
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Sahy
 */
@Table(nom = "volume", view = "volume")
public class Volume extends BDDObject{
    @PrimaryKey
    @Column(name = "idvolume")
    private int idvolume;
    @Column(name = "nom")
    private String nom;
    @Column (name = "multiisa")
    private int multiisa;

    
    public int getIdvolume() {
        return idvolume;
    }

    public void setIdvolume(int idvolume) {
        this.idvolume = idvolume;
    }


    
    public String getNom() {
        return nom;
    }

    public void setNom(String nom) throws Exception{
        if(nom.equals("")){
            throw new Exception("setNom volume vide");
        }
        this.nom = nom;
    }
 
    public void setMultiisa(int nMultiisa)throws Exception{
        if(nMultiisa  < 0){
            throw new Exception("multiisa negative");
        }
        this.multiisa = nMultiisa;
    }
    
    public int getMultiisa(){
        return this.multiisa;
    }
    
    public Volume(){
        
    }
    
    public Volume(String nom)throws Exception{
        this.setIdvolume(0);
        this.setNom(nom);
        
    }

    public Volume(int idvolume, String nom)throws Exception {
        this.setIdvolume(idvolume);
        this.setNom(nom);
    }
    
    @Override
    public Volume[] find(String filtre, Connection co)throws Exception{
        Statement state = co.createStatement();
        List<Volume> valiny = new ArrayList<>();
        try{
            String sql = "select * from volume where "+filtre;
            System.out.println(sql);
            ResultSet res = state.executeQuery(sql);
            while(res.next()){
                int idvolume = res.getInt("idvolume");
                String nom = res.getString("nom");
                
                Volume volume = new Volume(idvolume, nom);
                valiny.add(volume);
            }
            return valiny.toArray(new Volume[valiny.size()]);
        }catch(Exception ex){
            throw ex;
        }finally{
            state.close();
        }
        
    }
    
    
}
        
