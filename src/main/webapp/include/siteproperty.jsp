<%--page directive --%>
<%@page import="kr.co.viva.fragment.SitepropertyDAO"%>
<%@page import="kr.co.viva.fragment.SitepropertyVO"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
SitepropertyVO spVO = SitepropertyDAO.spVO;
application.setAttribute("SiteProperty", spVO);
application.setAttribute("CommonURL", spVO.getProtocol()+spVO.getServer_name()+spVO.getContext_root());
%>