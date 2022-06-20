<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ShoppingCartResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'nombre' => $this->nombre,
            'familia' => $this->familia,
            'imagen' => $this->imagen,
            'cantidad' => $this->cantidad,
            'precio' => $this->precio,
            'created_at'=> $this->created_at,
            'updated_at'=> $this->updated_at
        ];
    }
}
