<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\User;
use Illuminate\Support\Facades\Hash;


class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        User::factory(20)->create(); //dinamis

        User::factory()->create([ //statis
            'name' => 'Farrosyehan Muhammad Ramdhan',
            'email' => 'farrosyehanidnsolo@gmail.com',
            'position' => 'Mobile Developer',
            'department' => 'IT',
            'password' => Hash::make('12345678'),
        ]);
    }
}
