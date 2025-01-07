/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Sahy
 */
public class MeubleVolume {
    private int idmeuble;
    private String nommeuble;
    private int idcategorie;
    private String nomcategorie;
    private int idstyle;
    private String nomstyle;
    private int idvolume;
    private String nomvolume;
    private double prixfabrication;
    private double totalmaindoeuvre;
    private double prixrevient;
    private double prixvente;
    private double benefice;

    public MeubleVolume() {
        
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
    
    public int getIdcategorie(){
        return this.idcategorie;
    }
    
    public void setIdcategorie(int idcategorie){
        this.idcategorie = idcategorie;
    }
    
    public String getNomcategorie(){
        return this.nomcategorie;
    }
    public void setNomcategorie(String nomcategorie){
        this.nomcategorie = nomcategorie;
    }
    
     public int getIdstyle(){
        return this.idstyle;
    }
    
    public void setIdstyle(int idstyle){
        this.idstyle = idstyle;
    }
    
    public String getNomstyle(){
        return this.nomstyle;
    }
    public void setNomstyle(String nomstyle){
        this.nomstyle = nomstyle;
    }
    
    public int getIdvolume() {
        return idvolume;
    }

    public void setIdvolume(int idvolume) {
        this.idvolume = idvolume;
    }

    public String getNomvolume() {
        return nomvolume;
    }

    public void setNomvolume(String nomvolume) {
        this.nomvolume = nomvolume;
    }

    public double getPrixfabrication() {
        return prixfabrication;
    }

    public void setPrixfabrication(double prixfabrication) {
        this.prixfabrication = prixfabrication;
    }
    
    public double getTotalmaindoeuvre(){
        return this.totalmaindoeuvre;
    }

    public void setTotalmaindoeuvre(double totalmaindoeuvre){
        this.totalmaindoeuvre = totalmaindoeuvre;
    }
    
    public double getPrixrevient(){
        return this.prixrevient;
    }
    
    public void setPrixrevient(double nprixrevient){
        this.prixrevient = nprixrevient;
    }

    public double getPrixvente() {
        return prixvente;
    }

    public void setPrixvente(double prixvente) {
        this.prixvente = prixvente;
    }

    public double getBenefice() {
        return benefice;
    }

    public void setBenefice(double benefice) {
        this.benefice = benefice;
    }
    
    

    private MeubleVolume(int idmeuble, String nommeuble, int idcategorie, String nomcategorie, int idstyle, String nomstyle, int idvolume, String nomvolume, double prixfabrication, double totalmaindoeuvre, double prixrevient, double prixvente, double benefice) {
        this.idmeuble = idmeuble;
        this.nommeuble = nommeuble;
        this.idcategorie = idcategorie;
        this.nomcategorie = nomcategorie;
        this.idstyle = idstyle;
        this.nomstyle = nomstyle;
        this.idvolume = idvolume;
        this.nomvolume = nomvolume;
        this.prixfabrication = prixfabrication;
        this.totalmaindoeuvre = totalmaindoeuvre;
        this.prixrevient = prixrevient;
        this.prixvente = prixvente;
        this.benefice = benefice;
    }
    
    
    public static MeubleVolume[] find(String filtre, Connection co)throws Exception{
        String sql;
        if(filtre!=null){
            sql = "select * from meublevolume4 "+filtre;
        }else{
            sql = "select * from meublevolume4";
        }
        Statement state = co.createStatement();
         
        try{
            ResultSet res = state.executeQuery(sql);
            List<MeubleVolume> valiny = new ArrayList<>();
            while(res.next()){
                int idmeuble = res.getInt("idmeuble");
                String nommeuble = res.getString("nommeuble");
                int idcategorie = res.getInt("idcategorie");
                String nomcategorie = res.getString("nomcategorie");
                int idstyle = res.getInt("idstyle");
                String nomstyle = res.getString("nomstyle");
                int idvolume = res.getInt("idvolume");
                String nomvolume = res.getString("nomvolume");
                double prixfabrication = res.getDouble("prixfabrication");
                double totalmaindoeuvre = res.getDouble("totalmaindoeuvre");
                double prixrevient = res.getDouble("prixrevient");
                double prixvente = res.getDouble("prixvente");
                double benefice = res.getDouble("benefice");
           
                MeubleVolume mb = new MeubleVolume(idmeuble, nommeuble, idcategorie, nomcategorie, idstyle, nomstyle, idvolume, nomvolume, prixfabrication, totalmaindoeuvre, prixrevient, prixvente, benefice);
                valiny.add(mb);
            }
            res.close();
            return valiny.toArray(new MeubleVolume[valiny.size()]);
        }catch(Exception ex){
            throw ex;
        }finally{
            state.close();
        }
    }
}
