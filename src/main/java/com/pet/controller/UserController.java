package com.pet.controller;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.pet.entity.User;
import com.pet.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;


import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 登录接口
     * @param user
     * @return
     */
    @PostMapping("/login")
    public ModelAndView login(HttpServletRequest request,User user){
        //调用service方法处理登录请求
        User userDB = userService.getUserByUsernameAndPassword(user);
        ModelAndView mv = new ModelAndView();
        //如果查到了,则判断身份
        if(userDB != null){
            //如果身份标识符是0,则跳转到普通用户登录成功界面
            if(userDB.getIdentity() == 0){
                //将用户信息存到session中
                request.getSession().setAttribute("userId",userDB.getId());
                mv.setViewName("redirect:/product/toProductListPage");
                return mv;
            }
            //如果身份标识符是1,则跳转到管理员用户登录成功界面
            if(userDB.getIdentity() == 1){
                request.getSession().setAttribute("userId",userDB.getId());
                mv.setViewName("redirect:toUserManagePage");
                return mv;
            }
        }

        //如果没查到,则跳转回登录界面,并提示登录失败
        mv.setViewName("redirect:/login.jsp");
        mv.addObject("msg","用户忙或密码错误!!!");
        return mv;
    }

    /**
     * 退出登录接口
     * @return
     */
    @GetMapping("/logout")
    public ModelAndView logout(HttpServletRequest request){
        //清空session里面存储的用户id,并跳转到登录界面
        request.getSession().removeAttribute("userId");
        return new ModelAndView("redirect:/login.jsp");
    }

    /**
     * 跳转到用户管理界面
     * @return
     */
    @GetMapping("/toUserManagePage")
    public ModelAndView toUserManagePage(){
        //获取所有的用户
        List<User> users = userService.getAllUser();

        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/admin_index");

        JSONArray array= JSONArray.parseArray(JSON.toJSONString(users));
        mv.addObject("data",array);
        mv.addObject("flag","userList");
        mv.addObject("navNum","1");
        return mv;
    }

    /**
     * 跳转到添加用户界面
     * @return
     */
    @GetMapping("/toAddPage")
    public ModelAndView toAddPage(){
        ModelAndView mv = new ModelAndView("admin/admin_user_add_update");
        mv.addObject("type","添加");
        mv.addObject("action","/tourism_products/user/saveUser");
        return mv;
    }

    /**
     * 添加用户方法
     * @param user
     * @return
     */
    @PostMapping("/saveUser")
    public ModelAndView saveUser(User user){
        System.out.println(user);
        user.setId(null);
        //判断身份标识是否为空
        if(user.getIdentity() == null){
            //如果为空,则是普通用户在自己注册
            user.setIdentity(0);
            userService.saveUser(user);
        }else{
            //如果不为空,则是管理员用户在创建用户
            userService.saveUser(user);
        }

        ModelAndView mv = new ModelAndView();
        mv.setViewName("redirect:/user/toUserManagePage");
        return mv;
    }

    /**
     * 跳转到修改用户信息界面
     * @param id
     * @return
     */
    @GetMapping("/toUpdatePage/{id}")
    public ModelAndView toUpdatePage(@PathVariable("id") Integer id){
        //通过id,查询用户信息
        User userDB = userService.getUserById(id);

        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/admin_user_add_update");
        mv.addObject("userDB",userDB);
        mv.addObject("type","修改");
        mv.addObject("action","/tourism_products/user/updateUser");
        return mv;
    }

    @PostMapping("/updateUser")
    public ModelAndView updateUser(User user){
        //调用修改方法,完成修改操作
        userService.updateUser(user);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("redirect:/user/toUserManagePage");
        return mv;
    }

    /**
     * 删除单个用户的方法
     * @param id
     * @return
     */
    @GetMapping("/remove/{id}")
    public ModelAndView remove(@PathVariable("id") Integer id){
        System.out.println(id);

        //调用删除方法
        userService.removeUserById(id);

        ModelAndView mv = new ModelAndView();
        mv.setViewName("redirect:/user/toUserManagePage");
        return mv;
    }


}
