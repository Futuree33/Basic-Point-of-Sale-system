<?php

namespace App\Http\Controllers;

use App\Models\Payment;
use Illuminate\Http\Request;


class OrderController
{
    public function finishOrder(Request $request)
    {
        $order = (object) $request
            ->json()
            ->all();

        if (empty($order->order)) return response(status: 400);

        Payment::create([
            "order" => json_encode($order->order),
            "type" => $order->type,
            "price" => $order->amount
        ]);
    }
}