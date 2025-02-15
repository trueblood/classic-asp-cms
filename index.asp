<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Classic ASP with AJAX</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <body class="container text-center mt-5">
        <h1 class="display-4">Classic ASP - Execute with AJAX</h1>
        <form id="ajaxForm">
            <div class="mb-3 w-50 mx-auto">
                <label for="name" class="form-label">Enter Your Name:</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
            <button type="button" id="capitalizeText" class="btn btn-secondary m-2">Capitalize Text</button>
        </form>
        <div id="response" class="mt-3"></div>
        
        <div class="mt-4">
            <h3>Processed Outputs:</h3>
    
            <p id="capitalizedOutput" class="lead text-primary">
                <span class="text-muted">No capitalized text yet.</span>
            </p>
    
            <p id="randomNumberOutput" class="lead text-success">
                <span class="text-muted">No random number generated yet.</span>
            </p>
        </div>

        <button id="generateRandom" class="btn btn-secondary mt-3">Generate Random Number</button>
        <p id="randomNumberOutput" class="lead text-success mt-2">
            <span class="text-muted">No random number generated yet.</span>
        </p>
    </div>
    
    <script>
        $(document).ready(function(){
            $('#ajaxForm').submit(function(e){
                e.preventDefault();
                var name = $('#name').val();
                
                $.ajax({
                    url: 'process.asp',
                    type: 'POST',
                    data: { name: name },
                    success: function(response){
                        $('#response').html('<div class="alert alert-success">' + response + '</div>');
                    },
                    error: function(){
                        $('#response').html('<div class="alert alert-danger">Error processing request</div>');
                    }
                });
            });

            $('#capitalizeText').click(function(){
                var name = $('#name').val();
                
                $.ajax({
                    url: 'process.asp',
                    type: 'POST',
                    data: { name: name, capitalize: true },
                    success: function(response){
                        $('#capitalizedOutput').html('<div class="alert alert-info">Capitalized Text: ' + response + '</div>');
                    },
                    error: function(){
                        $('#capitalizedOutput').html('<div class="alert alert-danger">Error capitalizing text</div>');
                    }
                });
            });

            $('#generateRandom').click(function(){
                $.ajax({
                    url: 'process.asp',
                    type: 'POST',
                    data: { random: true },
                    success: function(response){
                        $('#randomNumberOutput').html('<div class="alert alert-info">Random Number: ' + response + '</div>');
                    },
                    error: function(){
                        $('#randomNumberOutput').html('<div class="alert alert-danger">Error generating random number</div>');
                    }
                });
            });
        });
    </script>
</body>
</html>
