<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class pizza extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('pizza')->insert(['pizza_name' => "MacDac Pizza", 'pizza_price' => 8.70]);
        DB::table('pizza')->insert(['pizza_name' => "Lovely Mushroom Pizza", 'pizza_price' => 6.45]);
    }
}
