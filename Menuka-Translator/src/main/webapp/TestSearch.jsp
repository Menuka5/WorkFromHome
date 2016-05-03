<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search a User</title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

</head>
<body>
<form class="form-horizontal">
    <fieldset>


        <div class="form-group">
            <label class="col-md-4 control-label" for="searchword">Search a User</label>
            <div class="col-md-5">
                <input id="searchword" type="text" placeholder="Add User's name" class="form-control input-md" required="">

            </div>
        </div>

        <div class="form-group">
            <label class="col-md-4 control-label" for=""></label>
            <div class="col-md-3">
                <button id="search1" class="btn btn-block btn-success">Search</button>
            </div>
        </div>

    </fieldset>
</form>

<script type="text/javascript">
    $(document).ready(function() {

        $('#search1').click(function ()
        {
            var searchdata = $("#searchword").val();
            console.log(searchdata);
            $.ajax({
                type: "GET",
                url: "http://localhost:8080/Search", //this is my servlet
                content: "application/json",
                data: {"searchword" :searchdata },
                success: function(data){
                    /*var out = "<table>";

                    for(i = 0; i < data.length; i++) {
                        out += "<tr><td>" +
                                data[i].fname +
                                "</td><td>" +
                                data[i].lname +
                                "</td><td>" +
                                data[i].dob +
                                "</td><td>" +
                                data[i].country +
                                "</td><td>" +
                                data[i].email +
                                "</td><td>" +
                                data[i].mnumber +
                                "</td></tr>";
                    }
                    out += "</table>";*/
                    console.log(data);
                },
                error: function(data){
                    alert("Error function");
                }
            });
        });

    });
</script>
<div id="id01"></div>
</body>
</html>
