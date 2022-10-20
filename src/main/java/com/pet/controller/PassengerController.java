package com.pet.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.pet.entity.Passenger;
import com.pet.service.PassengerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/passenger")
public class PassengerController {

    @Autowired
    private PassengerService passengerService;

    @GetMapping("/toPassengerManagePage")
    public ModelAndView toPassengerManagePage(){
        //查询所有的旅客信息
        List<Passenger> passengers = passengerService.getAllPassenger();

        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/admin_index");
        JSONArray array = JSONArray.parseArray(JSON.toJSONString(passengers));
        mv.addObject("data", array);
        mv.addObject("flag", "passengerList");
        mv.addObject("navNum","4");
        return mv;
    }

    /**
     * 去往添加旅客界面
     */
    @GetMapping("/toAddPage")
    public ModelAndView toAddPage() {
        ModelAndView mv = new ModelAndView("admin/admin_passenger_add_update");
        mv.addObject("type", "添加");
        mv.addObject("action", "/tourism_products/passenger/savePassenger");
        return mv;
    }

    /**
     * 添加产品的方法
     *
     * @param passenger
     * @return
     */
    @PostMapping("/savePassenger")
    public ModelAndView savePassenger(Passenger passenger) {
        passenger.setId(null);

        //调用service的方法,完成添加产品操作
        passengerService.savePassenger(passenger);

        ModelAndView mv = new ModelAndView();
        mv.setViewName("redirect:/passenger/toPassengerManagePage");
        return mv;
    }

    /**
     * 跳转到修改旅客信息界面
     *
     * @param id
     * @return
     */
    @GetMapping("/toUpdatePage/{id}")
    public ModelAndView toUpdatePage(@PathVariable("id") Integer id) {
        //通过id,查询旅客信息
        Passenger passengerDB = passengerService.selectPassengerById(id);

        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/admin_passenger_add_update");
        mv.addObject("passengerDB", passengerDB);
        mv.addObject("type", "修改");
        mv.addObject("action", "/tourism_products/passenger/updatePassenger");
        return mv;
    }

    @PostMapping("/updatePassenger")
    public ModelAndView updatePassenger(Passenger passenger) {
        //调用修改方法,完成修改操作
        passengerService.updatePassenger(passenger);

        ModelAndView mv = new ModelAndView();
        mv.setViewName("redirect:/passenger/toPassengerManagePage");
        return mv;
    }

    /**
     * 删除单个旅客的方法
     *
     * @param id
     * @return
     */
    @GetMapping("/remove/{id}")
    public ModelAndView remove(@PathVariable("id") Integer id) {
        //调用删除方法
        passengerService.removePassengerById(id);

        ModelAndView mv = new ModelAndView();
        mv.setViewName("redirect:/passenger/toPassengerManagePage");
        return mv;
    }

}
