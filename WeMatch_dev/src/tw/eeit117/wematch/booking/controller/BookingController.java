package tw.eeit117.wematch.booking.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.eeit117.wematch.booking.model.BookingService;
import tw.eeit117.wematch.booking.model.bookingBean;



@Controller
@RequestMapping("/bookingcontroller")
public class BookingController {

	@Autowired
	BookingService service;

	@GetMapping("/booking")
	public String bookingPage() {
		return "Bookingadmin";
	}
	
	@GetMapping("/booking2")
	public String bookingPage2() {
		return "BookingBrowse2";
	}
	
	@GetMapping("/booking3")
	public String bookingPage3() {
		return "BookingBrowse3";
	}
	

	@RequestMapping(value = "/bookingCheck", method = RequestMethod.POST)
	public String insert
	        (@RequestParam(name = "date") String date, 
	         @RequestParam(name = "time") String time,
			@RequestParam(name = "Dumbbells1",required = false) String Dumbbells1, @RequestParam(name = "Dumbbells2",required = false) String Dumbbells2,
			@RequestParam(name = "Dumbbells3",required = false) String Dumbbells3, @RequestParam(name = "Dumbbells4",required = false) String Dumbbells4,
			@RequestParam(name = "Dumbbells5",required = false) String Dumbbells5, @RequestParam(name = "Dumbbells6",required = false) String Dumbbells6,
			@RequestParam(name = "Dumbbells7",required = false) String Dumbbells7, @RequestParam(name = "Dumbbells8",required = false) String Dumbbells8,
			@RequestParam(name = "Dumbbells9",required = false) String Dumbbells9, @RequestParam(name = "bookingname",required = false) String bookingname,
			@RequestParam(name = "Dumbbells10",required = false) String Dumbbells10,
			@RequestParam(name = "Dumbbells11",required = false) String Dumbbells11,
			@RequestParam(name = "Dumbbells12",required = false) String Dumbbells12) {


		bookingBean bookingBean = new bookingBean();
		bookingBean.setBookingName(bookingname);

		System.out.println("bookingname"+bookingname);
		
		bookingBean.setBookingDate(date);
		bookingBean.setBookingTime(time);
		bookingBean.setEpt1(Dumbbells1);
		bookingBean.setEpt2(Dumbbells2);
		bookingBean.setEpt3(Dumbbells3);
		bookingBean.setEpt4(Dumbbells4);
		bookingBean.setEpt5(Dumbbells5);
		bookingBean.setEpt6(Dumbbells6);
		bookingBean.setEpt7(Dumbbells7);
		bookingBean.setEpt8(Dumbbells8);
		bookingBean.setEpt9(Dumbbells9);
		bookingBean.setEpt10(Dumbbells10);
		bookingBean.setEpt11(Dumbbells11);
		bookingBean.setEpt12(Dumbbells12);

		
		service.insert(bookingBean);

		return "Bookingadmin";
	}


