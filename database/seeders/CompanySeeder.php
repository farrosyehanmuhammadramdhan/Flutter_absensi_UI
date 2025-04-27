<?php

namespace Database\Seeders;

use App\Models\Company;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class CompanySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Company::create([
            'name' => 'PT. Mandiri Jaya',
            'address' => 'Jl. Jend. Sudirman No.1, Jakarta Pusat',
            'email' => 'madiri@gmail.com',
            'latitude' => '-355.79925.0',
            'longitude' => '1006.8275.0',
            'radius_km' => '2',
            'time_in' => '08:00',
            'time_out' => '17:00',
        ]);
    }
}
