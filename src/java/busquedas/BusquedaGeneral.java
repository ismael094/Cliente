/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package busquedas;

import javax.ws.rs.ClientErrorException;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.WebTarget;

/**
 * Jersey REST client generated for REST resource:Filtro [filtro]<br>
 * USAGE:
 * <pre>
 *        BibliotecaGeneral client = new BibliotecaGeneral();
 *        Object response = client.XXX(...);
 *        // do whatever with response
 *        client.close();
 * </pre>
 *
 * @author Ismael1
 */
public class BusquedaGeneral {

    private WebTarget webTarget;
    private Client client;
    private static final String BASE_URI = "http://ws.docencia.ces.siani.es/a01/FiltroWS/webresources";

    public BusquedaGeneral() {
        client = javax.ws.rs.client.ClientBuilder.newClient();
        webTarget = client.target(BASE_URI).path("filtro");
    }

    public String getNovedades() throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path("Novedades");
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(String.class);
    }

    public void putJson(Object requestEntity) throws ClientErrorException {
        webTarget.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).put(javax.ws.rs.client.Entity.entity(requestEntity, javax.ws.rs.core.MediaType.APPLICATION_JSON));
    }

    public String getJson(String key, String nombre, String page) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path(java.text.MessageFormat.format("{0}, {1}, {2}", new Object[]{key, nombre, page}));
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(String.class);
    }

    public void close() {
        client.close();
    }
    
}
