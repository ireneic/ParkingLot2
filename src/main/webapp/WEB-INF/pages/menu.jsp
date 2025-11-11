<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 11-Nov-25
  Time: 17:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <header data-bs-theme="dark">
        <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
            <div class="container-fluid"><a class="navbar-brand" href="#">Parking lot</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
                        aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation"><span
                        class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <ul class="navbar-nav me-auto mb-2 mb-md-0">
                        <li class="nav-item"><a class="nav-link ${pageContext.request.requestURI.substring(pageContext.request.requestURI.lastIndexOf("/"))eq '/about.jsp' ? ' active' : ''}" aria-current="page" href="${pageContext.request.contextPath}/about.jsp">About</a></li>
                        <li class="nav-item">
                            <a class="nav-link ${activePage eq 'Cars' ? 'active' : ''}"
                               href="${pageContext.request.contextPath}/Cars">Cars</a>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="#">Link</a></li>
                        <li class="nav-item"><a class="nav-link disabled" aria-disabled="true">Disabled</a></li>
                    </ul>
                    <ul class = "navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/Login">Login</a>
                        </li>

                    </ul>
                </div>
            </div>
        </nav>
    </header>

</head>
<body>

</body>
<footer class="container-fluid bg-light text-center py-3 border-top fixed-bottom">
    <p class="mb-0">© 2025 Costeiu Irene Ioana</p>
</footer>
</html>
