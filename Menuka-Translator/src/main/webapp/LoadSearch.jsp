<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Search a User</title>

    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.js"></script>

<%--
    <script>
        $(document).ready(function(){
            $("#deleteUserData").click(function(){
                var delUser = $("#username").val();


            });
        });
    </script>--%>




    <script>
        function operateFormatter(value, row, index) {
            return [

                '<a class="remove ml10 btn btn-danger btn-large" href="javascript:void(0)" title="Remove">', 'Delete',
                '<i class="glyphicon glyphicon-remove"></i>',
                '</a>'
            ].join('');
        }

        window.operateEvents = {
            'click .remove': function (e, value, row, index) {
                var jstring = JSON.stringify(row);
                var obj = JSON.parse(jstring);

//                alert(jstring);

                $("#username").text(obj.username);

                $("#deleteUser").modal("show");

            }
        };
    </script>


    <script>
        $(document).ready(function () {

            $.ajax({

                // The URL for the request
                url: "AllData",

                // Whether this is a POST or GET request
                type: "GET",

                // The type of data we expect back
                dataType: "json",
                success: function (data2) {

                    $('#table').bootstrapTable({
                        method: 'get',
                        data: data2,
                        striped: true,
                        pagination: true,
                        pageSize: 10,
                        pageList: [10, 25, 50, 100, 200],
                        search: false,
                        showColumns: false,
                        showRefresh: false,
                        height: 500,
                        minimumCountColumns: 2,
                        columns: [{
                            field: 'firstName',
                            title: 'First Name',
                            align: 'left',
                            valign: 'bottom',
                            sortable: true
                        }, {
                            field: 'lastName',
                            title: 'Last Name',
                            align: 'left',
                            valign: 'middle',
                            sortable: true,

                        }, {
                            field: 'country',
                            title: 'Country',
                            align: 'left',
                            valign: 'top',
                            sortable: true,

                        }, {
                            field: 'dob',
                            title: 'Date of Birth',
                            align: 'Center',
                            valign: 'bottom',
                            sortable: true
                        }, {
                            field: 'mobile',
                            title: 'Mobile',
                            align: 'Center',
                            valign: 'bottom',
                            sortable: true
                        }, {
                            field: 'email',
                            title: 'Email',
                            align: 'left',
                            valign: 'bottom',
                            sortable: true
                        }, {
                            field: 'username',
                            title: 'Username',
                            align: 'left',
                            valign: 'bottom',
                            sortable: true
                        }, {
                            field: 'userRole',
                            title: 'User Role',
                            align: 'left',
                            valign: 'bottom',
                            sortable: true
                        }, {
                            field: 'operate',
                            title: 'Delete User',
                            align: 'center',
                            valign: 'middle',
                            formatter: operateFormatter,
                            events: operateEvents
                        }]
                    });


                },
                error: function (data) {
                    console.log(data);
                }
            })

        });
    </script>
    <%-- On click Table--%>
    <script>
        $(document).ready(function () {

            $("#deleteUserData").click(function () {
                var deleteUser = $("#username").text();
                alert(deleteUser);
                $.ajax({

                    // The URL for the request
                    url: "DeleteUser",

                    // The data to send (will be converted to a query string)
                    data: {
                        delete: deleteUser
                    },

                    // Whether this is a POST or GET request
                    type: "GET",

                    // The type of data we expect back
                    success: function (data2) {
                        alert("User " + deleteUser +"Successfully deleted!!!");
                    },
                    error: function (data) {
                        console.log(data);
                    }
                })

            });
        });
    </script>


</head>
<body>
<%@include file="top.jsp" %>
<center>
    <input type="text" id="search">

    <button id="bn1" class="btn btn-primary btn-large"><i class="icon-white icon-zoom-in"></i>Search</button>
    <br>
    <br>
</center>
<div class="col-md-12">
    <table id="table"></table>
</div>

<%-- Delete User model--%>
<div class="modal fade" id="deleteUser" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <center> <h4 class="modal-title">Delete User</h4></center>
            </div>
            <div class="modal-body">

                <p>Do you want to delete <label id="username"></label>
                     </p>
                <button type="button" class="btn btn-default" data-dismiss="modal" id="deleteUserData">Delete</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
            </div>
        </div>

    </div>
</div>

</body>
</html>
