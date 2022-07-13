/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Query;

/**
 *
 * @author Johan Kevin
 */
public class TransactionQuery {
    public String get = "SELECT * FROM transaction";
    public String create = "INSERT INTO transaction (name, product_type, transaction_type, jumlah, transaction_date) VALUES ( ?, ?, ?, ?, ?)";
    public String getByName = "SELECT * FROM transaction where id LIKE ?";
    public String getById = "SELECT * FROM transaction where id = ?";   
    public String update = "UPDATE transaction SET name = ?, product_type = ?, "
            + "transaction_type = ?, jumlah = ?, transaction_date WHERE id = ?";
    public String delete = "DELETE FROM transaction WHERE id = ?";
}

