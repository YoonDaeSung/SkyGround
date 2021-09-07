package com.ncs.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ncs.vo.rsvVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
   
   private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
   
   /**
    * Simply selects the home view to render by returning its name.
    */
   @RequestMapping(value = "/", method = RequestMethod.GET)
   public String home(Locale locale, Model model) {
      logger.info("Welcome home! The client locale is {}.", locale);
      
      Date date = new Date();
      DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
      
      String formattedDate = dateFormat.format(date);
      
      model.addAttribute("serverTime", formattedDate );
      
      return "home";
   }
   
   @RequestMapping(value = "/home")
   public ModelAndView home(ModelAndView mav) {
      mav.setViewName("home"); 
      return mav;
   }
   
   // 회원가입 화면
   @RequestMapping(value = "/joinF")
   public ModelAndView joinf(ModelAndView mav) {
      mav.setViewName("user/joinForm"); 
      return mav;
   }
   
   // 로그인 화면
   @RequestMapping(value = "/loginF")
   public ModelAndView loginf(ModelAndView mav) {
      mav.setViewName("user/loginForm"); 
      return mav;
   }
   
   // 객실 예약 (정보 확인 및 개인정보 입력)
   @RequestMapping(value = "/nextRsvF")
   public ModelAndView nextRsvF(ModelAndView mav, rsvVO rsVO) {
      
      mav.addObject("addInfo", rsVO);
      mav.setViewName("reservation/rsvAddForm");
      
      return mav;
   }
   
   // Q&A 질문하기 form
   @RequestMapping(value = "/qnaF")
   public ModelAndView qnaF(ModelAndView mv) {
      
      mv.setViewName("qna/qnaForm");
      return mv;
   }
   
   //주변 관광지 정보 form
   @RequestMapping(value = "/tourListF")
   public ModelAndView touristF(ModelAndView mv) {
      
      mv.setViewName("tourList/tourListForm");
      return mv;
   }
   
   // 예약자 조회 form화면
   @RequestMapping(value = "getRsvCheck")
   public ModelAndView getRsvCheck(ModelAndView mav) {
      
      mav.setViewName("reservation/rsvCheckForm");
      return mav;
   } // getRsvCheck
   
   //오시는 길
   @RequestMapping(value = "/wayF")
   public ModelAndView wayF(ModelAndView mav) {
   mav.setViewName("user/wayToCome"); 
   return mav;
   }
   
   //오시는 길
   @RequestMapping(value = "/pensionInfoF")
   public ModelAndView pensionInfoF(ModelAndView mav) {
   mav.setViewName("user/pensionInfo"); 
   return mav;
   }

   //오시는 길
   @RequestMapping(value = "/dangersF")
   public ModelAndView dangersF(ModelAndView mav) {
   mav.setViewName("calendar/dangers"); 
   return mav;
   }
   
}