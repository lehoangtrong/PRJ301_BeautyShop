<%-- Document : index Created on : Jun 21, 2024, 5:16:15 PM Author : LeHoangTrong --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!doctype html>
<html lang="en">

    <head>
        <c:import url="import.jsp"/>
        <title>Beauty Shop</title>
    </head>
    <body>
        <c:import url="header.jsp" />
        <c:import url="message.jsp" />

        <div class="main-content">
            <section class="hero-layout1">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="hero-box hero-box-layout1">
                                <div class="hero-box__inner">
                                    <h1 class="hero-box__title text-dark">Welcome to Beauty Shop</h1>
                                    <p class="hero-box__text text-dark">Elegance Unveiled: Discover the ultimate beauty
                                        destination where luxury meets personalized care. Indulge in
                                        rejuvenating treatments, expert beauty advice, and a tranquil atmosphere
                                        designed for your relaxation and radiance.</p>
                                    <a href="MainController?action=Shopping_Page"
                                       class="btn btn__primary btn__icon">Shop Now <i
                                            class="fa-solid fa-cart-shopping"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    </body>

</html>