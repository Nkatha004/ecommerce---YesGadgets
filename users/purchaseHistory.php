<?php
    include('../product/database_connection.php');

    session_start();

    $id = $_SESSION['id'] ?? null;
    $query = "SELECT * FROM orders WHERE user_id = $id";

    $statement = $connect->prepare($query);
    $statement->execute();
    $result = $statement->fetchAll();
    $total_row = $statement->rowCount();
    $output = '';
    if($total_row > 0)
    {
        
        $sql_select_order = "SELECT orders.order_id, product.product_name, item_order.item_order_id, item_order.quantity, product.product_price,orders.date, orders.time FROM orders, item_order,product,tbl_users WHERE orders.user_id IN ($id) AND tbl_users.user_id = orders.user_id AND item_order.order_id = orders.order_id AND item_order.product_id = product.product_id ORDER BY orders.order_id";

        $statement_order = $connect->prepare($sql_select_order);
        $statement_order->execute();
        $result_order = $statement_order->fetchAll();
        $total_row_order = $statement_order->rowCount();
    }


?>
<!DOCTYPE html>
<html>
    <head>
        <title>My Cart</title>
        <link rel="stylesheet"href="homepage.css">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <style>
            tr:hover{
                background-color: whitesmoke;
            }
            table{
                width:80%;
                margin-left: 10%;
            }
            table, th, td{
                text-align:center;
                height: 50px;
            }
           tr{
            border-bottom: solid 2px;
           }
            input{
                text-align:center;
                height: 40px;
            }
            thead{
                height:60px;
            }
        </style>
    </head>
    <body>
        <div class="fixed-navbar">
            <div class="container">
                <div class="logo_div">
                    <a href = "homepage.php"><img src="logo.png"alt=""class="logo"style='max-width:80px'></a>
                </div>
                <div class="fixed-navbar_links">
                    <ul class="Taskbar">
                        <a style = "text-decoration: none;font-size: xx-large;" href="homepage.php"class="mb-logo" style="color: grey;">Yes <span style="color:#F37335 ;">Gadgets Kenya</span></a>&nbsp;
                        
                    </ul>
                        
                    <ul class="Taskbar_2">
                        <a href="signin.php"> <i class='fas fa-user-circle' style='font-size:30px;color:red'></i></a>
                        &nbsp;&nbsp;&nbsp;
                        <a href = '../cart.php'><i class="fa fa-shopping-cart" style='font-size:30px;color:red'></i></a>&nbsp;&nbsp;&nbsp;
                    </ul>
                </div>
            </div>
        </div>        
        <br/><br/><br><br><br><br>

        <div style = "color:black; text-align:center"><h2>My Purchase History</h2><br/><br/>
                <table>
                    <thead>
                        <th>Order ID</th>
                        <th>Item Order ID</th>
                        <th>Date</th>
                        <th>Time</th>
                        <th>Product Name</th>
                        <th>Product Price</th>
                        <th>Quantity</th>
                        <th>Total</th>
                        <th></th>
                    </thead>
                    <tbody style = 'color:black;'>
                        <?php 
                        if($total_row_order??null > 0)
                        {
                            foreach($result_order as $row_order)
                            {
                                echo "<tr>
                                <td>".$row_order['order_id']."</td>
                                <td>".$row_order['item_order_id']."</td>
                                <td>".$row_order['date']."</td>
                                <td>".$row_order['time']."</td>
                                <td>".$row_order['product_name']."</td>
                                <td>".$row_order['product_price']."</td>
                                <td>".$row_order['quantity']."</td>
                                <td>".$row_order['quantity']*$row_order['product_price']."</td>
                                </tr>";
                            
                            }
                        }
                         else{
                            echo "<tr style = 'margin-left:50px;'><td></td><td></td><td></td>
                            <td style = 'font-weight:bold'>No purchase history found!</td><td></td><td></td><td></td><td></td></tr>";
                        }?>
                </tbody>

                </table>
                <br><br><br>
        
                <a href = "../product/index.php" title="Continue Shopping"><button style = "height: 50px;width:250px;"class = 'btn'>Continue Shopping</button></a>
                <a href = "../cart.php" title="View my Cart"><button style = "height: 50px;width:250px;"class = 'btn'>View Cart</button></a>
                </div>
    </body>
</html>