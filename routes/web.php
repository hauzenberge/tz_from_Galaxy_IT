<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});


/* Auto-generated admin routes */
Route::middleware(['auth:' . config('admin-auth.defaults.guard'), 'admin'])->group(static function () {
    Route::prefix('admin')->namespace('App\Http\Controllers\Admin')->name('admin/')->group(static function() {
        Route::prefix('admin-users')->name('admin-users/')->group(static function() {
            Route::get('/',                                             'AdminUsersController@index')->name('index');
            Route::get('/create',                                       'AdminUsersController@create')->name('create');
            Route::post('/',                                            'AdminUsersController@store')->name('store');
            Route::get('/{adminUser}/impersonal-login',                 'AdminUsersController@impersonalLogin')->name('impersonal-login');
            Route::get('/{adminUser}/edit',                             'AdminUsersController@edit')->name('edit');
            Route::post('/{adminUser}',                                 'AdminUsersController@update')->name('update');
            Route::delete('/{adminUser}',                               'AdminUsersController@destroy')->name('destroy');
            Route::get('/{adminUser}/resend-activation',                'AdminUsersController@resendActivationEmail')->name('resendActivationEmail');
        });
    });
});

/* Auto-generated admin routes */
Route::middleware(['auth:' . config('admin-auth.defaults.guard'), 'admin'])->group(static function () {
    Route::prefix('admin')->namespace('App\Http\Controllers\Admin')->name('admin/')->group(static function() {
        Route::get('/profile',                                      'ProfileController@editProfile')->name('edit-profile');
        Route::post('/profile',                                     'ProfileController@updateProfile')->name('update-profile');
        Route::get('/password',                                     'ProfileController@editPassword')->name('edit-password');
        Route::post('/password',                                    'ProfileController@updatePassword')->name('update-password');
    });
});

/* Auto-generated admin routes */
Route::middleware(['auth:' . config('admin-auth.defaults.guard'), 'admin'])->group(static function () {
    Route::prefix('admin')->namespace('App\Http\Controllers\Admin')->name('admin/')->group(static function() {
        Route::prefix('roles')->name('roles/')->group(static function() {
            Route::get('/',                                             'RolesController@index')->name('index');
            Route::get('/create',                                       'RolesController@create')->name('create');
            Route::post('/',                                            'RolesController@store')->name('store');
            Route::get('/{role}/edit',                                  'RolesController@edit')->name('edit');
            Route::post('/bulk-destroy',                                'RolesController@bulkDestroy')->name('bulk-destroy');
            Route::post('/{role}',                                      'RolesController@update')->name('update');
            Route::delete('/{role}',                                    'RolesController@destroy')->name('destroy');
        });
    });
});

/* Auto-generated admin routes */
Route::middleware(['auth:' . config('admin-auth.defaults.guard'), 'admin'])->group(static function () {
    Route::prefix('admin')->namespace('App\Http\Controllers\Admin')->name('admin/')->group(static function() {
        Route::prefix('car-brands')->name('car-brands/')->group(static function() {
            Route::get('/',                                             'CarBrandsController@index')->name('index');
            Route::get('/create',                                       'CarBrandsController@create')->name('create');
            Route::post('/',                                            'CarBrandsController@store')->name('store');
            Route::get('/{carBrand}/edit',                              'CarBrandsController@edit')->name('edit');
            Route::post('/bulk-destroy',                                'CarBrandsController@bulkDestroy')->name('bulk-destroy');
            Route::post('/{carBrand}',                                  'CarBrandsController@update')->name('update');
            Route::delete('/{carBrand}',                                'CarBrandsController@destroy')->name('destroy');
        });
    });
});

/* Auto-generated admin routes */
Route::middleware(['auth:' . config('admin-auth.defaults.guard'), 'admin'])->group(static function () {
    Route::prefix('admin')->namespace('App\Http\Controllers\Admin')->name('admin/')->group(static function() {
        Route::prefix('drivers')->name('drivers/')->group(static function() {
            Route::get('/',                                             'DriversController@index')->name('index');
            Route::get('/create',                                       'DriversController@create')->name('create');
            Route::post('/',                                            'DriversController@store')->name('store');
            Route::get('/{driver}/edit',                                'DriversController@edit')->name('edit');
            Route::post('/bulk-destroy',                                'DriversController@bulkDestroy')->name('bulk-destroy');
            Route::post('/{driver}',                                    'DriversController@update')->name('update');
            Route::delete('/{driver}',                                  'DriversController@destroy')->name('destroy');
        });
    });
});

/* Auto-generated admin routes */
Route::middleware(['auth:' . config('admin-auth.defaults.guard'), 'admin'])->group(static function () {
    Route::prefix('admin')->namespace('App\Http\Controllers\Admin')->name('admin/')->group(static function() {
        Route::prefix('buses')->name('buses/')->group(static function() {
            Route::get('/',                                             'BusesController@index')->name('index');
            Route::get('/create',                                       'BusesController@create')->name('create');
            Route::post('/',                                            'BusesController@store')->name('store');
            Route::get('/{bu}/edit',                                    'BusesController@edit')->name('edit');
            Route::post('/bulk-destroy',                                'BusesController@bulkDestroy')->name('bulk-destroy');
            Route::post('/{bu}',                                        'BusesController@update')->name('update');
            Route::delete('/{bu}',                                      'BusesController@destroy')->name('destroy');
        });
    });
});