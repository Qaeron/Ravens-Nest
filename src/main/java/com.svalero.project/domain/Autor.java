package com.svalero.project.domain;

import java.util.Date;

public class Autor {

    private int idAutor;
    private String nombreAutor;
    private String apellidoAutor;
    private Date feNacimiento;
    private String descripcionAutor;

    public Autor() {
    }

    public Autor(int idAutor, String nombreAutor, String apellidoAutor, Date feNacimiento, String descripcionAutor) {
        this.idAutor = idAutor;
        this.nombreAutor = nombreAutor;
        this.apellidoAutor = apellidoAutor;
        this.feNacimiento = feNacimiento;
        this.descripcionAutor = descripcionAutor;
    }

    public int getIdAutor() {
        return idAutor;
    }

    public void setIdAutor(int idAutor) {
        this.idAutor = idAutor;
    }

    public String getNombreAutor() {
        return nombreAutor;
    }

    public void setNombreAutor(String nombreAutor) {
        this.nombreAutor = nombreAutor;
    }

    public String getApellidoAutor() {
        return apellidoAutor;
    }

    public void setApellidoAutor(String apellidoAutor) {
        this.apellidoAutor = apellidoAutor;
    }

    public Date getFeNacimiento() {
        return feNacimiento;
    }

    public void setFeNacimiento(Date feNacimiento) {
        this.feNacimiento = feNacimiento;
    }

    public String getDescripcionAutor() {
        return descripcionAutor;
    }

    public void setDescripcionAutor(String descripcionAutor) {
        this.descripcionAutor = descripcionAutor;
    }
}