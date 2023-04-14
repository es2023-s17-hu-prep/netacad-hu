<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\Models\DashboardElement;
use App\Models\MenuItem;
use App\Models\Post;
use App\Models\SliderElement;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $main = MenuItem::forceCreate([
            "title" => "Cisco Hálózati Akadémia",
            "link" => ""
        ]);
        $main->subMenuItems()->create([
            "title" => "Bemutatkozik a Cisco Hálózati Akadémia",
            "link" => "/netacad/bemutatkozas"
        ]);

        SliderElement::factory(5)->create();
        Post::factory(30)->create();
        DashboardElement::factory(4)->create();
    }
}
