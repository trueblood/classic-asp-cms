<!--#include file="includes/header.asp"-->
        <h1 class="display-5">Classic ASP - Input Form Playground</h1>
        <form id="ajaxForm">
            <div class="mb-3 w-50 mx-auto">
                <label for="name" class="form-label" style="font-size: 1.5rem;">Enter Some Text:</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            <button type="submit" class="btn btn-primary m-2">Submit</button>
            <button type="button" id="capitalizeText" class="btn btn-secondary m-2" disabled>Capitalize Text</button>
            <button type="button" id="generateRandom" class="btn btn-secondary m-2" disabled>Generate Random Number</button>
        </form>
        
        <div class="mt-4">
            <h3>Processed Outputs:</h3>

            <p id="response" class="lead text-primary">
                <span class="text-muted">No name entered yet.</span>
            </p>
    
            <p id="capitalizedOutput" class="lead text-primary">
                <span class="text-muted">No capitalized text yet.</span>
            </p>
    
            <p id="randomNumberOutput" class="lead text-success">
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
                        $('#capitalizeText, #generateRandom').prop('disabled', false); // Enable buttons after valid submit
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
                    data: { generateRandom: true },
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
<!--#include file="includes/footer.asp"-->