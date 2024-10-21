<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error Page</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f8f9fa;
        }
        .error-box {
            max-width: 500px;
            padding: 30px;
            border-radius: 10px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .error-box h1 {
            color: #dc3545;
        }
        .error-box p {
            color: #6c757d;
        }
        .btn-back {
            margin-top: 20px;
        }
    </style>
</head>
<body>

    <div class="error-box">
        <h1>Error Occurred</h1>
        <p>Oops! Something went wrong. Please try again or contact support if the problem persists.</p>
        <a href="index.jsp" class="btn btn-primary btn-back">Go Back to Home</a>
    </div>

    <!-- Bootstrap JS (for components) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
