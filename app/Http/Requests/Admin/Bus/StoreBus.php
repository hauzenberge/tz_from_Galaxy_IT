<?php

namespace App\Http\Requests\Admin\Bus;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Gate;
use Illuminate\Validation\Rule;

class StoreBus extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize(): bool
    {
        return Gate::allows('admin.bus.create');
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules(): array
    {
        return [
            'license_plate' => ['required', Rule::unique('buses', 'license_plate'), 'string'],
        //    'brand_id' => ['nullable', 'string'],
        //    'driver_id' => ['nullable', 'string'],

            'brand' => ['required', 'array'],
            'driver' => ['nullable', 'array']
            
        ];
    }

    /**
    * Modify input data
    *
    * @return array
    */
    public function getSanitized(): array
    {
        $sanitized = $this->validated();

        //Add your code for manipulation with request data here

       // dd($sanitized);

        if (array_key_exists("brand", $sanitized)) {
            if (array_key_exists("id", $sanitized["brand"])) {
                $sanitized['brand_id'] = $sanitized["brand"]["id"];
            }else  $sanitized['brand_id'] = $sanitized["brand"][0]["id"];
        }

        if (array_key_exists("driver", $sanitized)) {
            if (array_key_exists("id", $sanitized["driver"])) {
                $sanitized['driver_id'] = $sanitized["driver"]["id"];
            }else  $sanitized['driver_id'] = $sanitized["driver"][0]["id"];
        }

        return $sanitized;
    }
}
