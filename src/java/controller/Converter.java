/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import busquedas.BusquedaBiblioteca;
import busquedas.BusquedaGeneral;
import com.google.gson.Gson;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;
import model.Book;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author Ismael1
 */
public class Converter {
    public static List<Book> getBooks(String key, String nombre, int page, String site) {
        String res ="";
        if (site.equals("general")) {
            BusquedaGeneral busquedaGeneral = new BusquedaGeneral();
            res = busquedaGeneral.getJson(key, nombre, page+"");
        } else {
            BusquedaBiblioteca busquedaBiblioteca = new BusquedaBiblioteca();
            res = busquedaBiblioteca.findAll_JSON(String.class);
            System.out.println(res);
            res = "{ \"books\" : " + res + "}";
        }
        
        JSONObject obj = new JSONObject(res);
        JSONArray rest = obj.getJSONArray("books");
        List<Book> list = new ArrayList();
        Gson g = new Gson();
        
        for (int i = 0;i<rest.length();i++) {
            JSONObject book = rest.getJSONObject(i);
            String json = book.toString();
            System.out.println(json);
            Book tmp = (Book) g.fromJson(json, Book.class);
            list.add(tmp);
        }
        return list;
    }
}
