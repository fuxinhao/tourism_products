package com.pet.service.impl;

import com.pet.entity.Product;
import com.pet.entity.ProductExample;
import com.pet.mapper.ProductMapper;
import com.pet.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductMapper productMapper;

    @Override
    public List<Product> getAllProduct() {
        return productMapper.selectByExample(null);
    }

    @Override
    public void saveProduct(Product product) {
        productMapper.insert(product);
    }

    @Override
    public void removeProductById(Integer id) {
        productMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Product selectProductById(Integer id) {
        return productMapper.selectByPrimaryKey(id);
    }

    @Override
    public void updateProduct(Product product) {
        productMapper.updateByPrimaryKey(product);
    }

    @Override
    public List<Product> getAllProductOpen() {
        //创建查询条件
        ProductExample example = new ProductExample();
        //进行条件拼接
        ProductExample.Criteria criteria = example.createCriteria();
        //一个criteria中拼接的条件都是and
        criteria.andProductstatusEqualTo(1);
        return productMapper.selectByExample(example);
    }
}
