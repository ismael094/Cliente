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
 * Jersey REST client generated for REST resource:we
 * [database.libros/TITLE/{title}]<br>
 * USAGE:
 * <pre>
 *        BusquedaTituloBiblioteca client = new BusquedaTituloBiblioteca();
 *        Object response = client.XXX(...);
 *        // do whatever with response
 *        client.close();
 * </pre>
 *
 * @author Ismael1
 */
public class BusquedaTituloBiblioteca {

    private WebTarget webTarget;
    private Client client;
    private static final String BASE_URI = "http://ws.docencia.ces.siani.es/a01/Busquedas/webresources/";

    public BusquedaTituloBiblioteca(String title) {
        client = javax.ws.rs.client.ClientBuilder.newClient();
        String resourcePath = java.text.MessageFormat.format("database.libros/TITLE/{0}", new Object[]{title});
        webTarget = client.target(BASE_URI).path(resourcePath);
    }

    public void setResourcePath(String title) {
        String resourcePath = java.text.MessageFormat.format("database.libros/TITLE/{0}", new Object[]{title});
        webTarget = client.target(BASE_URI).path(resourcePath);
    }

    /**
     * @param responseType Class representing the response
     * @return response object (instance of responseType class)
     */
    public <T> T findByTitle_XML(Class<T> responseType) throws ClientErrorException {
        return webTarget.request(javax.ws.rs.core.MediaType.APPLICATION_XML).get(responseType);
    }

    /**
     * @param responseType Class representing the response
     * @return response object (instance of responseType class)
     */
    public <T> T findByTitle_JSON(Class<T> responseType) throws ClientErrorException {
        return webTarget.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public void close() {
        client.close();
    }
    
}
