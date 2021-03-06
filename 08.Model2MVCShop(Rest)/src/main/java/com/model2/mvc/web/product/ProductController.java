package com.model2.mvc.web.product;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.model2.mvc.common.FileNameUUID;
import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.board.BoardService;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.ReviewService;
import com.model2.mvc.service.purchase.PurchaseService;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
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
	
	
	
	public ProductController() {
		System.out.println("ProductController default 생성자 호출!");
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml 참조 할것
		//==> 아래의 두개를 주석을 풀어 의미를 확인 할것
		@Value("#{commonProperties['pageUnit']}")
		//@Value("#{commonProperties['pageUnit'] ?: 3}")
		int pageUnit;
		
		@Value("#{commonProperties['pageSize']}")
		//@Value("#{commonProperties['pageSize'] ?: 2}")
		int pageSize;
		
		
		
		
		
		
	@RequestMapping("/addProduct")
	public String addProduct( @ModelAttribute("pVo") Product pVo, MultipartFile imageName) throws Exception {
		
		String saveName = FileNameUUID.saveFile(imageName);
		pVo.setFileName(saveName);
		
		productService.addProduct(pVo) ;
		
//		return "forward:/product/confirmProduct.jsp";
		return "forward:/product/getProduct?prodNo="+pVo.getProdNo()+"&menu=manage";
	}
	
	@RequestMapping("/listProduct")
	public String listProduct( @RequestParam(value="currentPage",defaultValue="1") int currentPage,
								
							   @RequestParam("menu") String menu,
								@ModelAttribute("search") Search search,
								Model model) throws Exception {
		
		search.setPageSize(pageSize);
		
		
		System.out.println(currentPage + " 현재페이지는 몇인가아아아아아아아");

		search.setCurrentPage(currentPage);
		
		System.out.println(currentPage + " 현재페이지 첫번째는 1 나오고 재 요청시 누른 페이지가 나와야함 ");
		

		
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
		
		
		System.out.println(currentPage + " dao 가기전에 현재페이지 호출 1이 나와야함");
		System.out.println(map.get("totalCount") + " dao 가기전 totalCount");

		Page page	= 
				new Page( currentPage, ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("search", search);
		model.addAttribute("page", page);

		model.addAttribute("menu", menu);

		return "forward:/product/listProduct.jsp";

	}
	
	@RequestMapping("getProduct")
	public String getProduct( @RequestParam(value="currentPage",defaultValue="1") int currentPage,
							@RequestParam(value="currentPage1",defaultValue="1") int currentPage1,
							@RequestParam("prodNo") String prodNo,
								HttpServletResponse response,
								HttpServletRequest request,
								@RequestParam("menu") String menu,
								Model model
			) throws Exception {
		
		
		String his = "";

		Cookie[] cookie = request.getCookies();

		if (cookie != null) {
			System.out.println("들어오싸나");
			for (int i = 0; i < cookie.length; i++) {
				if (cookie[i].getName().equals("history")) {
					his = cookie[i].getValue() + "," + prodNo;
					Cookie c = new Cookie("history", his);
					c.setMaxAge(365 * 24 * 60 * 60);
					response.addCookie(c);
					break;
				}else {
					Cookie c = new Cookie("history", prodNo);
					c.setMaxAge(365 * 24 * 60 * 60);
					response.addCookie(c);
				}
			}
		}

		System.out.println("-------------------------------");
		System.out.println(menu + " 11111111111111111111");
		System.out.println("-------------------------------");

		Product pVo = new Product();
		pVo = productService.getProduct(Integer.parseInt(prodNo));

		request.setAttribute("pVo", pVo);
		request.setAttribute("prodNo", prodNo);

		// 상품이 판매완료가아닌상태 + 관리자일때만 수정페이지로 보냄
		if (menu.equals("admin")) {
			System.out.println("관리자인데 어디로보내냔ㄴ");
			return "forward:/product/updateProductView";
		}
		
		Search search = new Search();
		Search search1 = new Search();
		
		// 상품상세 조회시 상품리뷰가 있다면 리스트로 보여주기
		search.setPageSize(pageSize);
		search.setCurrentPage(currentPage);
		
		
		Map<String,Object> map = reviewService.getReviewList(search,prodNo);
		Page page	= 
				new Page( currentPage, ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("search", search);
		model.addAttribute("page", page);
		
		
		
		// 상품상세 조회시 상품문의가 있다면 리스트로 보여주기
		search1.setPageSize(pageSize);
		search1.setCurrentPage(currentPage1);
		
		
		Map<String,Object> map1 = questService.getBoardList(prodNo, search1);
		Page page1	= 
				new Page( currentPage1, ((Integer)map1.get("questtotalCount")).intValue(), pageUnit, pageSize);
		
		model.addAttribute("questlist", map1.get("questlist"));
		model.addAttribute("search1", search1);
		model.addAttribute("page1", page1);
		

		return "forward:/product/getProduct.jsp";
	}
	
	@RequestMapping("updateProduct")
	public String updateProduct( @ModelAttribute("product") Product product,
									HttpServletRequest request, MultipartFile imageName) throws Exception {
		
	
		String saveName = FileNameUUID.saveFile(imageName);
		product.setFileName(saveName);
		
		product.setProdNo(Integer.parseInt(request.getParameter("hidden")));
		System.out.println("상품번호야 출력되어라 ~~~ " +request.getParameter("hidden"));
		
		
		productService.updateProduct(product);
		//System.out.println(pVo.getRegDate()+"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		
		//request.removeAttribute("pVo");
		Product pVo = new Product();
		pVo = productService.getProduct(Integer.parseInt(request.getParameter("hidden")));
		System.out.println("1==>"+pVo);
		
		
		
		request.setAttribute("pVo", pVo);
		request.setAttribute("menu", request.getParameter("menu"));
		
		return "forward:/product/getProduct?prodNo="+product.getProdNo();
	}
	
	@RequestMapping("updateProductView")
	public String updateProductView(HttpServletRequest request) throws Exception {
		

		int prodNo = Integer.parseInt(request.getParameter("prodNo"));
		System.out.println("판매번호 : " + prodNo);
		
		//request.setAttribute("prodNo", prodNo);
		
		Product pVo = productService.getProduct(prodNo);
		
		request.setAttribute("pVo", pVo);
		
		return "forward:/product/updateProductView.jsp";
	}
	
	
}
