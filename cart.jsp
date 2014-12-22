
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>Toko Kamera Online</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="assets/css/zabuto_calendar.css">
    <link rel="stylesheet" type="text/css" href="assets/js/gritter/css/jquery.gritter.css" />
    <link rel="stylesheet" type="text/css" href="assets/lineicons/style.css">    
    
    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">

    <script src="assets/js/chart-master/Chart.js"></script>
    
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

  <section id="container" >
      <!-- **********************************************************************************************************************************************************
      TOP BAR CONTENT & NOTIFICATIONS
      *********************************************************************************************************************************************************** -->
      <!--header start-->
      
            <header class="header black-bg">
                
              
              <div class="nav notify-row" id="top_menu">
                <!--  notification start -->
                <ul class="nav top-menu">
                    <!-- settings start -->
                    <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                        <%
                                                        if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
                                                        %>
                                                        <%} else {
                                                         %>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> <%=session.getAttribute("userid")%></a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="login.jsp"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                        <%}
                         %>
                    <!-- /.dropdown-user -->
                </li>
                </ul>
              </div>
                <div class="sidebar-toggle-box">
                  <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
                  
              </div>
            <!--logo start-->
            <a href="index.php" class="logo"><b>HR Toko Kamera Online</b></a>
            <!--logo end-->
            
                    <!-- settings end -->
                    <!-- inbox dropdown start-->
                    
        </header>
      <!--header end-->

      <aside>
          
          <div id="sidebar" class="nav-collapse " tabindex="5000" style="overflow: hidden; outline: none;">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
              
              	  <p class="centered"><a href="profile.html"><img src="assets/img/logo.png" class="img-circle" width="60"></a></p>
              	  <h5 class="centered"></h5>
              	  	
                  <li>
                            <a href="#"><i class="fa fa-tasks fa-fw"></i> Kategori<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level collapse">
                                <c:forEach items="${categories}" var="cat">
                                <li>
                                    <a href="controller?page=index&catid=${cat.id}">${cat.name}</a>
                                </li>
                                 </c:forEach>
                                <li>
                                    <a href="controller?page=index&catid=0">Semua Kategori</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                         <li>
                            <a href="cart.jsp"><i class="fa fa-tasks fa-fw"></i> Keranjang<span class="fa arrow"></span></a>
                            
                            <!-- /.nav-second-level -->
                        </li>


              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
              <section id="main-content">
          <section class="wrapper">
           
              <br>
                      <c:if test="${cart!=null}">
                      <c:set var="no" value="${1}"/>
                      <c:set var="total" value="${0}"/>
              <div class="col-md-9 mt">
                  
	                  	<div class="content-panel">
	                          <h4><i class="fa fa-angle-right"></i> Daftar Belanja</h4><hr><table class="table table-hover">
	                  	  	  
	                  	  	  
	                              <thead>
	                              <tr>
	                                  <th>No</th>
	                                  <th>Nama Barang</th>
	                                  <th>Harga</th>
	                                  
	                              </tr>
	                              </thead>
	                              <tbody>
	                              <c:forEach items="${products}" var="prod">
                                      <tr>
	                                  <td>${no}</td>
	                                  <td>${prod.name}</td>
	                                  <td><div><fmt:formatNumber value="${prod.price}" currencySymbol="Rp " type="currency"/></div></td>
	                                  
	                              </tr>
                                        <c:set var="no" value="${no+1}"/>
                                        <c:set var="total" value="${total + prod.price}"/>
                                        </c:forEach>
                                      <tr>
                          <td height="30" colspan="2"><div align="right" class="productname">
                            <table width="100%" border="0" cellspacing="0" cellpadding="2">
                              <tr>
                                <td width="100%" height="100%"><div align="right">Total</div></td>
                              </tr>
                            </table>
                          </div></td>
                          <td width="30%" height="30" bgcolor="#FFFF00"><div class="productname"><fmt:formatNumber value="${total}" currencySymbol="Rp " type="currency"/></div></td>
                        </tr>
	                          </table>
                  </c:if>
                  <c:if test="${cart==null}">
                    <div align="center" class="productname">Your Cart is Still Empty!!!</div>
                 </c:if>
	                  	  </div><!-- --/content-panel ---->
	                  </div>
              <form id="form1" name="form1" method="post" action="order.jsp">
                         
                              
                                  
                                      <div class="row mt">
                                          <div class="col-lg-9 col-md-6 col-sm-6"></div>
                                      <div class="col-lg-9 col-md-6 col-sm-6">
                                      <div class="showback">
                                          <div class="col-lg-4 col-md-6 col-sm-6">
                                              <p></p>
                                          </div>
					<a href="controller?page=index&catid=0" button="" type="button" class="btn btn-success">Kembali Berbelanja</a>
                                        <button type="submit" class="btn btn-theme04">Lanjut Transaksi</button>
                                      </div>
                                      </div>
                                      </div>
      				
                          
                         </form>
            
          </section>
        </section>

<!--footer end-->
  </section>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/jquery-1.8.3.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="assets/js/jquery.scrollTo.min.js"></script>
    <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="assets/js/jquery.sparkline.js"></script>


    <!--common script for all pages-->
    <script src="assets/js/common-scripts.js"></script>
    
    <script type="text/javascript" src="assets/js/gritter/js/jquery.gritter.js"></script>
    <script type="text/javascript" src="assets/js/gritter-conf.js"></script>

    <!--script for this page-->
    <script src="assets/js/sparkline-chart.js"></script>    
	<script src="assets/js/zabuto_calendar.js"></script>	
	

	
	<script type="application/javascript">
        $(document).ready(function () {
            $("#date-popover").popover({html: true, trigger: "manual"});
            $("#date-popover").hide();
            $("#date-popover").click(function (e) {
                $(this).hide();
            });
        
            $("#my-calendar").zabuto_calendar({
                action: function () {
                    return myDateFunction(this.id, false);
                },
                action_nav: function () {
                    return myNavFunction(this.id);
                },
                ajax: {
                    url: "show_data.php?action=1",
                    modal: true
                },
                legend: [
                    {type: "text", label: "Special event", badge: "00"},
                    {type: "block", label: "Regular event", }
                ]
            });
        });
        
        
        function myNavFunction(id) {
            $("#date-popover").hide();
            var nav = $("#" + id).data("navigation");
            var to = $("#" + id).data("to");
            console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
        }
    </script>
  

  </body>
</html>