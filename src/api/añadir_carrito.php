<?php

session_start();

if (!isset($_SESSION['carrito'])) {
    $_SESSION['carrito'] = [];
}

if (isset($_SESSION['current_item'])) {
    $trueItem = json_decode($_SESSION['current_item']);

    $quantity = isset($_GET['quantity']) ? intval($_GET['quantity']) : 1;

    $trueItem->quantity = $quantity;
    $_SESSION['carrito'][] = $trueItem;

} else {
    echo json_encode(['error' => 'current_item is not set']);
}

?>