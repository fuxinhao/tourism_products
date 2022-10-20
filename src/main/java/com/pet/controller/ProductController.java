package com.pet.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.pet.entity.Product;
import com.pet.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductService productService;

    /**
     * 获取所有产品数据,并跳转到管理员首页
     *
     * @return
     */
    @GetMapping("/toProductManagePage")
    public ModelAndView toProductManagePage() {
        //调用service的方法,查询所有产品信息
        List<Product> products = productService.getAllProduct();

        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/admin_index");
        JSONArray array = JSONArray.parseArray(JSON.toJSONString(products));
        mv.addObject("data", array);
        mv.addObject("flag", "productList");
        mv.addObject("navNum","2");
        return mv;
    }

    /**
     * 去往添加产品界面
     */
    @GetMapping("/toAddPage")
    public ModelAndView toAddPage() {
        ModelAndView mv = new ModelAndView("admin/admin_product_add_update");
        mv.addObject("type", "添加");
        mv.addObject("action", "/tourism_products/product/saveProduct");
        return mv;
    }

    /**
     * 添加产品的方法
     *
     * @param product
     * @return
     */
    @PostMapping("/saveProduct")
    public ModelAndView saveProduct(Product product) {
        product.setId(null);

        //调用service的方法,完成添加产品操作
        productService.saveProduct(product);

        ModelAndView mv = new ModelAndView();
        mv.setViewName("redirect:/product/toProductManagePage");
        return mv;
    }

    /**
     * 跳转到修改产品信息界面
     *
     * @param id
     * @return
     */
    @GetMapping("/toUpdatePage/{id}")
    public ModelAndView toUpdatePage(@PathVariable("id") Integer id) {
        //通过id,查询产品信息
        Product productDB = productService.selectProductById(id);

        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/admin_product_add_update");
        mv.addObject("productDB", productDB);
        mv.addObject("type", "修改");
        mv.addObject("action", "/tourism_products/product/updateProduct");
        return mv;
    }

    @PostMapping("/updateProduct")
    public ModelAndView updateProduct(Product product) {
        //调用修改方法,完成修改操作
        productService.updateProduct(product);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("redirect:/product/toProductManagePage");
        return mv;
    }

    /**
     * 删除单个产品的方法
     *
     * @param id
     * @return
     */
    @GetMapping("/remove/{id}")
    public ModelAndView remove(@PathVariable("id") Integer id) {
        System.out.println(id);

        //调用删除方法
        productService.removeProductById(id);

        ModelAndView mv = new ModelAndView();
        mv.setViewName("redirect:/product/toProductManagePage");
        return mv;
    }

    /**
     * 查询所有产品信息,并跳转到用户首页面
     * @return
     */
    @GetMapping("/toProductListPage")
    public ModelAndView toProductListPage(){
        List<Product> products = productService.getAllProductOpen();

        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/user_index");
        JSONArray array = JSONArray.parseArray(JSON.toJSONString(products));
        mv.addObject("data",array);
        mv.addObject("flag","productList");
        mv.addObject("navNum","1");
        return mv;
    }

    /**
     * 通过id查询产品信息, 并跳转到产品下单界面
     * @return
     */
    @GetMapping("/toBuyPage/{id}")
    public ModelAndView toBuyPage(@PathVariable("id") Integer id){
        Product productDB = productService.selectProductById(id);

        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/user_buy_product");
        mv.addObject("productDB",productDB);
        mv.addObject("type","确认购买");
        mv.addObject("action","/tourism_products/order/generateOrder");
        return mv;
    }


}
