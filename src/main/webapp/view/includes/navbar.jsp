<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Navbar -->
<header class="navbar">
    <div class="navbar-container">
        <div class="navbar-left">
            <span class="navbar-logo" style="display: flex; align-items: center;">
                <!-- Animated SVG Logo -->
                <svg width="36" height="36" viewBox="0 0 36 36" fill="none" xmlns="http://www.w3.org/2000/svg" class="animated-logo">
                  <circle cx="18" cy="18" r="16" stroke="#2563eb" stroke-width="4" fill="#fff"/>
                  <path d="M10 24C12 18 24 18 26 24" stroke="#7c3aed" stroke-width="2.5" stroke-linecap="round" fill="none">
                    <animate attributeName="d" values="M10 24C12 18 24 18 26 24;M10 22C14 16 22 16 26 22;M10 24C12 18 24 18 26 24" dur="2s" repeatCount="indefinite"/>
                  </path>
                  <circle cx="14" cy="15" r="2" fill="#2563eb">
                    <animate attributeName="cy" values="15;13;15" dur="1.5s" repeatCount="indefinite"/>
                  </circle>
                  <circle cx="22" cy="15" r="2" fill="#7c3aed">
                    <animate attributeName="cy" values="15;17;15" dur="1.5s" repeatCount="indefinite"/>
                  </circle>
                </svg>
            </span>
            <span class="navbar-brand">InnocodeCamp</span>
        </div>
        <nav class="navbar-links">
            <a href="${pageContext.request.contextPath}/HomeServlet" class="nav-link ${pageContext.request.servletPath == '/HomeServlet' ? 'active' : ''}"><i data-lucide="home"></i> Home</a>
            <a href="${pageContext.request.contextPath}/view/inputDescription.jsp" class="nav-link ${pageContext.request.servletPath == '/view/inputDescription.jsp' ? 'active' : ''}"><i data-lucide="upload"></i> Skills Analysis</a>
            <a href="${pageContext.request.contextPath}/JobRecommendationServlet" class="nav-link ${pageContext.request.servletPath == '/JobRecommendationServlet' ? 'active' : ''}"><i data-lucide="search"></i> Job Recommendations</a>
            <a href="${pageContext.request.contextPath}/SkillChartServlet" class="nav-link ${pageContext.request.servletPath == '/SkillChartServlet' ? 'active' : ''}"><i data-lucide="bar-chart-3"></i> Skills Chart</a>
            <a href="${pageContext.request.contextPath}/JobApplicationsServlet" class="nav-link ${pageContext.request.servletPath == '/JobApplicationsServlet' ? 'active' : ''}"><i data-lucide="briefcase"></i> My Applications</a>
            <a href="${pageContext.request.contextPath}/chat2.jsp" class="nav-link ${pageContext.request.servletPath == '/chat2.jsp' ? 'active' : ''}"><i data-lucide="message-square"></i> Career Chatbot</a>
        </nav>
        <div class="navbar-user">
            <div class="user-icon" onclick="toggleUserMenu()">
                <i data-lucide="user"></i>
            </div>
            <div id="userMenu" class="user-menu hidden">
                <div class="user-info">
                    <div class="avatar-placeholder">
                        <i data-lucide="user"></i>
                    </div>
                    <div>
                        <div class="user-name">${sessionScope.user.fullname}</div>
                        <div class="user-email">${sessionScope.user.email}</div>
                    </div>
                </div>
                <a href="${pageContext.request.contextPath}/view/userPortfolio.jsp"><i data-lucide="folder"></i> User Portfolio</a>
                <a href="${pageContext.request.contextPath}/SettingsServlet"><i data-lucide="user"></i> Personal profile</a>
                <hr>
                <a href="${pageContext.request.contextPath}/LogoutServlet" class="logout"><i data-lucide="log-out"></i>Exits </a>
            </div>
        </div>
    </div>
</header>
<script>
    function toggleUserMenu() {
        const menu = document.getElementById("userMenu");
        menu.classList.toggle("hidden");
    }
    window.addEventListener("click", function (e) {
        const menu = document.getElementById("userMenu");
        const icon = document.querySelector(".user-icon");
        if (!menu.contains(e.target) && !icon.contains(e.target)) {
            menu.classList.add("hidden");
        }
    });

    // Set active navigation based on current page
    function setActiveNav() {
        const currentPath = window.location.pathname;
        const navLinks = document.querySelectorAll('.navbar-links a');
        
        navLinks.forEach(link => {
            const href = link.getAttribute('href');
            if (href && currentPath.includes(href.split('/').pop())) {
                link.classList.add('active');
            }
        });
    }

    // Call on page load
    document.addEventListener('DOMContentLoaded', setActiveNav);
</script>
