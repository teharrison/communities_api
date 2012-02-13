 
/**
*
* @author brettin
*/
 
 
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import javax.ws.rs.core.MediaType;
 
public class RestClientEx1 {
 
    public RestClientEx1() {
        Client c = Client.create();
        c.setFollowRedirects(Boolean.TRUE);
        WebResource wr = c.resource("http://api.metagenomics.anl.gov/project/3");
        String response = wr.accept(MediaType.APPLICATION_JSON_TYPE).header("X-FOO", "BAR").get(String.class);       
        System.out.println(response);    
    }
   
    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        RestClientEx1 restClientEx1 = new RestClientEx1();
    }
}
