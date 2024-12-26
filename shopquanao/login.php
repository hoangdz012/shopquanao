<?php
include 'connect.php';
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];
    $password = $_POST['password'];

    try {
        $sql = "SELECT * FROM users WHERE email = :email";
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':email', $email);
        $stmt->execute();
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if (($password === $user['password'])) {
            $_SESSION['user_id'] = $user['id'];
            $_SESSION['email'] = $user['email'];

            $userId = $user['id'];
            $cartSql = "SELECT * FROM cart WHERE user_id = :user_id";
            $cartStmt = $conn->prepare($cartSql);
            $cartStmt->bindParam(':user_id', $userId);
            $cartStmt->execute();
            $cart = $cartStmt->fetch(PDO::FETCH_ASSOC);

            if ($cart) {
                $_SESSION['cart_id'] = $cart['id'];
            } else {
                $insertCartSql = "INSERT INTO cart (created_date_time, created_by, status, total_cost, user_id) 
                                  VALUES (NOW(), :created_by, 'active', 0.00, :user_id)";
                $insertCartStmt = $conn->prepare($insertCartSql);
                $insertCartStmt->bindParam(':created_by', $userId);
                $insertCartStmt->bindParam(':user_id', $userId);
                $insertCartStmt->execute();
                
                $newCartId = $conn->lastInsertId();
                $_SESSION['cart_id'] = $newCartId;
            }

            echo "Login successful!";
            header("Location: index.php");
        } else {
            echo "Invalid email or password.";
        }
    } catch(PDOException $e) {
        echo "Error: " . $e->getMessage();
    }
}
?>



<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        html,
        body {
            height: 100%;
            margin: 0;
        }

        body {
            display: flex;
            flex-direction: column;
        }

        main {
            flex: 1;
        }

        footer {
            background-color: #343a40;
            color: #ffffff;
            text-align: center;
            padding: 15px;
            position: relative;
        }
    </style>
</head>

<body>
    <header class="bg-primary text-white text-center py-3">
        <div class="container">
            <h1 class="display-4">Login</h1>
            <link rel="icon" href="cat.jpg" type="image/gif" sizes="16x16">
        </div>
    </header>

    <main class="container my-4">
        <div class="container mt-5">
            <h2 class="mb-4">Login</h2>
            <?php if (isset($login_error)) { ?>
                <div class="alert alert-danger"><?php echo htmlspecialchars($login_error); ?></div>
            <?php } ?>
            <form method="post">
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="text" class="form-control" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                <button type="submit" class="btn btn-primary">Login</button>
                <a href="register.php" class="btn btn-secondary">Register</a>
            </form>
        </div>
    </main>

    <footer class="bg-dark text-white text-center py-3">
        <div class="container">
            <p>Made by Me</p>
        </div>
    </footer>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
