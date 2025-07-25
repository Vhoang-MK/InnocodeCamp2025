
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <title>Simple Login Layout</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Login.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/FishTank.css" />
        <link href="https://fonts.googleapis.com/css2?family=ADLaM+Display&display=swap" rel="stylesheet" />
    </head>
    <body>
        <div class="container-fluid">
            <div class="row full-height">
                <div class="col-md-5 left">
                    <h3 class="left_first_prompt">Start New Journey!</h3>
                    <div class="decorative-element"></div>
                    <p class="left_second_prompt">You don't have an account yet?</p>
                    <form action="${pageContext.request.contextPath}/view/register.jsp" method="get">
                        <input type="submit" value="Sign Up" id="signUp"/>
                    </form>
                </div>
                <div class="col-md-7 right fish-container">
                    <canvas id="fishCanvas"></canvas>

                    <h3 class="right_first_prompt">Sign In</h3>
                    <div class="logo_container">
                        <a class="logo" href="#">
                            <img src="${pageContext.request.contextPath}/Sources/LoginSources/facebook.png" alt="facebook_icon" />
                        </a>

                        <a class="logo" href="${pageContext.request.contextPath}/LoginGoogleServlet">
                            <img src="${pageContext.request.contextPath}/Sources/LoginSources/google.png" alt="google_icon" />
                        </a>

                        <a class="logo" href="#">
                            <img src="${pageContext.request.contextPath}/Sources/LoginSources/linkin.png" alt="linkin_icon" />
                        </a>
                    </div>

                    <form class="form_container" action="${pageContext.request.contextPath}/LoginController" method="post">
                        <div class="input_group">
                            <img src="${pageContext.request.contextPath}/Sources/LoginSources/user.png" class="input_icon" alt="user" />
                            <input type="text" placeholder="Email" name="email" value="${email != null ? email : ''}" />
                        </div>

                        <div class="input_group">
                            <img src="${pageContext.request.contextPath}/Sources/LoginSources/lock.png" class="input_icon" alt="lock" />
                            <input type="password" placeholder="Password" name="password" value="${password != null ? password : ''}" />
                        </div>

                        <c:if test="${not empty error}">
                            <p style="color: red;">${error}</p>
                        </c:if>
                        <!-- REMEMBER ME CHECKBOX -->
                        <div class="remember-me-container" style="display: flex; align-items: center; margin-top: 10px;">
                            <input type="checkbox" id="rememberMe" name="rememberMe" style="margin-right: 5px;" 
                                   ${email != null ? "checked" : ""} />

                            <label for="rememberMe" style="margin: 0;">Remember Me</label>
                        </div>
                        <!-- FORGOT PASSWORD LINK -->
                        <div class="forgot-password-container" style="text-align: center; margin-top: 10px;">
                            <a href="${pageContext.request.contextPath}/view/forgot-password.jsp" 
                               style="color: #007bff; text-decoration: none; font-size: 14px;">
                                Forgot Password?
                            </a>
                        </div>

                        <br>
                        <button type="submit" class="signIn-btn">Sign In</button>
                    </form>
                </div>
            </div>
        </div>
        <script>
            window.contextPath = '${pageContext.request.contextPath}';
        </script>
        <script src="${pageContext.request.contextPath}/js/FishTank.js"></script>


    </body>
</html>