<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--  <c:set var="main" value="MAIN"></c:set> --%>
<c:set var="pageTitle" value="MAIN"></c:set>
<%@ include file="../common/head.jspf"%>

 <section>
  <c:forEach var="blog" items="${blog }">
      <div onclick="redirectToPost('${blog.post_url}')">
      	<span>날짜: ${blog.post_date }</span><br/>
      	<span>제목: ${blog.post_title }</span><br/>
      	<span>내용: ${blog.post_content }</span>
      </div>
  </c:forEach>    
 </section>

<script>
      function redirectToPost(postUrl) {
          window.open(postUrl, '_blank', windowFeatures);
      }
</script>

<!-- 페이지 하단 -->
<%@ include file="../common/foot.jspf"%>