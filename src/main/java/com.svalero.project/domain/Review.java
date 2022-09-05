package com.svalero.project.domain;

public class Review {
    private int idReview;
    private int rating;
    private String contenidoReview;

    private Usuario usuario;

    private Poema poema;

    public Review() {
    }

    public Review(int idReview, int rating, String contenidoReview, Usuario usuario, Poema poema) {
        this.idReview = idReview;
        this.rating = rating;
        this.contenidoReview = contenidoReview;
        this.usuario = usuario;
        this.poema = poema;
    }

    public int getIdReview() {
        return idReview;
    }

    public void setIdReview(int idReview) {
        this.idReview = idReview;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getContenidoReview() {
        return contenidoReview;
    }

    public void setContenidoReview(String contenidoReview) {
        this.contenidoReview = contenidoReview;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public Poema getPoema() {
        return poema;
    }

    public void setPoema(Poema poema) {
        this.poema = poema;
    }
}
