package com.pet.service;

import com.pet.entity.Product;

import java.util.List;

public interface ProductService {

    public List<Product> getAllProduct();

    public void saveProduct(Product product);

    public void removeProductById(Integer id);

    public Product selectProductById(Integer id);

    public void updateProduct(Product product);

    public List<Product> getAllProductOpen();
}
