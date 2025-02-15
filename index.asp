<!--#include file="includes/header.asp"-->

<div class="container mt-5">
    <div class="jumbotron">
        <h1 class="display-4">Welcome to My Classic ASP Website</h1>
        <p class="lead">This website is built using Classic ASP with VBScript, AJAX, Jquery, Bootstrap 5, and ADO for connecting to SQL Server and updating the website.</p>
        <hr class="my-4">
        <p>Explore the features and enjoy the seamless experience of a classic yet powerful VBScript web application.</p>
    </div>

    <div class="row">
        <!-- Input Card -->
        <div class="col-md-4">
            <div class="card mb-4">
                <div class="card-header">
                    Input Card
                </div>
                <div class="card-body">
                    <p class="card-text">This card allows you to input data.</p>
                    <p class="card-text">Based on Classic ASP - Input Form Playground.</p>
                    <a href="input.asp" class="btn btn-primary">Go to Input Form</a>
                </div>
            </div>
        </div>

        <!-- Grid Card -->
        <div class="col-md-4">
            <div class="card mb-4">
                <div class="card-header">
                    Grid Card
                </div>
                <div class="card-body">
                    <p class="card-text">This card displays a grid layout.</p>
                    <div class="row">
                        <div class="col-6">
                            <div class="p-2 border bg-light">Grid Item 1</div>
                        </div>
                        <div class="col-6">
                            <div class="p-2 border bg-light">Grid Item 2</div>
                        </div>
                        <div class="col-6">
                            <div class="p-2 border bg-light">Grid Item 3</div>
                        </div>
                        <div class="col-6">
                            <div class="p-2 border bg-light">Grid Item 4</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Form Submit Card -->
        <div class="col-md-4">
            <div class="card mb-4">
                <div class="card-header">
                    Form Submit Card
                </div>
                <div class="card-body">
                    <p class="card-text">This card contains a form submission example.</p>
                    <form id="ajaxForm">
                        <div class="mb-3">
                            <label for="name" class="form-label">Enter Your Name:</label>
                            <input type="text" class="form-control" id="name" name="name" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                        <button type="button" id="capitalizeText" class="btn btn-secondary m-2" disabled>Capitalize Text</button>
                        <button id="generateRandom" class="btn btn-secondary m-2" disabled>Generate Random Number</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!--#include file="includes/footer.asp"-->