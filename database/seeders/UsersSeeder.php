<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;

class UsersSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        User::create([
            'id' => 1,
            'id_group' => 1,
            'id_language' => 2,
            'name' => 'Pedro Ivo Santos Silva',
            'email' => 'pedroivosst@gmail.com',
            'password' => '$2y$10$zsmQ2xIga9WttyYqpavb/ezUqjsQ1RcigJPerIvjnqeMtEnSl7Tky',
            'status'=> 1,
        ]);
    }
}
