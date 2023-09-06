<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

    <!-- Custom CSS -->
    <style>
        table thead th {
            background-color: #e9ecef;
            font-weight: bold;
            color: #495057;
            border-bottom: 2px solid #dee2e6;
        }

        table tbody tr:hover {
            background-color: #f8f9fa;
        }
    </style>
</head>
<body>

<%@ include file="/WEB-INF/views/comm/header.jsp"%>

<h2 class="mb-4">Customer List</h2>

<table class="table table-striped table-hover">
    <thead>
        <tr>
            <th>Customer ID</th>
            <th>Password</th>
            <th>Status</th>
            <th>Name</th>
            <th>Identity Number</th>
            <th>Phone Number</th>
            <th>Email</th>
            <th>Address</th>
            <th>Join Date</th>
            <th>회원수정</th> <!-- Add this for the actions column -->
        </tr>
    </thead>
    <tbody>
        <c:forEach var="customer" items="${list}">
            <tr>
                <td>${customer.customerId}</td>
                <td>${customer.password}</td>
                <td>${customer.status}</td>
                <td>${customer.name}</td>
                <td>${customer.identityNumber}</td>
                <td>${customer.phoneNumber}</td>
                <td>${customer.email}</td>
                <td>${customer.address}</td>
                <td>${customer.joinDate}</td>
                <td>

                  <a href="/customer_update">
                    <button class="btn btn-warning btn-sm">Update</button>
                  </a>

                    <button class="btn btn-danger btn-sm">Delete</button>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<%@ include file="/WEB-INF/views/comm/footer.jsp"%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>
