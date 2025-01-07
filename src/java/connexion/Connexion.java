package connexion;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Sahy
 */
public class Connexion {
    Connection connectionPostgres;

    public Connection getConnectionPostgres() {
        return connectionPostgres;
    }

    public void setConnectionPostgres(Connection connectionPostgres) {
        this.connectionPostgres = connectionPostgres;
    }

    public Connexion(){
        
    }
    
    
    public void openPostgres()throws Exception{
        if(this.getConnectionPostgres()==null || this.getConnectionPostgres().isClosed()){
            Class.forName("org.postgresql.Driver");
            Connection co =  DriverManager.getConnection("jdbc:postgresql://localhost:5432/meuble","postgres","Soljah");
            this.setConnectionPostgres(co);
        }
    }
    
    
    public void openAll()throws Exception{
        this.openPostgres();
    }
    
    public void closePostgres()throws Exception{
        this.getConnectionPostgres().close();
    }
    
    
    public void closeAll()throws Exception{
        this.closePostgres();
    }
    
}
