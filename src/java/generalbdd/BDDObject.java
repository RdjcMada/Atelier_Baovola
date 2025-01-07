package generalbdd;


import utilitaires.Util;
import generalbdd.annotation.*;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.ResultSetMetaData;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.ArrayList;
import java.util.Date;

import java.lang.reflect.*;

public class BDDObject {
    public void insert(Connection connexion) throws Exception {
        
        Statement state = connexion.createStatement();
        try {
            String values = this.preparedInsert(connexion);
            // System.out.println("INSERT INTO " +
            // o.getClass().getAnnotation(Table.class).nom() + "
            // VALUES " + values);
            System.out.println("INSERT INTO " + this.getClass().getAnnotation(Table.class).nom() + " VALUES " + values);
            state.executeUpdate("INSERT INTO " + this.getClass().getAnnotation(Table.class).nom() + " VALUES " + values);
                       
            ResultSet resultat = state
                    .executeQuery("SELECT id"+this.getClass().getSimpleName().toLowerCase()+" FROM " + this.getClass().getAnnotation(Table.class).nom()
                            + " order by id"+this.getClass().getSimpleName().toLowerCase()+" desc limit 1");
            resultat.next();
            Field champ = this.getClass().getDeclaredField("id"+this.getClass().getSimpleName().toLowerCase());
            champ.setAccessible(true);
            champ.set(this, resultat.getInt(1));
            // System.out.println(champ.getName() + " " + champ.get(this));
        } catch (Exception e) {
            throw e;
            //e.printStackTrace();
            //connexion.rollback();
        } finally {
            state.close();
        }
    }

    public void update(String[] attributs, String filtre, Connection connexion) throws Exception {
    
        if (filtre == null) {
            Field attribut = Util.listAllAttributes(this.getClass(), PrimaryKey.class).get(0);
            attribut.setAccessible(true);
            filtre = this.getColumnName(attribut) + "='" + attribut.get(this) + "'";
        }
        Statement state = connexion.createStatement();
        try {
            String modif = this.preparedUpdate(attributs);
            System.out.println(
                    "UPDATE " + this.getClass().getAnnotation(Table.class).nom() + " SET " + modif + " where " + filtre);
            state.executeUpdate(
                    "UPDATE " + this.getClass().getAnnotation(Table.class).nom() + " SET " + modif + " where " + filtre);
            
        } catch (Exception e) {
            throw e;
            //e.printStackTrace();
            //connexion.rollback();
        } finally {
            state.close();
        }
    }

    public void delete(String filtre, Connection connexion) throws Exception {
        
        if (filtre == null) {
            Field attribut = Util.listAllAttributes(this.getClass(), PrimaryKey.class).get(0);
            attribut.setAccessible(true);
            filtre = this.getColumnName(attribut) + "=" + attribut.get(this);
        }
        Statement state = connexion.createStatement();
        try {
            state.executeUpdate("DELETE FROM " + this.getClass().getAnnotation(Table.class).nom() + " where " + filtre);
        } catch (Exception e) {
            throw e;
            //e.printStackTrace();
            //connexion.rollback();
        } finally {
            state.close();
        }
    }

    public Object[] find(String filtre, Connection connexion) throws Exception {
        
        if (filtre == null) {
            Field attribut = Util.listAllAttributes(this.getClass(), PrimaryKey.class).get(0);
            attribut.setAccessible(true);
            filtre = this.getColumnName(attribut) + "=" + attribut.get(this);
        }
        Statement state = connexion.createStatement();
        System.out.println(
                "Filtre : " + "SELECT * FROM " + this.getClass().getAnnotation(Table.class).view() + " where " + filtre);
        ResultSet result = state
                .executeQuery("SELECT * FROM " + this.getClass().getAnnotation(Table.class).view() + " where " + filtre);
        List<Object> objets = new ArrayList<>();
        objets = turnIntoObjects(result, objets);
        result.close();
        state.close();
        Object[] lo = new Object[objets.size()];
        return objets.toArray(lo);
    }

