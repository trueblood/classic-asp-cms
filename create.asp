<!--#include file="includes/header.asp"-->

<div class="container mt-5">
    <div class="card mx-auto shadow-lg p-4 text-center" style="max-width: 500px;">
        <!-- Cute Font Awesome Emoji -->
        <div class="mb-3">
            <i class="fas fa-smile-beam text-warning" style="font-size: 50px;"></i>
        </div>

        <h3 class="text-center mb-4">Create New User</h3>

        <form id="userForm">
            <input type="hidden" name="action" value="insert">

            <!-- First Name -->
            <div class="mb-3 input-group">
                <span class="input-group-text"><i class="fas fa-user"></i></span>
                <input type="text" class="form-control" id="firstName" name="firstName" placeholder="First Name" required>
            </div>

            <!-- Last Name -->
            <div class="mb-3 input-group">
                <span class="input-group-text"><i class="fas fa-user"></i></span>
                <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Last Name" required>
            </div>

            <!-- Age -->
            <div class="mb-3 input-group">
                <span class="input-group-text"><i class="fas fa-birthday-cake"></i></span>
                <input type="number" class="form-control" id="age" name="age" min="1" placeholder="Age" required>
            </div>

            <!-- Is Active -->
            <div class="mb-3 input-group">
                <span class="input-group-text"><i class="fas fa-toggle-on"></i></span>
                <select class="form-select" id="isActive" name="isActive" required>
                    <option value="" selected disabled>Select Status</option>
                    <option value="Active">Active</option>
                    <option value="Inactive">Inactive</option>
                </select>
            </div>

            <!-- Buttons -->
            <div class="d-flex gap-2">
                <button type="submit" class="btn btn-primary w-50">
                    <i class="fas fa-save"></i> Save
                </button>
                <button type="button" class="btn btn-secondary w-50" id="clearForm">
                    <i class="fas fa-eraser"></i> Clear
                </button>
            </div>
        </form>
    </div>
</div>

<!-- Include Font Awesome -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"> -->

<script>
$(document).ready(function () {
    $("#userForm").on("submit", function (e) {
        e.preventDefault();

        let firstName = $("#firstName").val().trim();
        let lastName = $("#lastName").val().trim();
        let age = $("#age").val().trim();
        let isActive = $("#isActive").val();

        // if (firstName === "" || lastName === "" || age === "" || isActive === null) {
        //     alert("All fields are required!");
        //     return;
        // }

        $.ajax({
            url: "process.asp",
            type: "POST",
            data: {
                firstName: firstName,
                lastName: lastName,
                age: age,
                isActive: isActive
            },
            success: function (response) {
                window.location.href = "grid.asp"; 
            }
        });
    });

    // Clear Button: Resets form inputs
    $("#clearForm").on("click", function () {
        $("#userForm")[0].reset();
    });
});
</script>

<!--#include file="includes/footer.asp"-->
