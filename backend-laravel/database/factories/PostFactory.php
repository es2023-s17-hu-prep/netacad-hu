<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;
use function Symfony\Component\Translation\t;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\User>
 */
class PostFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'type' => $this->faker->randomElement(["news", "page"]),
            'title' => $this->faker->text(40),
            'slug' => $this->faker->slug(),
            'subtitle' => $this->faker->text(40),
            'name' => $this->faker->name,
            'content' => $this->faker->text(),
            'featured_image' => $this->faker->imageUrl(),
            'headline_is_not_displaying' => $this->faker->boolean(30),
            'headline_long' => $this->faker->paragraph,
            'headline_short' => $this->faker->paragraph,
        ];
    }
}
