/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Johan Kevin
 */
public class TransactionModel {
    private String name;
    private String product_type;
    private String transaction_type;
    private String jumlah;
    private String transaction_date;

    public void setTransaction_date	(String transaction_date) {
        String[] splitted = transaction_date	.split("/");
        transaction_date	 = splitted[2] + "-" + splitted[0] + "-" + splitted[1];
        
        this.transaction_date	 = transaction_date	;
    }

    public String getTransaction_date	() {
        return transaction_date	;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setProduct_type(String product_type) {
        this.product_type = product_type;
    }

    public String getProduct_type() {
        return product_type;
    }

    public void setJumlah(String jumlah) {
        this.jumlah = jumlah;
    }

    public String getJumlah() {
        return jumlah;
    }

    public void setTransaction_type(String transaction_type) {
        this.transaction_type = transaction_type;
    }

    public String getTransaction_type() {
        return transaction_type;
}
}