    public List<Object> turnIntoObjects(ResultSet rs, List<Object> objets) throws Exception {
        ResultSetMetaData resultMeta = rs.getMetaData();
        Class c = this.getClass();
        Object o = c.newInstance();
        Object[] args = new Object[1];
        while (rs.next()) {
            o = (Object) c.newInstance();
            for (int n = 0; n < resultMeta.getColumnCount(); n++) {
                Method setter = this.getSetter(resultMeta.getColumnName(n + 1));
                args[0] = rs.getObject(n + 1);
                if (args[0] != null && this.getAttribut(resultMeta.getColumnName(n + 1)) != null) {
                    System.out.println(c.getSimpleName()+"."+setter.getName());
                    setter.invoke(o, args);
                    //System.out.println(setter.getName());
                }
            }
            objets.add(o);
        }
        return objets;
        
    }

    public String preparedInsert(Connection connexion) throws Exception{
        try {
            Statement state = connexion.createStatement();
            ResultSet result = state
                    .executeQuery("SELECT * FROM " + this.getClass().getAnnotation(Table.class).nom() + " LIMIT 1");
            ResultSetMetaData metadata = result.getMetaData();
            String values = "(";
            Object val = null;
            for (int i = 0; i < metadata.getColumnCount(); i++) {
                Field champ = this.getAttribut(metadata.getColumnName(i + 1));
                System.out.println(champ.getName()+" : ");
                
                champ.setAccessible(true);
                val = champ.get(this);
                values = this.putOnValue(values, val, champ);
            }
            System.out.println(values.substring(0, values.length() - 1).concat(")"));
            state.close();
            return values.substring(0, values.length() - 1).concat(")");
        } catch (Exception e) {
            throw e;
            //e.printStackTrace();
            //return null;
        }
    }

    public String putOnValue(String s, Object o, Field attribut) {
        if ((this.isNumber(o) || o == null) && attribut.getAnnotation(PrimaryKey.class) == null)
            s = s.concat(o + ",");
        else {
            if (attribut.getAnnotation(PrimaryKey.class) != null)
                s = s.concat("default,");
            else
                s = s.concat("'" + o + "',");
        }
        return s;
    }

    public String preparedUpdate(String[] attributs) throws Exception{
        try {
            String modif = "";
            for (int i = 0; i < attributs.length; i++) {
                System.out.println(attributs[i]);
                Field champ = this.getClass().getDeclaredField(attributs[i]);
                System.out.println(champ.getName());
                champ.setAccessible(true);
                Object val = champ.get(this);
                System.out.println(val);
                modif = modif.concat(this.getColumnName(champ) + "='" + val + "',");
                System.out.println("Modif " + this.getColumnName(champ) + "='" + val + "',");
            }
            return modif.substring(0, modif.length() - 1);
        } catch (Exception e) {
            throw e;
            //e.printStackTrace();
            //return null;
        }
    }

    public String getColumnName(Field attribut) {
        if (attribut.getAnnotation(Column.class) != null) {
            return attribut.getAnnotation(Column.class).name();
        }
        return attribut.getName();
    }

    public Field getAttribut(String nom) {
        Field[] attributs = this.getClass().getDeclaredFields();
        for (int i = 0; i < attributs.length; i++) {
            if (attributs[i].getAnnotation(Column.class) != null) {
                if (attributs[i].getAnnotation(Column.class).name().equalsIgnoreCase(nom)) {
                    return attributs[i];
                }
            }
            if (attributs[i].getName().equalsIgnoreCase(nom)) {
                return attributs[i];
            }
        }
        return null;
    }

    public Method getSetter(String field) {
        Method[] fonctions = this.getClass().getDeclaredMethods();
        for (int i = 0; i < fonctions.length; i++) {
            if (isSetter(fonctions[i]) && fonctions[i].getName().equalsIgnoreCase("set" + field))
                return fonctions[i];
        }
        return null;
    }

    public boolean isNumber(Object o) {
        try {
            Double.parseDouble(o.toString());
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public static boolean isGetter(Method m) {
        boolean result = m.getName().startsWith("get")
                && (m.getParameterTypes().length == 0)
                && (!Void.class.equals(m.getReturnType()));
        return result;
    }

    public static boolean isSetter(Method m) {
        boolean result = m.getName().startsWith("set") &&
                (m.getParameterTypes().length == 1);
        return result;
    }

    public static Date stringToDate(String date) throws Exception {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
        if (date.indexOf('T') != -1) {
            sdf = new SimpleDateFormat("yyyy-MM-dd'T'hh:mm");
        }
        Date d = sdf.parse(date);
        return d;
    }
}