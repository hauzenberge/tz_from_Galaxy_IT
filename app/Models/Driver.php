<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use App\Models\Role;

use Brackets\AdminAuth\Models\AdminUser;

class Driver extends Model
{
    protected $fillable = [
        'admin_user_id',
        'birthday',

    ];


    protected $dates = [
        'birthday',
        'created_at',
        'updated_at',

    ];

    protected $appends = ['resource_url'];

    /* ************************ ACCESSOR ************************* */

    public function getResourceUrlAttribute()
    {
        return url('/admin/drivers/' . $this->getKey());
    }

    /* ************************ RELATIONS ************************* */
    public function adminUser()
    {
        return $this->belongsTo(AdminUser::class, 'admin_user_id');
    }

    public static function getByUserDrivers()
    {
        $role_id = Role::where('name', 'Driver')->first()->id;

        $adminUsers = AdminUser::all()
            ->load('roles')
            ->filter(function($item) use ($role_id){
                $role = $item->roles[0];
                if ($role->id == $role_id) {
                    return $item;
                }
            })
            ->map(function($item){
               // dd($item);

                return [
                    'id' => $item->id,
                    'name' => $item->first_name . ' ' . $item->last_name
                ];
            })
            ->values();

        return $adminUsers;
    }

    public static function richList()
    {
        return Driver::all()
        ->map(function($item){
            return [
                'id' => $item->id,
                'name' => $item->adminUser->full_name
            ];
        }); 
    } 
}
