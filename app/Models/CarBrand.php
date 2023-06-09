<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CarBrand extends Model
{
    protected $fillable = [
        'name',    
    ];
    
    
    protected $dates = [
        'created_at',
        'updated_at',
    
    ];
    
    protected $appends = ['resource_url'];

    /* ************************ ACCESSOR ************************* */

    public function getResourceUrlAttribute()
    {
        return url('/admin/car-brands/'.$this->getKey());
    }

    public static function richList()
    {
        return CarBrand::all()
        ->map(function($item){
            return [
                'id' => $item->id,
                'name' => $item->name
            ];
        }); 
    } 
}
