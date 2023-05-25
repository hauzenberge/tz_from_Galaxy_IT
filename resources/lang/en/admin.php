<?php

return [
    'admin-user' => [
        'title' => 'Users',

        'actions' => [
            'index' => 'Users',
            'create' => 'New User',
            'edit' => 'Edit :name',
            'edit_profile' => 'Edit Profile',
            'edit_password' => 'Edit Password',
        ],

        'columns' => [
            'id' => 'ID',
            'last_login_at' => 'Last login',
            'first_name' => 'First name',
            'last_name' => 'Last name',
            'email' => 'Email',
            'password' => 'Password',
            'password_repeat' => 'Password Confirmation',
            'activated' => 'Activated',
            'forbidden' => 'Forbidden',
            'language' => 'Language',
                
            //Belongs to many relations
            'roles' => 'Roles',
                
        ],
    ],

    'role' => [
        'title' => 'Roles',

        'actions' => [
            'index' => 'Roles',
            'create' => 'New Role',
            'edit' => 'Edit :name',
        ],

        'columns' => [
            'id' => 'ID',
            'name' => 'Name',
            'guard_name' => 'Guard name',
            
        ],
    ],

    'car-brand' => [
        'title' => 'Car Brands',

        'actions' => [
            'index' => 'Car Brands',
            'create' => 'New Car Brand',
            'edit' => 'Edit :name',
        ],

        'columns' => [
            'id' => 'ID',
            'name' => 'Name',
            
        ],
    ],

    'driver' => [
        'title' => 'Drivers',

        'actions' => [
            'index' => 'Drivers',
            'create' => 'New Driver',
            'edit' => 'Edit :name',
        ],

        'columns' => [
            'id' => 'ID',
            'admin_user_id' => 'Admin user',
            'birthday' => 'Birthday',
            
        ],
    ],

    'bus' => [
        'title' => 'Buses',

        'actions' => [
            'index' => 'Buses',
            'create' => 'New Bus',
            'edit' => 'Edit :name',
        ],

        'columns' => [
            'id' => 'ID',
            'bus_id' => 'Bus',
            'driver_id' => 'Driver',
            
        ],
    ],

    'bus' => [
        'title' => 'Buses',

        'actions' => [
            'index' => 'Buses',
            'create' => 'New Bus',
            'edit' => 'Edit :name',
        ],

        'columns' => [
            'id' => 'ID',
            'license_plate' => 'License plate',
            'bus_id' => 'Bus',
            'driver_id' => 'Driver',
            
        ],
    ],

    'bus' => [
        'title' => 'Buses',

        'actions' => [
            'index' => 'Buses',
            'create' => 'New Bus',
            'edit' => 'Edit :name',
        ],

        'columns' => [
            'id' => 'ID',
            'license_plate' => 'License plate',
            'brand_id' => 'Brand',
            'driver_id' => 'Driver',
            
        ],
    ],

    // Do not delete me :) I'm used for auto-generation
];