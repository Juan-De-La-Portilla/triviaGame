<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>A&ntilde;adir Usuario</title>
    <%@include file="/WEB-INF/dashboard/commons/dashboard-head-imports.jsp" %>
</head>
<body class="spacer">
<!-- header -->
<jsp:include page="/WEB-INF/dashboard/commons/dashboard-header.jsp"/>
<!-- header -->

<!-- aside -->
<jsp:include page="/WEB-INF/dashboard/commons/dashboard-aside.jsp"/>
<!-- aside -->
<c:if test="${requestScope.msg != null || !requestScope.msg eq ''}">
    <script>alert(${msg})</script>
</c:if>
<main id="main" class="main">
    <section class="section">
        <div class="row justify-content-center">
            <div class="col-lg-6 col-md-8">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">A&ntilde;adir un Usuario</h5>
                        <form class="row g-3" method="post" action="${pageContext.request.contextPath}/usuarios?action=add">
                            <div class="col-12"><label for="input1" class="form-label">Nombre</label>
                                <input type="text"
                                       class="form-control"
                                       id="input1"
                                       name="nombre"
                                       required>
                            </div>
                            <div class="col-12"><label for="input4" class="form-label">Correo Electr&oacute;nico</label>
                                <input type="email"
                                       class="form-control"
                                       id="input4"
                                       name="correo"
                                       required>
                            </div>
                            <div class="col-12"><label for="input5" class="form-label">Contrase&ntilde;a</label>
                                <input type="password" class="form-control" id="input5" name="pass" required></div>
                            <div class="col-12"><label for="input3" class="form-label">Nivel</label>
                                <select name="esAdmin" class="form-select" id="input3" required>
                                    <option value="0" selected>Normal</option>
                                    <option value="1">Administrador</option>
                                </select>
                            </div>
                            <div class="text-center"><input type="submit" class="btn btn-primary" value="A&ntilde;adir">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
        class="bi bi-arrow-up-short"></i></a>
<%@include file="/WEB-INF/dashboard/commons/dashboard-scripts-imports.jsp" %>

</body>
</html>