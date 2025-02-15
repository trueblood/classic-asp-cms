<!-- header.asp -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>My Classic ASP Website</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        .navbar {
            position: absolute;
            width: 100%;
            top: 0;
            left: 0;
            z-index: 1000;
        }
    </style>
</head>
    <div class="container mt-5">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container">
                <a class="navbar-brand ps-3" href="#">My Classic ASP Website</a> <!-- Added left padding -->
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"><a class="nav-link" href="index.asp">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="input.asp">Input</a></li>
                        <!-- <li class="nav-item"><a class="nav-link" href="#">Pricing</a></li>
                        <li class="nav-item pe-3"><a class="nav-link" href="#">Contact</a></li> -->
                    </ul>
                </div>
            </div>
        </nav>
    </div>
    <body class="container text-center mt-5 pt-3 d-flex flex-column ">
