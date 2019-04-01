/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import busquedas.BusquedaAutorBiblioteca;
import busquedas.BusquedaBiblioteca;
import busquedas.BusquedaGeneral;
import busquedas.BusquedaISBNBiblioteca;
import busquedas.BusquedaSubjectBiblioteca;
import busquedas.BusquedaTituloBiblioteca;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;
import model.Book;
import model.Libros;
import model.Reservas;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author Ismael1
 */
public class Converter {
    public static int num ;
    
    public static List<Libros> getBooks(String key, String nombre, int page, String site) {
        String res ="";
        int num  = 0;
        if (site.equals("general")) {
            BusquedaGeneral busquedaGeneral = new BusquedaGeneral();
            res = busquedaGeneral.getJson(key, nombre, page+"");
        } else {
            if (nombre == null || nombre.equals("")) {
                nombre = "_";
            }
            switch (key) {
                case "title":
                    {
                        BusquedaTituloBiblioteca busquedaBiblioteca = new BusquedaTituloBiblioteca(nombre);
                        res = busquedaBiblioteca.findByTitle_JSON(String.class);
                        JSONArray tmp = new JSONArray(res);
                        Converter.num = tmp.length();
                        break;
                    }
                case "authorName":
                    {
                        BusquedaAutorBiblioteca busquedaBiblioteca = new BusquedaAutorBiblioteca(nombre);
                        res = busquedaBiblioteca.findByAuthorName_JSON(String.class);
                        JSONArray tmp = new JSONArray(res);
                        Converter.num = tmp.length();
                        break;
                    }
                case "isbn":
                    {
                        BusquedaISBNBiblioteca busquedaBiblioteca = new BusquedaISBNBiblioteca(nombre);
                        res = busquedaBiblioteca.findByIsbn_JSON(String.class);
                        JSONArray tmp = new JSONArray(res);
                        Converter.num = tmp.length();
                        break;
                    }
                case "subject":
                    {
                        BusquedaSubjectBiblioteca busquedaBiblioteca = new BusquedaSubjectBiblioteca(nombre);
                        res = busquedaBiblioteca.findBySubject_JSON(String.class);
                        JSONArray tmp = new JSONArray(res);
                        Converter.num = tmp.length();
                        break;
                    }
                default:
                    break;
            }
            res = "{ \"num\" : "+Converter.num+", \"books\" : " + res + "}";
        }
        System.out.println(res);
        JSONObject obj = new JSONObject(res);
        Converter.num = obj.getInt("num");
        JSONArray rest = obj.getJSONArray("books");
        Gson g = new Gson();
        List<Libros> b = g.fromJson(rest.toString(), new TypeToken<List<Libros>>(){}.getType());
        return b;
    }
    
    public static List<Libros> getNovedades() {
        BusquedaBiblioteca busquedaBiblioteca = new BusquedaBiblioteca();
        String res = busquedaBiblioteca.novedades_JSON(String.class);
        res = "{ \"books\" : " + res + "}";
        JSONObject obj = new JSONObject(res);
        JSONArray rest = obj.getJSONArray("books");
        Gson g = new Gson();
        List<Libros> b = g.fromJson(rest.toString(), new TypeToken<List<Libros>>(){}.getType());
        System.out.println(b);
        return b;
    }

    public static List<Reservas> misreservas(java.lang.String usuario) {
        mibiblio.MiBibliotecaWS_Service service = new mibiblio.MiBibliotecaWS_Service();
        mibiblio.MiBibliotecaWS port = service.getMiBibliotecaWSPort();
        String res = port.misreservas(usuario);
        Gson g = new Gson();
        List<Reservas> b = g.fromJson(res, new TypeToken<List<Reservas>>(){}.getType());
        return b;
    }
    
    public static List<Reservas> mispenalizaciones(java.lang.String usuario) {
        mibiblio.MiBibliotecaWS_Service service = new mibiblio.MiBibliotecaWS_Service();
        mibiblio.MiBibliotecaWS port = service.getMiBibliotecaWSPort();
        String res = port.penalizaciones(usuario);
        Gson g = new Gson();
        List<Reservas> b = g.fromJson(res, new TypeToken<List<Reservas>>(){}.getType());
        return b;
    }
    
    
    
}
