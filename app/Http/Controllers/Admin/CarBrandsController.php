<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\CarBrand\BulkDestroyCarBrand;
use App\Http\Requests\Admin\CarBrand\DestroyCarBrand;
use App\Http\Requests\Admin\CarBrand\IndexCarBrand;
use App\Http\Requests\Admin\CarBrand\StoreCarBrand;
use App\Http\Requests\Admin\CarBrand\UpdateCarBrand;
use App\Models\CarBrand;
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

class CarBrandsController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @param IndexCarBrand $request
     * @return array|Factory|View
     */
    public function index(IndexCarBrand $request)
    {
        // create and AdminListing instance for a specific model and
        $data = AdminListing::create(CarBrand::class)->processRequestAndGet(
            // pass the request with params
            $request,

            // set columns to query
            ['id', 'name'],

            // set columns to searchIn
            ['id', 'name']
        );

        if ($request->ajax()) {
            if ($request->has('bulk')) {
                return [
                    'bulkItems' => $data->pluck('id')
                ];
            }
            return ['data' => $data];
        }

        return view('admin.car-brand.index', ['data' => $data]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @throws AuthorizationException
     * @return Factory|View
     */
    public function create()
    {
        $this->authorize('admin.car-brand.create');

        return view('admin.car-brand.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param StoreCarBrand $request
     * @return array|RedirectResponse|Redirector
     */
    public function store(StoreCarBrand $request)
    {
        // Sanitize input
        $sanitized = $request->getSanitized();

        // Store the CarBrand
        $carBrand = CarBrand::create($sanitized);

        if ($request->ajax()) {
            return ['redirect' => url('admin/car-brands'), 'message' => trans('brackets/admin-ui::admin.operation.succeeded')];
        }

        return redirect('admin/car-brands');
    }

    /**
     * Display the specified resource.
     *
     * @param CarBrand $carBrand
     * @throws AuthorizationException
     * @return void
     */
    public function show(CarBrand $carBrand)
    {
        $this->authorize('admin.car-brand.show', $carBrand);

        // TODO your code goes here
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param CarBrand $carBrand
     * @throws AuthorizationException
     * @return Factory|View
     */
    public function edit(CarBrand $carBrand)
    {
        $this->authorize('admin.car-brand.edit', $carBrand);


        return view('admin.car-brand.edit', [
            'carBrand' => $carBrand,
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param UpdateCarBrand $request
     * @param CarBrand $carBrand
     * @return array|RedirectResponse|Redirector
     */
    public function update(UpdateCarBrand $request, CarBrand $carBrand)
    {
        // Sanitize input
        $sanitized = $request->getSanitized();

        // Update changed values CarBrand
        $carBrand->update($sanitized);

        if ($request->ajax()) {
            return [
                'redirect' => url('admin/car-brands'),
                'message' => trans('brackets/admin-ui::admin.operation.succeeded'),
            ];
        }

        return redirect('admin/car-brands');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param DestroyCarBrand $request
     * @param CarBrand $carBrand
     * @throws Exception
     * @return ResponseFactory|RedirectResponse|Response
     */
    public function destroy(DestroyCarBrand $request, CarBrand $carBrand)
    {
        $carBrand->delete();

        if ($request->ajax()) {
            return response(['message' => trans('brackets/admin-ui::admin.operation.succeeded')]);
        }

        return redirect()->back();
    }

    /**
     * Remove the specified resources from storage.
     *
     * @param BulkDestroyCarBrand $request
     * @throws Exception
     * @return Response|bool
     */
    public function bulkDestroy(BulkDestroyCarBrand $request) : Response
    {
        DB::transaction(static function () use ($request) {
            collect($request->data['ids'])
                ->chunk(1000)
                ->each(static function ($bulkChunk) {
                    CarBrand::whereIn('id', $bulkChunk)->delete();

                    // TODO your code goes here
                });
        });

        return response(['message' => trans('brackets/admin-ui::admin.operation.succeeded')]);
    }
}
