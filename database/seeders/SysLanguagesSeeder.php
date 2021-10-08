<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\SysLanguage;

class SysLanguagesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        SysLanguage::create([
            'id' => 1,
            'cod' => 'us',
            'country' => 'United States',
            'img' => 'images/flags/us.jpg',
        ]);

        SysLanguage::create([
            'id' => 2,
            'cod' => 'br',
            'country' => 'Brasil',
            'img' => 'images/flags/br.jpg',
        ]);

        SysLanguage::create([
            'id' => 3,
            'cod' => 'es',
            'country' => 'Brasil',
            'img' => 'images/flags/es.jpg',
        ]);
    }
}
