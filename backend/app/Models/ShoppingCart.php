<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ShoppingCart extends Model
{
    use HasFactory;
    protected $fillable = [
        'nombre','familia','imagen','cantidad','precio'
    ];
    protected $table = 'shoppingcart';
}
