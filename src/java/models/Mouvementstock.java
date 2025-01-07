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
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author RdjcMada
 */
@Table(nom = "mouvementstock", view = "v_mouvementstock")
public class Mouvementstock extends BDDObject {
    @PrimaryKey
    @Column(name = "idmouvementstock")
    int idmouvementstock;
    @Column(name = "idmatiere")
    int idmatiere;
    @Column(name = "date")
    java.sql.Date date;
    @Column(name = "quantite")
    double quantite;
    @Column(name = "typemouvement")
    int typemouvement;

    String nommatiere;
    double prixunitaire;
    double prixmouvement;

    ///Constucteur

    public Mouvementstock() {
    }
    
    
    public Mouvementstock(int idMouvementStock, int idMatiere, Date dateStock, double quantite, int typeMouvement) {
        this.idmouvementstock = idMouvementStock;
        this.idmatiere = idMatiere;
        this.date = dateStock;
        this.quantite = quantite;
        this.typemouvement = typeMouvement;
    }
    
     public Mouvementstock(int idMouvementStock, int idMatiere, String dateStock, double quantite, int typeMouvement) {
         try{
             this.idmouvementstock = idMouvementStock;
            this.idmatiere = idMatiere;
            this.setDate(dateStock);
            this.quantite = quantite;
            this.typemouvement = typeMouvement;
        }
        catch(Exception e){
             e.printStackTrace();
        }
        
    }

    public Mouvementstock(int idmouvementstock, int idmatiere, Date date, double quantite, int typemouvement, String nommatiere, double prixunitaire, double prixmouvement) {
        this.idmouvementstock = idmouvementstock;
        this.idmatiere = idmatiere;
        this.date = date;
        this.quantite = quantite;
        this.typemouvement = typemouvement;
        this.nommatiere = nommatiere;
        this.prixunitaire = prixunitaire;
        this.prixmouvement = prixmouvement;
    }

     
     

    ///Getter and setter
    public int getIdmouvementstock() {
        return idmouvementstock;
    }

    public void setIdmouvementstock(int idMouvementStock) throws Exception {
        if(idMouvementStock >0){
            this.idmouvementstock = idMouvementStock;
        }
        else{
            throw new Exception(" idMouvementStock negative");
        }
    }

    public int getIdmatiere() {
        return idmatiere;
    }

    public void setIdmatiere(int idMatiere) throws Exception {
        if(idMatiere > 0){
            this.idmatiere = idMatiere;
        }
        else{
            throw new Exception(" idMatiere negative");
        }   
    }

    public Date getDate() {
        return date;
    }

    public void setDate(String dateStock) throws Exception{
        try{
               // Utilisez SimpleDateFormat pour parser la chaîne en java.util.Date
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date utilDate = dateFormat.parse(dateStock);
                   
                // Convertissez java.util.Date en java.sql.Date
                Date sqlDate = new Date(utilDate.getTime());
                this.setDate(sqlDate);
        }
        catch(Exception e){
            
        }
    }
    public void setDate(Date dateStock) throws Exception {
        if(dateStock == null){
            this.date = dateStock;
        }
        else{
            throw new Exception(" dateStock null");
        }  
        
    }

    public double getQuantite() {
        return quantite;
    }

    public void setQuantite(double quantite) throws Exception {
        if(quantite > 0){
            this.quantite = quantite;
        }
        else{
            throw new Exception(" quantite negative");
        }  
    }
    
    public String getTypemouvementString(){
        if(this.getTypemouvement()==1){
            return "entree";
        }else{
            return "sortie";
        }
    }

    public int getTypemouvement() {
        return typemouvement;
    }

    public void setTypemouvement(int typeMouvement) throws Exception {
        if(typeMouvement > 0 || typeMouvement > 2 ){
            this.typemouvement = typeMouvement;
        }
        else{
            throw new Exception(" typeMouvement different de 1 et de 2");
        }  
    }

    public String getNommatiere() {
        return nommatiere;
    }

    public void setNommatiere(String nommatiere) {
        this.nommatiere = nommatiere;
    }

    public double getPrixunitaire() {
        return prixunitaire;
    }

    public void setPrixunitaire(double prixunitaire) {
        this.prixunitaire = prixunitaire;
    }

    public double getPrixmouvement() {
        return prixmouvement;
    }

    public void setPrixmouvement(double prixmouvement) {
        this.prixmouvement = prixmouvement;
    }

    @Override
    public Mouvementstock[] find(String filtre, Connection co)throws Exception{
        filtre = "select * from v_mouvementstock where "+filtre;
        Statement state = co.createStatement();
        List<Mouvementstock> valiny = new ArrayList<>();
        try {
            ResultSet res = state.executeQuery(filtre);
            while (res.next()) {
                int idmouvementstock = res.getInt("idmouvementstock");
                int idmatiere = res.getInt("idmatiere");
                Date date = res.getDate("date");
                double quantite = res.getDouble("quantite");
                int typemouvement = res.getInt("typemouvement");
                String nommatiere = res.getString("nommatiere");
                double prixunitaire = res.getDouble("prixunitaire");
                double prixmouvement = res.getDouble("prixmouvement");
                Mouvementstock ms = new Mouvementstock(idmouvementstock, idmatiere, date, quantite, typemouvement, nommatiere, prixunitaire, prixmouvement);
                valiny.add(ms);
            }
            return valiny.toArray(new Mouvementstock[valiny.size()]);
        } catch (Exception ex) {
            throw ex;
        } finally {
            state.close();
        }
    }    
    
    public static Mouvementstock findById(int idmouvementstock, Connection co)throws Exception{
        Mouvementstock[] obj = new Mouvementstock().find("idmouvementstock="+idmouvementstock, co);
        if(obj.length==0){
            throw new Exception("Mouvementstock innexistant");
        }
        return obj[0];
    }
    
    public static Mouvementstock[] findEntreeByIdmatiere(int idmatiere, Connection co)throws Exception{
        return new Mouvementstock().find("idmatiere="+idmatiere+" and typemouvement=1", co);
    }
    public static Mouvementstock[] findSortieByIdmatiere(int idmatiere, Connection co)throws Exception{
        return new Mouvementstock().find("idmatiere="+idmatiere+" and typemouvement=2", co);
    }
    
    public static double getQuantiteTotal(Mouvementstock[] liste){
        double valiny = 0;
        for(Mouvementstock mv : liste){
            valiny = valiny + mv.getQuantite();
        }
        return valiny;
    }
    
    public Matiere getMatiere(Connection co)throws Exception{
        return Matiere.findById(this.getIdmatiere(), co);
    }
    
    @Override
    public void insert(Connection co)throws Exception{
        if(this.getTypemouvement()==2){
            Matiere mat = this.getMatiere(co);
            if(mat.getQuantiteReste(co)<this.getQuantite()){
                throw new Exception("Quantite de "+mat.getNom()+" insuffisante au stock");
            }
        }
        super.insert(co);
    }
    
}
