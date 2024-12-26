<?php
include 'connect.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];
    $password = $_POST['password'];
    $retype_password = $_POST['retype_password'];
    $phone = $_POST['phone'];
    $created_date_time = date("Y-m-d H:i:s");

    if ($password !== $retype_password) {
        echo "Passwords do not match!";
    } else {
        try {
            $sql = "INSERT INTO users (email, password, phone_number, created_date_time) 
                    VALUES (:email, :password, :phone, :created_date_time)";
            $stmt = $conn->prepare($sql);
            $stmt->bindParam(':email', $email);
            $stmt->bindParam(':password', $password);
            $stmt->bindParam(':phone', $phone);
            $stmt->bindParam(':created_date_time', $created_date_time);
            $stmt->execute();
            
            $user_id = $conn->lastInsertId();

            $insertCartSql = "INSERT INTO cart (created_date_time, created_by, status, total_cost, user_id) 
                              VALUES (:created_date_time, :created_by, 'active', 0.00, :user_id)";
            $insertCartStmt = $conn->prepare($insertCartSql);
            $insertCartStmt->bindParam(':created_date_time', $created_date_time);
            $insertCartStmt->bindParam(':created_by', $user_id);
            $insertCartStmt->bindParam(':user_id', $user_id);
            $insertCartStmt->execute();
            
            header("Location: login.php");

        } catch (PDOException $e) {
            echo "Error: " . $e->getMessage();
        }
    }
}
?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
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
            <h1 class="display-4">Register</h1>
            <link rel="icon" href="cat.jpg" type="image/gif" sizes="16x16">
        </div>
    </header>

    <main class="container my-4">
        <div class="container mt-5">
            <h2 class="mb-4">Register</h2>
            <?php if (isset($registration_error)) { ?>
                <div class="alert alert-danger"><?php echo htmlspecialchars($registration_error); ?></div>
            <?php } ?>
            <?php if (isset($success_message)) { ?>
                <div class="alert alert-success"><?php echo htmlspecialchars($success_message); ?></div>
            <?php } ?>
            <form method="post">
                
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                <div class="form-group">
                    <label for="password">Retype Password:</label>
                    <input type="password" class="form-control" id="retype_password" name="retype_password" required>
                </div>
                <div class="form-group">
                    <label for="phone">Phone:</label>
                    <input type="text" class="form-control" id="phone" name="phone" required>
                </div>
                <button type="submit" class="btn btn-primary">Register</button>
                <a href="login.php" class="btn btn-secondary">Already have an account? Login</a>
            </form>
        </div>
    </main>

    <footer class="bg-dark text-white text-center py-3">
        <div class="container">
            <p>Made by Nam</p>
        </div>
    </footer>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
