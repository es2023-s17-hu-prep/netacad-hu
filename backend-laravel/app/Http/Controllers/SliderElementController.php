<?php

namespace App\Http\Controllers;

use App\Models\SliderElement;
use Illuminate\Http\Request;

class SliderElementController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return SliderElement::all();
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(SliderElement $sliderElement)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(SliderElement $sliderElement)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, SliderElement $sliderElement)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(SliderElement $sliderElement)
    {
        //
    }
}
