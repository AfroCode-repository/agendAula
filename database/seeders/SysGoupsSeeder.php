<?php

namespace Database\Seeders;

use App\Models\SysGroup;
use Illuminate\Database\Seeder;

class SysGoupsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        SysGroup::create([
            'id' => 1,
            'name' => 'Admin',
        ]);

        SysGroup::create([
            'id' => 2,
            'name' => 'employee',
        ]);
    }
}
