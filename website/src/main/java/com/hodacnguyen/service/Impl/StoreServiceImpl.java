/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.service.Impl;

import com.hodacnguyen.pojo.Store;
import com.hodacnguyen.repository.StoreRepo;
import com.hodacnguyen.service.StoreService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author CaNoc
 */
@Service
public class StoreServiceImpl implements StoreService{
    @Autowired
    private StoreRepo storeRepo;
    @Override
    public void add(Store t) {
        this.storeRepo.add(t);
    }

    @Override
    public List<Store> list() {
        return this.storeRepo.list();
    }

    @Override
    public void update(Store t) {
        this.storeRepo.update(t);
    }

    @Override
    public Store getById(int id) {
        return this.storeRepo.getById(id);
    }

    @Override
    public void delete(int id) {
        this.storeRepo.delete(id);
    }

    @Override
    public List<Store> search(String key) {
        return this.storeRepo.search(key);
    }
    
}
