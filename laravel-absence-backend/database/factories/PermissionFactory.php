<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Database\Eloquent\Factories\HasFactory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Permission>
 */
class PermissionFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {

        return [
            'user_id' => fake()->numberBetween(1, 10),
            'date_permission' => fake()->date(),
            'reason' => fake()->sentence(),
            'image' => null,
            'is_approved' => fake()->boolean(false),
        ];
    }
}
