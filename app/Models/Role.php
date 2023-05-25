<?php

namespace App\Models;

use Brackets\AdminAuth\Models\AdminUser;
use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    protected $fillable = [
        'name',
        'guard_name',

    ];


    protected $dates = [
        'created_at',
        'updated_at',

    ];

    protected $appends = ['resource_url'];

    /* ************************ ACCESSOR ************************* */

    public function getResourceUrlAttribute()
    {
        return url('/admin/roles/' . $this->getKey());
    }

    public function permissions()
    {
        return $this->hasMany(RoleHasPermission::class);
    }
    
    public function permissionDetails()
    {
        return $this->hasMany(RoleHasPermission::class)->with('permission');
    }

}
