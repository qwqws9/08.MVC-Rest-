package com.model2.mvc.web.product;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.model2.mvc.common.FileNameUUID;
import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.board.BoardService;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.ReviewService;
import com.model2.mvc.service.purchase.PurchaseService;

@RestController
@RequestMapping("/product/*")
public class ProductRestController {
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("reviewServiceImpl")
	private ReviewService reviewService;
	
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	@Autowired
	@Qualifier("questServiceImpl")
	private BoardService questService;
	
	
	
	public ProductRestController() {
		System.out.println("ProductRestController default 생성자 호출!");
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml 참조 할것
		//==> 아래의 두개를 주석을 풀어 의미를 확인 할것
		@Value("#{commonProperties['pageUnit']}")
		//@Value("#{commonProperties['pageUnit'] ?: 3}")
		int pageUnit;
		
		@Value("#{commonProperties['pageSize']}")
		//@Value("#{commonProperties['pageSize'] ?: 2}")
		int pageSize;
		
		
	@RequestMapping("json/addProduct")
	public Product addProduct( @RequestBody Product product) throws Exception {
		
		//String saveName = FileNameUUID.saveFile(imageName);
		//pVo.setFileName(saveName);
		System.out.println("add들어옴");
		
		productService.addProduct(product) ;
		
		System.out.println("!!!!!"+product.getProdNo());
		
		product = productService.getProduct(product.getProdNo());
		
		return product;
	}
	
	@RequestMapping("json/listProduct/{menu}")
	public Map<String, Object> listProduct( 
							  @PathVariable String menu,
								@RequestBody Search search) throws Exception {
		
		search.setPageSize(pageSize);
		
		
		System.out.println("---------------------------------------");
		System.out.println(search.getSearchCondition() + "컨디션");
		System.out.println(search.getSearchKeyword() + "키워드");
		System.out.println("---------------------------------------");

		Map<String, Object> map = null;
		
		if(menu.equals("admin")) {
			map = purchaseService.getSaleList(search);
		}else {
			map = productService.getProductList(search);
		}
		
		
		System.out.println(map.get("totalCount") + " dao 가기전 totalCount");

		Page page	= 
				new Page( 1, ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		map.put("menu", menu);
		map.put("search", search);
		map.put("page", page);
		

		return map;

	}
	
	@RequestMapping("json/getProduct/{prodNo}")
	public Product getProduct( @PathVariable int prodNo
							
			) throws Exception {
		
		System.out.println("!!" + prodNo);
		
		Product pVo = new Product();
		pVo = productService.getProduct(prodNo);

		

		return pVo;
	}
	
//	@RequestMapping("updateProduct")
//	public String updateProduct( @ModelAttribute("product") Product product,
//									HttpServletRequest request, MultipartFile imageName) throws Exception {
//		
//	
//		String saveName = FileNameUUID.saveFile(imageName);
//		product.setFileName(saveName);
//		
//		product.setProdNo(Integer.parseInt(request.getParameter("hidden")));
//		System.out.println("상품번호야 출력되어라 ~~~ " +request.getParameter("hidden"));
//		
//		
//		productService.updateProduct(product);
//		//System.out.println(pVo.getRegDate()+"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
//		
//		//request.removeAttribute("pVo");
//		Product pVo = new Product();
//		pVo = productService.getProduct(Integer.parseInt(request.getParameter("hidden")));
//		System.out.println("1==>"+pVo);
//		
//		
//		
//		request.setAttribute("pVo", pVo);
//		request.setAttribute("menu", request.getParameter("menu"));
//		
//		return "forward:/product/getProduct?prodNo="+product.getProdNo();
//	}
//	
//	@RequestMapping("updateProductView")
//	public String updateProductView(HttpServletRequest request) throws Exception {
//		
//
//		int prodNo = Integer.parseInt(request.getParameter("prodNo"));
//		System.out.println("판매번호 : " + prodNo);
//		
//		//request.setAttribute("prodNo", prodNo);
//		
//		Product pVo = productService.getProduct(prodNo);
//		
//		request.setAttribute("pVo", pVo);
//		
//		return "forward:/product/updateProductView.jsp";
//	}
	
	
}
