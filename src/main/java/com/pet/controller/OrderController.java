package com.pet.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.pet.entity.Orders;
import com.pet.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @GetMapping("/toOrderManagePage")
    public ModelAndView toOrderManagePage(){
        //查询所有的订单信息
        List<Orders> orders = orderService.getAllOrder();

        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/admin_index");
        JSONArray array = JSONArray.parseArray(JSON.toJSONString(orders));
        mv.addObject("data", array);
        mv.addObject("flag", "orderList");
        mv.addObject("navNum","3");
        return mv;
    }

    /**
     * 跳转到修改订单信息界面
     *
     * @param id
     * @return
     */
    @GetMapping("/toUpdatePage/{id}")
    public ModelAndView toUpdatePage(@PathVariable("id") Integer id) {
        //通过id,查询用户信息
        Orders orderDB = orderService.getOrderById(id);

        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/admin_order_add_update");
        mv.addObject("orderDB", orderDB);
        mv.addObject("type", "修改");
        mv.addObject("action", "/tourism_products/order/updateProduct");
        return mv;
    }

    /**
     * 删除单个订单的方法
     *
     * @param id
     * @return
     */
    @GetMapping("/remove/{id}")
    public ModelAndView remove(@PathVariable("id") Integer id) {
        //调用删除方法
        orderService.removeOrderById(id);

        ModelAndView mv = new ModelAndView();
        mv.setViewName("redirect:/order/toOrderManagePage");
        return mv;
    }

    /**
     * 用户下单的方法,下单成功之后跳转到我的订单界面
     * @param request
     * @param orders
     * @return
     */
    @PostMapping("/generateOrder")
    public ModelAndView generateOrder(HttpServletRequest request,Orders orders){
        //填充订单的其他属性
        orders.setOrdernum(UUID.randomUUID().toString());//使用UUID作为订单编号
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String transformDate = simpleDateFormat.format(new Date());
        orders.setOrdertime(transformDate);//设置下单时间
        orders.setProductid(orders.getId());//设置产品id
        orders.setId(null);//清空id
        Integer userId = (Integer) request.getSession().getAttribute("userId");
        orders.setMemberid(userId);//设置用户id

        //调用service层的方法,完成创建订单操作
        orderService.saveOrder(orders);

        //跳转到订单管理界面
        ModelAndView mv = new ModelAndView();
        mv.setViewName("redirect:toMyOrderPage");
        return mv;
    }

    @GetMapping("/toMyOrderPage")
    public ModelAndView toMyOrderPage(HttpServletRequest request){
        //查询当前用户所有的订单
        //获取当前用户的id
        Integer userId = (Integer) request.getSession().getAttribute("userId");

        //通过id查询当前用户的所有订单
        List<Orders> orders = orderService.getOrderByUserId(userId);

        //跳转到我的订单界面
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/user_index");
        JSONArray array = JSONArray.parseArray(JSON.toJSONString(orders));
        mv.addObject("data",array);
        mv.addObject("flag","orderList");
        mv.addObject("navNum",2);
        return mv;
    }
}
