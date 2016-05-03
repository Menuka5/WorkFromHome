<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search a User</title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

</head>
<body>
<form method="post" class="form-horizontal">
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
        {console.debug('');
            var searchdata = $("#searchword").val();
            $.ajax({
                type: "GET",
                url: "Search", //this is my servlet
                data: {searchword :searchdata },
                success: function(data){
                    var out = "<table>";

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
                    out += "</table>";
                    document.getElementById("id01").innerHTML = out;
                }
            });
        });

    });
</script>
<div id="id01"></div>
</body>
</html>
