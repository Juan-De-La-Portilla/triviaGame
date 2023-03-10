<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar Sesi&oacute;n</title>
    <%@include file="/WEB-INF/user/commons/head-imports.jsp" %>
</head>
<body>

<div class="container-fluid h-100 spacer login-background">
    <div class="row d-flex justify-content-center align-items-center h-100">

        <!-- Left -->
        <div class="col-xl-5 d-none d-xl-block"></div>
        <!-- Left -->

        <!-- Right -->
        <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1 p-4 text-light custom-border">

            <!-- Title -->
            <div class="pb-3 d-flex flex-column">
                <span class="fs-4 m-0">Jugador ${numeroJugador},</span>
                <h2 class="fs-1 m-0">&iexcl;Inicia Sesi&oacute;n!</h2>
            </div>
            <!-- Title -->

            <!-- Form -->
            <form method="post" action="${pageContext.request.contextPath}/login?player=${numeroJugador}"
                  class="needs-validation">

                <!-- Email input -->
                <div class="form-outline mb-4 was-validated">
                    <label class="form-label pt-2" for="form3Example3">Correo Electr&oacute;nico</label>
                    <input type="email" id="form3Example3" class="form-control"
                           placeholder="ejemplo@correo.com" name="correo" required/>
                    <div class="invalid-feedback">Por favor, ingresa tu correo electr&oacute;nico</div>
                </div>
                <!-- Email input -->

                <!-- Password input -->
                <div class="form-outline mb-2 was-validated">
                    <label class="form-label pt-2" for="form3Example4">Contrase&ntilde;a</label>
                    <input type="password" id="form3Example4" class="form-control"
                           placeholder="*****" name="pass" required/>
                    <div class="invalid-feedback">Por favor, ingresa tu contrase&ntilde;a</div>
                </div>
                <!-- Password input -->

                <div class="text-center text-lg-start pt-3">

                    <!-- Submit button -->
                    <input type="submit" class="btn btn-custom btn-lg"
                           style="padding-left: 2.5rem; padding-right: 2.5rem;" value="Ingresar"/>
                    <div class="small text-danger"><p>${error}</p></div>
                    <div class="small text-success"><p>${success}</p></div>
                    <!-- Submit button -->

                    <!-- Bottom text -->
                    <p class="small pt-2 mb-0">&iquest;Todav&iacute;a no tienes una cuenta?
                        <a href="${pageContext.request.contextPath}/signup.jsp"
                           class="link-info"> Reg&iacute;strate </a>
                    </p>
                    <!-- Bottom text -->

                </div>

            </form>
        </div>
        <!-- Right -->

    </div>
</div>

<%@include file="/WEB-INF/user/commons/footer-imports.jsp" %>

</body>
</html>
