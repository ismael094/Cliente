/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Ismael1
 */
public class Book {
    String title = "";
    String author_name = "";
    String oclc = "";
    String author_key = "";
    String cover = "";

    public String getTitle() {
        return title;
    }

    public String getAuthor_name() {
        return author_name;
    }

    public String getOclc() {
        return oclc;
    }

    public String getAuthor_key() {
        return author_key;
    }
    
    public String getCoverUrl() {
        return cover;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }

    public void setAuthor_name(String author_name) {
        this.author_name = author_name;
    }

    public void setOclc(String oclc) {
        this.oclc = oclc;
    }

    public void setAuthor_key(String author_key) {
        this.author_key = author_key;
    }

    public void setCoverUrl(String cover) {
        this.cover = cover;
    }
    
    
}
