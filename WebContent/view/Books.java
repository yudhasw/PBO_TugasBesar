/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.tugaskelompok;

/**
 *
 * @author OMEN
 */
public class Books {
    private String id_buku;
    private String judul;
    private String penulis;
    private String tahun;
    private String jenis;
    private String ISBN;
    private float rating;
    private String deskripsi;
    private float harga;
    
    public Buku(String id_buku, String judul, String penulis, String tahun, String jenis, String ISBN, float rating, String deskripsi, float harga){
        this.id_buku = id_buku;
        this.judul = judul;
        this.penulis = penulis;
        this.tahun = tahun;
        this.ISBN = ISBN;
        this.rating = rating;
        this.deskripsi = deskripsi;
        this.harga = harga;
    }
    
    
    public void PencarianBuku (String buku){
        
    }
    public void BukuTerpopuler (){
        
    }
}