	@ResponseBody
	@RequestMapping(value = "/bookingCheck2", method = RequestMethod.GET)
	public  HashMap<String, ArrayList<String>> select(
			@RequestParam("date") String date, 
			@RequestParam("time") String time,HttpServletRequest request,Model m) {
		
		System.out.println("date:"+date);
		System.out.println("time:"+time);
		
		List<bookingBean> serch = service.select(date, time);
		
		ArrayList<String> arrL1 = new ArrayList<String>(12);
		ArrayList<String> arrL2 = new ArrayList<String>(12);
		ArrayList<String> arrL3 = new ArrayList<String>(12);
		ArrayList<String> arrL4 = new ArrayList<String>(12);
		ArrayList<String> arrL5 = new ArrayList<String>(12);
		ArrayList<String> arrL6 = new ArrayList<String>(12);
		ArrayList<String> arrL7 = new ArrayList<String>(12);
		ArrayList<String> arrL8 = new ArrayList<String>(12);
		ArrayList<String> arrL9 = new ArrayList<String>(12);
		ArrayList<String> arrL10 = new ArrayList<String>(12);
		ArrayList<String> arrL11 = new ArrayList<String>(12);
		ArrayList<String> arrL12 = new ArrayList<String>(12);
		
		
		for(bookingBean i:serch) {                  
			arrL1.add(i.getEpt1());
		}
		for(bookingBean i:serch) {
			arrL2.add(i.getEpt2());
		}
		for(bookingBean i:serch) {
			arrL3.add(i.getEpt3());
		}
		for(bookingBean i:serch) {
			arrL4.add(i.getEpt4());
		}
		for(bookingBean i:serch) {
			arrL5.add(i.getEpt5());
		}
		for(bookingBean i:serch) {
			arrL6.add(i.getEpt6());
		}
		for(bookingBean i:serch) {
			arrL7.add(i.getEpt7());
		}
		for(bookingBean i:serch) {
			arrL8.add(i.getEpt8());
		}
		for(bookingBean i:serch) {
			arrL9.add(i.getEpt9());
		}
		for(bookingBean i:serch) {
			arrL10.add(i.getEpt10());
		}
		for(bookingBean i:serch) {
			arrL11.add(i.getEpt11());
		}
		for(bookingBean i:serch) {
			arrL12.add(i.getEpt12());
		}
		
		HashMap<String, ArrayList<String>> a = new HashMap<String,ArrayList<String>>();
		
		a.put("D1",arrL1);
		a.put("D2",arrL2);
		a.put("D3",arrL3);
		a.put("D4",arrL4);
		a.put("D5",arrL5);
		a.put("D6",arrL6);
		a.put("D7",arrL7);
		a.put("D8",arrL8);
		a.put("D9",arrL9);
		a.put("D10",arrL10);
		a.put("D11",arrL11);
		a.put("D12",arrL12);

		
		return a;

	}
	
	@RequestMapping(value = "/select", method = RequestMethod.GET)
	public String admindelete(Model m) {
		
		
		 List<bookingBean> m1 = service.selectAll();
		 		
			m.addAttribute("films", m1);
			
            return "BookingBrowse2";
		    }
	
	@RequestMapping(value = "/selectbooking", method = RequestMethod.GET)
	public String select(Model m,@RequestParam("bookingname") String name
			) {
		
		System.out.println("Name:"+name);
			
        List<bookingBean> m1 = service.selectbooking(name);
        
        System.out.println("m1"+m1);
        
			m.addAttribute("films", m1);
			
            return "Bookingadmin";
		    }
	
	
	
	
//	@ResponseBody
//	@RequestMapping(value = "/select", method = RequestMethod.GET)
//	public HashMap<String, ArrayList<String>> admindelete(Model m) {
//		
//		ArrayList<String> arrL1 = new ArrayList<String>(12);
//		ArrayList<String> arrL2 = new ArrayList<String>(12);
//		ArrayList<Integer> arrL3 = new ArrayList<Integer>(12);
//		
//
//		
//		 List<bookingBean> m1 = service.selectAll();
//		 
//			for(bookingBean i:m1) {                  
//				arrL1.add(i.getBookingDate());
//			}
//			
//			for(bookingBean i:m1) {                  
//				arrL2.add(i.getBookingTime());
//			}
//			
//		 
//			HashMap<String, ArrayList<String>> a = new HashMap<String,ArrayList<String>>();
//		
//			a.put("date", arrL1);
//			a.put("time", arrL2);
//			
//			
//			System.out.println("a:"+a);
//			
//		    return a;
//		    }	

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(Integer id) {

		service.delete(id);

		return "BookingBrowse2";
	}
	
	@RequestMapping(value = "/deletebooking", method = RequestMethod.GET)
	public String deletebooking(Integer id) {

		service.delete(id);

		return "Bookingadmin";
	}

}
