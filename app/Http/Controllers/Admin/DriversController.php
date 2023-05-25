<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\Driver\BulkDestroyDriver;
use App\Http\Requests\Admin\Driver\DestroyDriver;
use App\Http\Requests\Admin\Driver\IndexDriver;
use App\Http\Requests\Admin\Driver\StoreDriver;
use App\Http\Requests\Admin\Driver\UpdateDriver;
use App\Models\Driver;
use Brackets\AdminListing\Facades\AdminListing;
use Exception;
use Illuminate\Auth\Access\AuthorizationException;
use Illuminate\Contracts\Routing\ResponseFactory;
use Illuminate\Contracts\View\Factory;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Response;
use Illuminate\Routing\Redirector;
use Illuminate\Support\Facades\DB;
use Illuminate\View\View;

class DriversController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @param IndexDriver $request
     * @return array|Factory|View
     */
    public function index(IndexDriver $request)
    {
        // create and AdminListing instance for a specific model and
        $data = AdminListing::create(Driver::class)->processRequestAndGet(
            // pass the request with params
            $request,

            // set columns to query
            ['id', 'admin_user_id', 'birthday'],

            // set columns to searchIn
            ['id'],

            function ($query) use ($request) {
                $query->with(['adminUser']);
    
            }
        );

        if ($request->ajax()) {
            if ($request->has('bulk')) {
                return [
                    'bulkItems' => $data->pluck('id')
                ];
            }
            return ['data' => $data];
        }

        return view('admin.driver.index', ['data' => $data]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @throws AuthorizationException
     * @return Factory|View
     */
    public function create()
    {
        $this->authorize('admin.driver.create');

        //dd(Driver::getByUserDrivers());

        return view(
            'admin.driver.create',
            [
                'users' => Driver::getByUserDrivers()
            ]
        );
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param StoreDriver $request
     * @return array|RedirectResponse|Redirector
     */
    public function store(StoreDriver $request)
    {
        // Sanitize input
        $sanitized = $request->getSanitized();

        // Store the Driver
        $driver = Driver::create($sanitized);

        if ($request->ajax()) {
            return ['redirect' => url('admin/drivers'), 'message' => trans('brackets/admin-ui::admin.operation.succeeded')];
        }

        return redirect('admin/drivers');
    }

    /**
     * Display the specified resource.
     *
     * @param Driver $driver
     * @throws AuthorizationException
     * @return void
     */
    public function show(Driver $driver)
    {
        $this->authorize('admin.driver.show', $driver);

        // TODO your code goes here
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param Driver $driver
     * @throws AuthorizationException
     * @return Factory|View
     */
    public function edit(Driver $driver)
    {
        $this->authorize('admin.driver.edit', $driver);

        $users = Driver::getByUserDrivers();
        $driver->adminUser = $users->where('id', $driver->admin_user_id);

        return view('admin.driver.edit', [
            'driver' => $driver,
            'users' => $users
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param UpdateDriver $request
     * @param Driver $driver
     * @return array|RedirectResponse|Redirector
     */
    public function update(UpdateDriver $request, Driver $driver)
    {
        // Sanitize input
        $sanitized = $request->getSanitized();

        // Update changed values Driver
        $driver->update($sanitized);

        if ($request->ajax()) {
            return [
                'redirect' => url('admin/drivers'),
                'message' => trans('brackets/admin-ui::admin.operation.succeeded'),
            ];
        }

        return redirect('admin/drivers');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param DestroyDriver $request
     * @param Driver $driver
     * @throws Exception
     * @return ResponseFactory|RedirectResponse|Response
     */
    public function destroy(DestroyDriver $request, Driver $driver)
    {
        $driver->delete();

        if ($request->ajax()) {
            return response(['message' => trans('brackets/admin-ui::admin.operation.succeeded')]);
        }

        return redirect()->back();
    }

    /**
     * Remove the specified resources from storage.
     *
     * @param BulkDestroyDriver $request
     * @throws Exception
     * @return Response|bool
     */
    public function bulkDestroy(BulkDestroyDriver $request): Response
    {
        DB::transaction(static function () use ($request) {
            collect($request->data['ids'])
                ->chunk(1000)
                ->each(static function ($bulkChunk) {
                    Driver::whereIn('id', $bulkChunk)->delete();

                    // TODO your code goes here
                });
        });

        return response(['message' => trans('brackets/admin-ui::admin.operation.succeeded')]);
    }
}
