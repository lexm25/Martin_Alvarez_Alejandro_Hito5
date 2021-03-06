<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Article;

class ArticleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Article::all();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        return Article::create($request->all());
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return Article::find($id);
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
        if (Article::where('id',$id)->exists()) {
            $article = Article::find($id);
            $article->nombre = $request->nombre;
            $article->descripcion = $request->descripcion;
            $article->familia = $request->familia;
            $article->procedencia = $request->procedencia;
            $article->imagen = $request->imagen;
            $article->precio = $request->precio;
            $article->stock = $request->stock;
            $article->save();
            return response()->json([
                "message"=>"record updated succesfully"
            ],200);
        }else{
            return response()->json([
                "message"=>"Article not found"
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
        if (Article::where('id',$id)->exists()) {
            $article = Article::find($id);
            $article->delete();

            return response()->json([
                "message"=>"record deleted"
            ],202);
        }else{
            return response()->json([
                "message"=>"Article not found"
            ],404);
        }
    }
}
