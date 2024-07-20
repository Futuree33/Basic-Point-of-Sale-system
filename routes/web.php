<?php

use App\Http\Controllers\OrderController;
use App\Models\Category;
use App\Models\Payment;
use App\Models\Product;
use Illuminate\Support\Facades\Route;

Route::get('/', fn() => inertia('Index', ["categories" => Category::all(), "products" => Product::all()]));
Route::get('/payments', function () {
    $payments = Payment::query()
        ->orderByDesc("id")
        ->get();

    $today = $payments->filter(function ($payment) {
        return \Carbon\Carbon::parse($payment->created_at)->isToday();
    })->values();

    return inertia('Payments', [
        "today" => $today,
        "earnedToday" => $today->sum("price"),
        "earned" => $payments->sum("price"),
        "payments" => $payments
    ]);
});

Route::group(["prefix" => "api"], function () {
    Route::post("/order/finish", [OrderController::class, "finishOrder"]);
});