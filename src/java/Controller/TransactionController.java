/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Helper.StringHelper;
import Model.TransactionModel;
import Query.TransactionQuery;
import java.sql.ResultSet;
import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Johan Kevin
 */
public class TransactionController extends BaseController {
    
    TransactionQuery query = new TransactionQuery();
    
    public ResultSet get() {
        String sql = this.query.get;
        return this.get(sql);
    }
    public boolean create(TransactionModel model) throws ParseException {
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, model.getName());
        map.put(2, model.getProduct_type());
        map.put(3, model.getTransaction_type());
        map.put(4, model.getJumlah());
        map.put(5, model.getTransaction_date());
        
        String sql = this.query.create;
        
        return this.preparedStatement(map, sql);
    }
    public ResultSet getByName(String name) {
        String sql = this.query.getByName;
        
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, StringHelper.parseLikeQuery(name));
        
        return this.getWithParameter(map, sql);
    }
    public ResultSet getById(String id) {
        String sql = this.query.getById;
        
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, id);
        
        return this.getWithParameter(map, sql);
    }
    
    public boolean update(String id, TransactionModel model) throws ParseException {
        
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, model.getName());
        map.put(2, model.getProduct_type());
        map.put(3, model.getTransaction_type());
        map.put(4, model.getJumlah());
        map.put(5, model.getTransaction_date());
        
        String sql = this.query.update;
        
        return this.preparedStatement(map, sql);
    }
    
    public boolean delete(String id) throws ParseException {
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, id);
        
        String sql = this.query.delete;
        return this.preparedStatement(map, sql);
    }
}

//logika dari program 
//tampat otak atik program kita

