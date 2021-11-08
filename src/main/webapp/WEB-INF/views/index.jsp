<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>drevojewelry</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="//unpkg.com/@fortawesome/fontawesome-free/css/fontawesome.css" />
    <link rel="stylesheet" href="//unpkg.com/@fortawesome/fontawesome-free/css/brands.css" />
    <link rel="stylesheet" href="//unpkg.com/@fortawesome/fontawesome-free/css/regular.css" />
    <link rel="stylesheet" href="//unpkg.com/@fortawesome/fontawesome-free/css/solid.css" />

    <style>
        .bottom-left {
            position: absolute;
            bottom: 20px;
            left: 20px;
        }

        .bottom-right {
            position: absolute;
            bottom: 20px;
            right: 20px;
        }

        .fa-instagram {
            color: #E1306C;
        }

        .fa-adjust {
            color: #444;
        }

        .dark-theme .fa-adjust {
            color: #aaa;
        }

        h2 {
            font-family: Lobster;
            font-size: 60px;
            font-weight: 500;
            text-align: center;
            margin-top: 200px;
            text-shadow: 6px 6px #ffcb00;
        }

        .dark-theme h2 {
            color: #eee;
            text-shadow: none;
        }

        button {
            padding: 8px 16px;
            background: #ffcb00;
            border: 0;
            border-radius: 5px;
            font-size: 18px;
            color: #333;
            margin: 6px;
            cursor: pointer;
            border: 2px solid transparent;
        }

        button:hover {
            border: 2px solid #333;
        }

        div {
            text-align: center;
        }

        .images {
            margin: 50px auto 0 auto;
        }

        .images img {
            width: 15%;
            margin: 5px;
        }
    </style>
</head>

<body>
    <%@ include file = "./parts/header.jsp" %>

    <h2>drevojewelry</h2>

    <div>
        <a href="/products?category=RING"><button><fmt:message key="product.category.rings" /></button></a>
        <a href="/products?category=PENDANT"><button><fmt:message key="product.category.pendants" /></button></a>
        <a href="/products?category=OTHER"><button><fmt:message key="product.category.others" /></button></a>
        <a href="/products"><button><fmt:message key="product.category.all" /></button></a>
    </div>

    <div class="images">
        <img src="https://i.imgur.com/HNHCTOX.jpg" />
        <img src="https://i.imgur.com/nCiCQWr.jpg" />
        <img src="https://i.imgur.com/AtlDoAt.jpg" />
    </div>

    <div class="bottom-left">
        <a href="https://www.instagram.com/drevojewelry"><i class="fab fa-instagram fa-2x"></i></a>
    </div>

    <div class="bottom-right">
        <i class="fas fa-adjust fa-2x"></i>
    </div>

    <%@ include file = "./parts/footer.jsp" %>
</body>
</html>

