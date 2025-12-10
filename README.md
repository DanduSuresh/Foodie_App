# Foodie_App

🍔 Foodie – Online Food Delivery Web Application

A Java + JSP + Servlets based food ordering platform

📌 Overview

Foodie is a fully functional food delivery web application built using Java, JSP, Servlets, JDBC, and MySQL.
The application allows users to register, login, browse restaurants, view menus, add items to cart, place orders, and track past orders.
Designed with a clean UI inspired by Swiggy/Zomato, the project includes smooth animations, responsive layouts, and reusable components.

🚀 Features
🔹 User Features

User Registration & Login

Profile viewing

Browse restaurants with images, ratings, cuisine

Explore category-wise food items

View menu for each restaurant

Add items to cart

Modify cart quantity / remove items

Checkout with delivery address + payment method

Order Success Page

View all past orders

View order item details

🔹 UI Pages
Page	Description
Home Page	Hero section, search, food categories, offers, why-choose-us, app download, footer
Restaurants Page	List of all restaurants with full card UI
Menu Page	Menu items for a selected restaurant
Cart Page	Contains selected items and total amount
Checkout Page	Delivery address + payment
Order Success Page	Confirmation message
My Orders Page	List of all previous orders
Order Items Page	Items inside each order
Profile Page	View logged-in user info
Login & Registration Pages	Secure authentication
🏗️ Tech Stack
Frontend

HTML

CSS (Fully responsive + animations)

JSP

Custom UI components (NavBar, Cards, Categories, Footer)

Backend

Java (JDK 17+)

Servlets

DAO Pattern

JDBC for MySQL

Database

MySQL

Tables: user, restaurant, menu, orders, order_items

📂 Project Structure
Foodie/
│── src/main/java/com/tap/
│     ├── servlet/       → All Servlets (Login, Cart, Orders, Profile…)
│     ├── dao/           → DAO Interfaces
│     ├── daoImpl/       → DAO Implementations
│     ├── model/         → POJO Classes
│     └── util/          → DBConnection
│
│── src/main/webapp/
│     ├── Styles/        → All CSS files
│     ├── home.jsp
│     ├── restaurant.jsp
│     ├── menu.jsp
│     ├── cart.jsp
│     ├── checkout.jsp
│     ├── orderSuccess.jsp
│     ├── myorders.jsp
│     ├── orderitems.jsp
│     ├── profile.jsp
│     ├── login.jsp
│     └── registration.jsp
│
└── README.md

⚙️ How to Run
1️⃣ Import Project

Open Eclipse / IntelliJ / VS Code

Import as Maven Project

2️⃣ Configure Database

Create MySQL schema:

CREATE DATABASE food_delivery;


Update your DB credentials in:

src/main/java/com/tap/util/DBConnection.java

3️⃣ Run on Server

Use Apache Tomcat 9/10
Deploy project → Run on server → Open:



Add screenshots of UI if you want

✨ Future Enhancements

Add online payment gateway

Add admin dashboard

Real-time order tracking

Restaurant admin panel

Offers & coupons system

👨‍💻 Author

Suresh Dandu
📍 Andhra Pradesh, India
💼 Java Developer | Full-Stack Enthusiast
🔗 LinkedIn: https://www.linkedin.com/in/dandu-suresh/
