<?php

namespace App\Http\Controllers;

use App\Models\ShoppingCart;
use Illuminate\Http\Request;

class ShoppingCartController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return ShoppingCart::all();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        return ShoppingCart::create($request->all());
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return ShoppingCart::find($id);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        if (ShoppingCart::where('id',$id)->exists()) {
            $shoppingCart = ShoppingCart::find($id);
            $shoppingCart->nombre = $request->nombre;
            $shoppingCart->familia = $request->familia;
            $shoppingCart->imagen = $request->imagen;
            $shoppingCart->cantidad = $request->cantidad;
            $shoppingCart->precio = $request->precio;

            $shoppingCart->save();
            return response()->json([
                "message"=>"record updated succesfully"
            ],200);
        }else{
            return response()->json([
                "message"=>"ShoppingCart item not found"
            ],404);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        if (ShoppingCart::where('id',$id)->exists()) {
            $shoppingCart = ShoppingCart::find($id);
            $shoppingCart->delete();

            return response()->json([
                "message"=>"record deleted"
            ],202);
        }else{
            return response()->json([
                "message"=>"ShoppingCart item not found"
            ],404);
        }
    }

    public function destroyAll()
    {
        $shoppingCart = ShoppingCart::all();
            $shoppingCart->delete();
    }
}
