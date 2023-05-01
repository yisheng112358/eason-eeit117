package tw.eeit117.wematch.cart.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutOneTime;
import tw.eeit117.wematch.cart.model.Receiver;
import tw.eeit117.wematch.cart.model.ReceiverService;
import tw.eeit117.wematch.product.model.ProductBean;
import tw.eeit117.wematch.product.model.ProductBeanService;

@Controller
@RequestMapping("/shoppingCart")
@SessionAttributes({ "transportInformation", "totalAmount", "shoppingCarts" })
public class CartController {
	@Autowired
	ReceiverService receiverService;

	@Autowired
	ProductBeanService productBeanService;

	public static AllInOne all;

	private static void initial() {
		all = new AllInOne(null);
	}

	@GetMapping("/cart")
	public String cart(Model m) {
		Receiver receiver = new Receiver();
		m.addAttribute("transportInformation", receiver);
		return "ShoppingCartPage";
	}

	@GetMapping("/cart/showOrderThumbnail/{productId}")
	public void showOrderThumbnail(@PathVariable String productId, HttpServletResponse response) throws IOException {
		response.setContentType("image/jpeg");
		ProductBean productBean = productBeanService.findById(Integer.parseInt(productId));
		InputStream inputStream = new ByteArrayInputStream(productBean.getThumbnail());
		IOUtils.copy(inputStream, response.getOutputStream());
	}

	@RequestMapping(path = "/addTransportInformation", method = RequestMethod.POST)
	public String addTransportInformation(@ModelAttribute("transportInformation") Receiver transportInformation,
			BindingResult result, Model m) {
		if (result.hasErrors()) {
			return "ReceiverError";
		}
		m.addAttribute("totalAmount", transportInformation.getTotalAmount());
		m.addAttribute("receiverName", transportInformation.getReceiverName());
		m.addAttribute("receiverPhone", transportInformation.getReceiverPhone());
		m.addAttribute("receiverAddress", transportInformation.getReceiverAddress());
		m.addAttribute("receiverEmail", transportInformation.getReceiverEmail());
		m.addAttribute("receiverNotes", transportInformation.getReceiverNote());

		receiverService.insert(transportInformation);

		return "ShoppingPaymentPage";
	}

	@RequestMapping(value = "/greenPay")
	public String greenPay(Model m, SessionStatus status) {
		try {
			Double shoppingCartTotal = (Double) m.getAttribute("totalAmount");
			Integer shoppingCartTotalInt = shoppingCartTotal.intValue();
			if (shoppingCartTotalInt <= 0) {
				shoppingCartTotalInt = 1;
			}

			status.setComplete();

			Date date = new Date();
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMddHHmmss");
			String dateString = sdf1.format(date);
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			String dateStringToMerchantTradeDate = sdf2.format(date);

			initial();
			AioCheckOutOneTime aioCheckOutOneTime = new AioCheckOutOneTime();
			aioCheckOutOneTime.setMerchantTradeNo(dateString);
			aioCheckOutOneTime.setMerchantTradeDate(dateStringToMerchantTradeDate);
			aioCheckOutOneTime.setTotalAmount(shoppingCartTotalInt.toString());
			aioCheckOutOneTime.setTradeDesc("WeMatch測試商品");
			aioCheckOutOneTime.setItemName("WeMatch測試商品");
			aioCheckOutOneTime.setReturnURL("http://211.23.128.214:5000");
			aioCheckOutOneTime.setClientBackURL("http://localhost:8080/WeMatch_dev");
			aioCheckOutOneTime.setNeedExtraPaidInfo("N");
			m.addAttribute("CreditCardInput", all.aioCheckOut(aioCheckOutOneTime, null));

			return "GreenTest";

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "GreenTest";
	}

	@GetMapping(value = "/updateStock", params = { "productId", "stock" })
	public void updateStock(@RequestParam Integer productId, @RequestParam Integer stock) {
		ProductBean productBean = productBeanService.findById(productId);
		if (stock <= 0) {
			stock = 0;
		}
		Integer newStock = productBean.getStock() - stock;
		if (newStock <= 0) {
			productBean.setPrice(999999.);
		}
		productBean.setStock(newStock);
		productBeanService.update(productBean);
	}

	@GetMapping(value = "/deleteCartItem/{productId}")
	public String deleteCartItem(@PathVariable String productId, Model model) {
		@SuppressWarnings("unchecked")
		Set<ProductBean> carts = (Set<ProductBean>) model.getAttribute("shoppingCarts");
		Set<ProductBean> newCarts = new HashSet<ProductBean>();
		for (ProductBean productBean : carts) {
			if (productBean.getProductId() != Integer.parseInt(productId)) {
				newCarts.add(productBean);
			}
		}
		model.addAttribute("shoppingCarts", newCarts);
		return "redirect:/shoppingCart/cart";
	}

}
