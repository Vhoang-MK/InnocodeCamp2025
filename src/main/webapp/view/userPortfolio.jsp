<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    model.User user = (model.User) session.getAttribute("user");
    // Đọc skills trực tiếp từ database
    dao.SkillDAO skillDAO = new dao.SkillDAO();
    java.util.List<model.Skill> userSkills = skillDAO.getSkillsByUser(user.getId());
    request.setAttribute("userSkills", userSkills);
%>
<!DOCTYPE html>
<html>
<head>
    <title>User Portfolio</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f3f4f6;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 720px;
            margin: 60px auto;
            padding: 24px;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
        }

        h2 {
            text-align: center;
            font-size: 2.6rem;
            color: #2563eb;
            margin-bottom: 28px;
            font-weight: 800;
        }

        .portfolio-card {
            position: relative;
            background-color: #f9fafb;
            border-radius: 12px;
            padding: 28px 32px 32px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.04);
        }

        .edit-icon-btn {
            position: absolute;
            top: 12px;
            right: 12px;
            background-color: white;
            border: 1px solid #c4b5fd;
            padding: 6px;
            border-radius: 6px;
            cursor: pointer;
            z-index: 10;
            transition: background 0.2s ease;
        }

        .edit-icon-btn:hover {
            background-color: #f3f4f6;
        }

        .edit-icon-btn svg {
            width: 1.3em;
            height: 1.3em;
            pointer-events: none;
        }

        .field {
            margin-bottom: 18px;
        }

        .field label {
            display: block;
            font-weight: 600;
            color: #1f2937;
            font-size: 1.2rem;
        }

        .field .value {
            margin-top: 4px;
            font-size: 1.15rem;
            color: #374151;
        }

        .skills-list {
            margin-top: 4px;
        }

        .skill-text {
            display: inline-block;
            background-color: #e5e7eb;
            color: #374151;
            padding: 4px 12px;
            margin: 2px 4px 2px 0;
            border-radius: 16px;
            font-size: 1rem;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>User Portfolio</h2>
    <div class="portfolio-card">
        <!-- Nút edit để chuyển hướng -->
        <a href="${pageContext.request.contextPath}/SettingsServlet" class="edit-icon-btn" title="Edit profile">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                <path stroke="#7c3aed" stroke-width="2" d="M16.475 5.408a2.2 2.2 0 0 1 3.112 3.112l-9.1 9.1a2 2 0 0 1-.707.44l-3.2 1.067a.5.5 0 0 1-.633-.633l1.067-3.2a2 2 0 0 1 .44-.707l9.1-9.1Z"/>
                <path stroke="#7c3aed" stroke-width="2" stroke-linecap="round" d="M15.5 7.5l1 1"/>
            </svg>
        </a>

        <!-- Nội dung hồ sơ -->
        <div class="field">
            <label>Full Name:</label>
            <div class="value">${user.fullname}</div>
        </div>
        <div class="field">
            <label>Description:</label>
            <div class="value">${user.description}</div>
        </div>
        <div class="field">
            <label>Gender:</label>
            <div class="value">${user.gender}</div>
        </div>
        <div class="field">
            <label>Location:</label>
            <div class="value">${user.location}</div>
        </div>
        <div class="field">
            <label>Date of Birth:</label>
            <div class="value">${user.dateOfBirth}</div>
        </div>
        <div class="field">
            <label>Email:</label>
            <div class="value">${user.email}</div>
        </div>
        <div class="field">
            <label>Role:</label>
            <div class="value">${user.role}</div>
        </div>

        <!-- Phần Skills -->
        <div class="field">
            <label>Skills:</label>
            <div class="skills-list">
                <c:choose>
                    <c:when test="${not empty userSkills}">
                        <c:forEach var="skill" items="${userSkills}">
                            <span class="skill-text">${skill.skillName} (${skill.score}/100)</span>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div class="value">Chưa có kỹ năng nào</div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>
</body>
</html>
