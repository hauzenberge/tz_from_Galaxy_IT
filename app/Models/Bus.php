<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use App\Models\Driver;
use App\Models\CarBrand;

class Bus extends Model
{
    protected $fillable = [
        'license_plate',
        'brand_id',
        'driver_id'
    
    ];
    
    
    protected $dates = [
        'created_at',
        'updated_at',
    
    ];
    
    protected $appends = ['resource_url'];

    /* ************************ ACCESSOR ************************* */

    public function getResourceUrlAttribute()
    {
        return url('/admin/buses/'.$this->getKey());
    }

    public function getLicensePlateAttribute($value)
    {
        return mb_strtoupper($value);
    }

    /* ************************ RELATION ************************* */
    public function brand()
    {
        return $this->belongsTo(CarBrand::class, 'brand_id');
    }

    public function driver()
    {
        return $this->belongsTo(Driver::class, 'driver_id')->with('adminUser');
    }
}
