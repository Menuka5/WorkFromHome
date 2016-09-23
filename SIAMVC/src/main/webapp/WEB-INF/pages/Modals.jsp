<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <title>Spring MVC Form Handling</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <h2>Modal Example</h2>
    <!-- Trigger the modal with a button -->
    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>

    <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">

                <h2>Student Information</h2>
                <form action="login" method="post">
                    <table>
                        <tr>
                            <td>User Name : </td>
                            <td><input type="text" name="name" id="name"/> </td>
                        </tr>
                        <tr>
                            <td>Password: </td>
                            <td><input type="text" name="password"  id="password"/> </td>
                        </tr>
                        <tr>
                            <td colspan="2"><input type="submit" value="Login"/></td>
                        </tr>
                    </table>
                </form>
            </div>

        </div>
    </div>

</div>
</body>
</html>