<?php
// Database credentials
$servername = "localhost";
$username   = "root";
$password   = "";
$dbname     = "eventsdb";
$port       = 3306;

// Enable MySQLi error reporting (for development)
mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname, $port);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Optional: set charset
$conn->set_charset("utf8mb4");
?>
