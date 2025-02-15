<style>
    .footer {
        position: absolute;
        bottom: 0;
        left: 0;
        width: 100%;
        min-height: 100px;
        background-color: #f8f9fa;
        text-align: center;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .footer hr {
        width: 100%;
        height: 2px;
        background-color: black;
        border: none;
        margin: 0;
    }
</style>

<footer class="footer">
    &copy; <%=Year(Now())%> My Classic ASP Website
</footer>
</body>
</html>
