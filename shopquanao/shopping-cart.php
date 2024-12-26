<?php
include 'connect.php';
session_start();

$cart_id = isset($_SESSION['cart_id']) ? $_SESSION['cart_id'] : null;

if ($cart_id) {
    $stmt = $conn->prepare("SELECT * FROM cart_details inner join products on cart_details.product_id = products.id WHERE cart_id = :cart_id");
    $stmt->bindParam(':cart_id', $cart_id, PDO::PARAM_INT);
    $stmt->execute();
    $cart_details = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $stmt = $conn->prepare("SELECT total_cost FROM cart WHERE id = :cart_id");
    $stmt->bindParam(':cart_id', $cart_id, PDO::PARAM_INT);
    $stmt->execute();
    $cart = $stmt->fetch(PDO::FETCH_ASSOC);
    $total_cost = $cart['total_cost'];
} else {
    $cart_details = [];
    $total_cost = 0;
}

if ($cart_id && $_SERVER["REQUEST_METHOD"] == "POST") {
    try {
        $conn->beginTransaction();

        $stmt = $conn->prepare("SELECT total_cost FROM cart WHERE id = :cart_id");
        $stmt->bindParam(':cart_id', $cart_id, PDO::PARAM_INT);
        $stmt->execute();
        $cart = $stmt->fetch(PDO::FETCH_ASSOC);
        $total_cost = $cart['total_cost'];

        $stmt = $conn->prepare("INSERT INTO `orders` (created_date_time, created_by, status, modified_date_time, updated_by, order_status, order_time, total_cost, transaction_status, address_id, customer_id) 
                                 VALUES (NOW(), 'admin', 'Pending', NOW(), 'admin', 'Pending', NOW(), :total_cost, 'Pending', NULL, NULL)");
        $stmt->bindParam(':total_cost', $total_cost, PDO::PARAM_STR);
        $stmt->execute();
        $order_id = $conn->lastInsertId();

        $stmt = $conn->prepare("SELECT * FROM cart_details WHERE cart_id = :cart_id");
        $stmt->bindParam(':cart_id', $cart_id, PDO::PARAM_INT);
        $stmt->execute();
        $cart_details = $stmt->fetchAll(PDO::FETCH_ASSOC);

        foreach ($cart_details as $item) {
            $stmt = $conn->prepare("INSERT INTO order_details (created_date_time, created_by, status, modified_date_time, updated_by, price_of_one, quantity, total_price, order_id, product_id) 
                                     VALUES (NOW(), 'admin', 'Pending', NOW(), 'admin', :price_of_one, :quantity, :total_price, :order_id, :product_id)");
            $stmt->bindParam(':price_of_one', $item['price_of_one'], PDO::PARAM_STR);
            $stmt->bindParam(':quantity', $item['quantity'], PDO::PARAM_INT);
            $stmt->bindParam(':total_price', $item['total_price'], PDO::PARAM_STR);
            $stmt->bindParam(':order_id', $order_id, PDO::PARAM_INT);
            $stmt->bindParam(':product_id', $item['product_id'], PDO::PARAM_INT);
            $stmt->execute();
        }

        $stmt = $conn->prepare("UPDATE cart SET total_cost = 0 WHERE id = :cart_id");
        $stmt->bindParam(':cart_id', $cart_id, PDO::PARAM_INT);
        $stmt->execute();

        $stmt = $conn->prepare("DELETE FROM cart_details WHERE cart_id = :cart_id");
        $stmt->bindParam(':cart_id', $cart_id, PDO::PARAM_INT);
        $stmt->execute();

        $conn->commit();

        echo '<script>alert("Mua hàng thành công!"); window.location.href = "index.php";</script>';
        exit();
    } catch (Exception $e) {
        $conn->rollBack();
        echo "Failed: " . $e->getMessage();
    }
}
?>


<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Male_Fashion Template">
    <meta name="keywords" content="Male_Fashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Male-Fashion | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
        rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <style>
        .thumbnail-img {
            width: 50px;
            height: 50px;
            object-fit: cover;
        }
    </style>
</head>

<body>

    <!-- Offcanvas Menu Begin -->
    <div class="offcanvas-menu-overlay"></div>
    <div class="offcanvas-menu-wrapper">
        <div class="offcanvas__option">
            <div class="offcanvas__links">
                <?php if (isset($_SESSION['user_id']) && !empty($_SESSION['user_id'])): ?>
                    <p>Hello, <?= htmlspecialchars($_SESSION['user_id']) ?>!</p>
                <?php else: ?>
                    <a href="login.php">Sign in</a>
                <?php endif; ?>
                <a href="#">FAQs</a>
            </div>
            <div class="offcanvas__top__hover">
                <span>Usd <i class="arrow_carrot-down"></i></span>
                <ul>
                    <li>USD</li>
                    <li>EUR</li>
                    <li>USD</li>
                </ul>
            </div>
        </div>
        <div class="offcanvas__nav__option">
            <a href="#" class="search-switch"><img src="img/icon/search.png" alt=""></a>
            <a href="#"><img src="img/icon/heart.png" alt=""></a>
            <a href="#"><img src="img/icon/cart.png" alt=""> <span>0</span></a>
            <div class="price">$0.00</div>
        </div>
        <div id="mobile-menu-wrap"></div>
        <div class="offcanvas__text">
            <p>Free shipping, 30-day return or refund guarantee.</p>
        </div>
    </div>
    <!-- Offcanvas Menu End -->

    <!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-7">
                        <div class="header__top__left">
                            <p>Free shipping, 30-day return or refund guarantee.</p>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-5">
                        <div class="header__top__right">
                            <div class="header__top__links">
                                <?php if (isset($_SESSION['user_id']) && !empty($_SESSION['user_id'])): ?>
                                    <p>Hello, <?= htmlspecialchars($_SESSION['user_id']) ?>!</p>
                                <?php else: ?>
                                    <a href="login.php">Sign in</a>
                                <?php endif; ?>
                                <a href="#">FAQs</a>
                            </div>
                            <div class="header__top__hover">
                                <span>Usd <i class="arrow_carrot-down"></i></span>
                                <ul>
                                    <li>USD</li>
                                    <li>EUR</li>
                                    <li>USD</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3">
                    <div class="header__logo">
                        <a href="./index.html"><img src="img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <nav class="header__menu mobile-menu">
                        <ul>
                            <li><a href="./index.php">Home</a></li>
                            <li><a href="./shop.php">Shop</a></li>
                            <li><a href="#">Pages</a>
                                <ul class="dropdown">
                                    <li><a href="./about.php">About Us</a></li>
                                    <li><a href="./shopping-cart.php">Shopping Cart</a></li>
                                    <li><a href="./checkout.php">Check Out</a></li>
                                </ul>
                            </li>
                            <li><a href="./contact.php">Contacts</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3 col-md-3">
                    <div class="header__nav__option">
                        <a href="#" class="search-switch"><img src="img/icon/search.png" alt=""></a>
                        <a href="#"><img src="img/icon/heart.png" alt=""></a>
                        <a href="#"><img src="img/icon/cart.png" alt=""> <span>0</span></a>
                        <div class="price">$0.00</div>
                    </div>
                </div>
            </div>
            <div class="canvas__open"><i class="fa fa-bars"></i></div>
        </div>
    </header>
    <!-- Header Section End -->

    <!-- Breadcrumb Section Begin -->
    <section class="shopping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="shopping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th>Product</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody id="cart-items">
                                <?php foreach ($cart_details as $item): ?>
                                    <tr data-product-id="<?= htmlspecialchars($item['product_id']) ?>">
                                        <td class="product__cart__item">
                                            <div class="product__cart__item__pic">
                                                <img src="<?php echo htmlspecialchars($item['thumbnail']); ?>" alt="Product Image" class="thumbnail-img">
                                            </div>
                                            <div class="product__cart__item__text">
                                                <h6><?= htmlspecialchars($item['product_name']) ?></h6>
                                                <h5><?= htmlspecialchars($item['price_of_one']) ?></h5>
                                            </div>
                                        </td>
                                        <td class="quantity__item">
                                            <div class="quantity">
                                                <div class="pro-qty-2">
                                                    <input type="number" class="quantity-input" data-product-id="<?= htmlspecialchars($item['product_id']) ?>" value="<?= htmlspecialchars($item['quantity']) ?>">
                                                </div>
                                            </div>
                                        </td>
                                        <td class="cart__price">VND<span class="total-price"><?= htmlspecialchars($item['total_price']) ?></span></td>
                                        <td class="cart__close">
                                            <a href="delete_product_cart.php?id=<?= htmlspecialchars($item['product_id']) ?>" class="remove-item"><i class="fa fa-close"></i></a>
                                        </td>
                                    </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="continue__btn">
                                <a href="shop.php">Continue Shopping</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="cart__total">
                        <h6>Cart total</h6>
                        <ul>
                            <li>Total <span id="invoice-total">VND <?= htmlspecialchars($total_cost) ?></span></li>
                        </ul>
                        <form method="post">
                            <button type="submit" class="primary-btn">Checkout</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <script>
        $(document).ready(function() {
            $('.quantity-input').on('change', function() {
                var quantity = $(this).val();
                var product_id = $(this).data('product-id');
                var row = $(this).closest('tr');
                var price_of_one = parseFloat(row.find('h5').text().replace('VND', '').trim());

                $.ajax({
                    url: 'update_quantity.php',
                    type: 'POST',
                    data: {
                        product_id: product_id,
                        quantity: quantity,
                        price_of_one: price_of_one
                    },
                    success: function(response) {
                        var data = JSON.parse(response);
                        if (data.success) {
                            row.find('.total-price').text(data.total_price);
                            $('#invoice-total').text( data.total_cost);
                        } else {
                            alert('Failed to update quantity: ' + data.error);
                        }
                    }
                });
            });
        });
    </script>

    <!-- Shopping Cart Section End -->

    <!-- Footer Section Begin -->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer__about">
                        <div class="footer__logo">
                            <a href="#"><img src="img/footer-logo.png" alt=""></a>
                        </div>
                        <p>The customer is at the heart of our unique business model, which includes design.</p>
                        <a href="#"><img src="img/payment.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-2 offset-lg-1 col-md-3 col-sm-6">
                    <div class="footer__widget">
                        <h6>Shopping</h6>
                        <ul>
                            <li><a href="#">Clothing Store</a></li>
                            <li><a href="#">Trending Shoes</a></li>
                            <li><a href="#">Accessories</a></li>
                            <li><a href="#">Sale</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-2 col-md-3 col-sm-6">
                    <div class="footer__widget">
                        <h6>Shopping</h6>
                        <ul>
                            <li><a href="#">Contact Us</a></li>
                            <li><a href="#">Payment Methods</a></li>
                            <li><a href="#">Delivary</a></li>
                            <li><a href="#">Return & Exchanges</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 offset-lg-1 col-md-6 col-sm-6">
                    <div class="footer__widget">
                        <h6>NewLetter</h6>
                        <div class="footer__newslatter">
                            <p>Be the first to know about new arrivals, look books, sales & promos!</p>
                            <form action="#">
                                <input type="text" placeholder="Your email">
                                <button type="submit"><span class="icon_mail_alt"></span></button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="footer__copyright__text">
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        <p>Copyright ©
                            <script>
                                document.write(new Date().getFullYear());
                            </script>2020
                            All rights reserved | This template is made with <i class="fa fa-heart-o"
                                aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                        </p>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->

    <!-- Search Begin -->
    <div class="search-model">
        <div class="h-100 d-flex align-items-center justify-content-center">
            <div class="search-close-switch">+</div>
            <form class="search-model-form">
                <input type="text" id="search-input" placeholder="Search here.....">
            </form>
        </div>
    </div>
    <!-- Search End -->

    <!-- Js Plugins -->
    <script src="js/main.js"></script>
</body>

</html>