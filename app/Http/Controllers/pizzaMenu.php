<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\pizza;
use App\toppings;

class pizzaMenu extends Controller
{
    public function index() {
        return view("index");
    }

    public function pizzaData() {
        $index = 0;
        $PizzaData = [];

        foreach (pizza::all() as $getItem) {
            $PizzaData[$index]["pizza_name"] = $getItem->pizza_name;
            $PizzaData[$index]["pizza_price"] = $getItem->pizza_price;
            $PizzaData[$index]["toppings"] = toppings::where('pizza_id', '=', $getItem->id)->get();
            $index++;
        }

        echo json_encode($PizzaData);
    }
}
