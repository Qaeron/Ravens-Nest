package com.svalero.project.domain;

import java.util.Date;

public class Poema {
    private int idPoema;
    private String titulo;
    private Date fePublicacion;
    private String descripcionPoema;

    private Autor autor;

    public Poema() {
    }

    public Poema(int idPoema, String titulo, Date fePublicacion, String descripcionPoema, Autor autor) {
        this.idPoema = idPoema;
        this.titulo = titulo;
        this.fePublicacion = fePublicacion;
        this.descripcionPoema = descripcionPoema;
        this.autor = autor;
    }

    public int getIdPoema() {
        return idPoema;
    }

    public void setIdPoema(int idPoema) {
        this.idPoema = idPoema;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public Date getFePublicacion() {
        return fePublicacion;
    }

    public void setFePublicacion(Date fePublicacion) {
        this.fePublicacion = fePublicacion;
    }

    public String getDescripcionPoema() {
        return descripcionPoema;
    }

    public void setDescripcionPoema(String descripcionPoema) {
        this.descripcionPoema = descripcionPoema;
    }

    public Autor getAutor() {
        return autor;
    }

    public void setAutor(Autor autor) {
        this.autor = autor;
    }
}
