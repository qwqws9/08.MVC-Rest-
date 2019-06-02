<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




	<c:if test = "${! empty search.searchKeyword }">
	
	<c:if test="${ page.currentPage <= page.pageUnit }">
			◀ 이전
	</c:if>
	<c:if test="${ page.currentPage > page.pageUnit }">
			<a href="/product/listProduct?searchCondition=${search.searchCondition}&searchKeyword=${search.searchKeyword}&menu=${param.menu}>&page=${page.currentPage - 1}">◀ 이전</a>
	</c:if>
	
	<c:forEach var="i"  begin="${page.beginUnitPage}" end="${page.endUnitPage}" step="1">
		<a href="/product/listProduct?searchCondition=${search.searchCondition}&searchKeyword=${search.searchKeyword}&menu=${param.menu}&page=${i}">${i }</a>
	</c:forEach>
	
	<c:if test="${ page.endUnitPage >= page.maxPage }">
			이후 ▶
	</c:if>
	<c:if test="${ page.endUnitPage < page.maxPage }">
			<a href="/product/listProduct?searchCondition=${search.searchCondition}&searchKeyword=${search.searchKeyword}&menu=${param.menu}%>&page=${page.currentPage + 1}">▶ 이후</a>
	</c:if>

	
	 </c:if>
	 
	 
	 <c:if test = "${ empty search.searchKeyword}">
	  
<nav aria-label="Page navigation">
  <ul class="pagination">
    



	
	<c:if test="${ page.currentPage <= page.pageUnit }">
	 <li>
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
			
	</c:if>
	<c:if test="${ page.currentPage > page.pageUnit }">
	
	 <li>
      <a href="javascript:fncGetList('${ page.currentPage-1}')" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    
	</c:if>
	
	<c:forEach var="i"  begin="${page.beginUnitPage}" end="${page.endUnitPage}" step="1">
		<li><a href="javascript:fncGetList('${ i }');">${ i }</a></li>
	</c:forEach>
	
	<c:if test="${ page.endUnitPage >= page.maxPage }">
			<li>
      <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
	</c:if>
	<c:if test="${ page.endUnitPage < page.maxPage }">
	<li>
      <a href="javascript:fncGetList('${page.endUnitPage+1}')" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
			
	</c:if>
	  </ul>
</nav>
	</c:if>
	