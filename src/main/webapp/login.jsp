<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Login - GrandStay Hotel</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>

* {
    box-sizing: border-box;
}

body {
    margin: 0;
    font-family: Arial, Helvetica, sans-serif;
    min-height: 100vh;

    background:
        linear-gradient(
            90deg,
            rgba(10,15,25,0.92),
            rgba(10,15,25,0.55)
        ),
        url("https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=1800&q=85");

    background-size: cover;
    background-position: center;

    display: flex;
    align-items: center;
    justify-content: center;
}


/* =========================
   LOGIN CONTAINER
========================= */

.login-container {

    width: 900px;
    max-width: 92%;

    min-height: 520px;

    display: grid;
    grid-template-columns: 1.05fr 0.95fr;

    background: rgba(255,255,255,0.97);

    border-radius: 18px;

    overflow: hidden;

    box-shadow:
        0 25px 70px rgba(0,0,0,0.35);
}


/* =========================
   LEFT SIDE
========================= */

.brand-section {

    position: relative;

    padding: 55px 45px;

    color: white;

    background:
        linear-gradient(
            rgba(17,24,39,0.88),
            rgba(17,24,39,0.92)
        ),
        url("https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?auto=format&fit=crop&w=1000&q=80");

    background-size: cover;
    background-position: center;

    display: flex;
    flex-direction: column;
    justify-content: center;
}

.brand-section::after {

    content: "";

    position: absolute;

    left: 45px;
    bottom: 45px;

    width: 55px;
    height: 3px;

    background: #d4af37;
}

.hotel-icon {

    font-size: 46px;

    margin-bottom: 15px;
}

.brand-section h1 {

    margin: 0;

    font-size: 36px;

    letter-spacing: 1px;
}

.brand-section .tagline {

    margin-top: 10px;

    color: #d4af37;

    font-size: 12px;

    font-weight: bold;

    letter-spacing: 3px;
}

.brand-description {

    max-width: 330px;

    margin-top: 25px;

    color: #d1d5db;

    font-size: 14px;

    line-height: 1.7;
}


/* =========================
   RIGHT SIDE
========================= */

.login-section {

    padding: 55px 50px;

    display: flex;
    flex-direction: column;
    justify-content: center;
}

.login-header {

    margin-bottom: 30px;
}

.login-header h2 {

    margin: 0;

    font-size: 27px;

    color: #111827;
}

.login-header p {

    margin: 8px 0 0;

    color: #6b7280;

    font-size: 13px;
}


/* =========================
   ERROR
========================= */

.error-message {

    background: #fef2f2;

    border: 1px solid #fecaca;

    color: #b91c1c;

    padding: 11px 13px;

    border-radius: 7px;

    margin-bottom: 18px;

    font-size: 13px;
}


/* =========================
   FORM
========================= */

.form-group {

    margin-bottom: 20px;
}

.form-group label {

    display: block;

    margin-bottom: 8px;

    color: #374151;

    font-size: 13px;

    font-weight: 600;
}

.input-wrapper {

    position: relative;
}

.input-wrapper span {

    position: absolute;

    left: 14px;
    top: 50%;

    transform: translateY(-50%);

    color: #9ca3af;

    font-size: 16px;
}

input {

    width: 100%;

    padding: 13px 14px 13px 42px;

    border: 1px solid #d1d5db;

    border-radius: 8px;

    outline: none;

    font-size: 14px;

    transition: 0.2s;
}

input:focus {

    border-color: #d4af37;

    box-shadow:
        0 0 0 3px rgba(212,175,55,0.12);
}


/* =========================
   LOGIN BUTTON
========================= */

.login-btn {

    width: 100%;

    padding: 13px;

    margin-top: 5px;

    border: none;

    border-radius: 8px;

    background: #111827;

    color: white;

    font-size: 14px;

    font-weight: 700;

    cursor: pointer;

    transition: 0.2s;
}

.login-btn:hover {

    background: #d4af37;

    color: #111827;
}


/* =========================
   FOOTER
========================= */

.login-footer {

    margin-top: 25px;

    text-align: center;

    color: #9ca3af;

    font-size: 11px;
}

.login-footer strong {

    color: #8a6d1d;
}


/* =========================
   RESPONSIVE
========================= */

@media (max-width: 750px) {

    .login-container {

        grid-template-columns: 1fr;

        width: 430px;
    }

    .brand-section {

        padding: 35px;

        min-height: 230px;
    }

    .brand-section h1 {

        font-size: 28px;
    }

    .brand-description {

        display: none;
    }

    .login-section {

        padding: 40px 35px;
    }
}

</style>

</head>

<body>


<div class="login-container">


    <!-- =========================
         BRAND SECTION
    ========================== -->

    <div class="brand-section">

        <div class="hotel-icon">
            🏨
        </div>

        <h1>
            GrandStay
        </h1>

        <div class="tagline">
            HOTEL MANAGEMENT SYSTEM
        </div>

        <p class="brand-description">

            A centralized platform for managing
            customers, rooms, bookings, payments,
            invoices and hotel operations.

        </p>

    </div>


    <!-- =========================
         LOGIN SECTION
    ========================== -->

    <div class="login-section">


        <div class="login-header">

            <h2>
                Welcome Back
            </h2>

            <p>
                Sign in to access the management dashboard.
            </p>

        </div>


        <%

            String error =
                (String) request.getAttribute("error");

            if (error != null) {

        %>

        <div class="error-message">

            <%= error %>

        </div>

        <%

            }

        %>


        <form action="<%= request.getContextPath() %>/login"
              method="post">


            <!-- USERNAME -->

            <div class="form-group">

                <label for="username">
                    Username
                </label>

                <div class="input-wrapper">

                    <span>◉</span>

                    <input
                        type="text"
                        id="username"
                        name="username"
                        placeholder="Enter your username"
                        required
                        autocomplete="username">

                </div>

            </div>


            <!-- PASSWORD -->

            <div class="form-group">

                <label for="password">
                    Password
                </label>

                <div class="input-wrapper">

                    <span>●</span>

                    <input
                        type="password"
                        id="password"
                        name="password"
                        placeholder="Enter your password"
                        required
                        autocomplete="current-password">

                </div>

            </div>


            <!-- LOGIN -->

            <button
                type="submit"
                class="login-btn">

                Sign In

            </button>

        </form>


        <div class="login-footer">

            <strong>GrandStay Hotel</strong>

            &nbsp;•&nbsp;

            Secure Management Portal

        </div>


    </div>

</div>


</body>
</html>