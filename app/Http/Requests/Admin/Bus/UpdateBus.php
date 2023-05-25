<?php

namespace App\Http\Requests\Admin\Bus;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Gate;
use Illuminate\Validation\Rule;

class UpdateBus extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize(): bool
    {
        return Gate::allows('admin.bus.edit', $this->bu);
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules(): array
    {
        return [
            'license_plate' => ['sometimes', Rule::unique('buses', 'license_plate')->ignore($this->bu->getKey(), $this->bu->getKeyName()), 'string'],
          //  'brand_id' => ['sometimes', 'string'],
           // 'driver_id' => ['nullable', 'string'],
            
           'brand' => ['sometimes', 'array'],
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

        if (array_key_exists("brand", $sanitized)) {
            if (array_key_exists("id", $sanitized["brand"])) {
                $sanitized['brand_id'] = $sanitized["brand"]["id"];
            }else  $sanitized['brand_id'] = $sanitized["brand"][0]["id"];
        }

        if (array_key_exists("driver", $sanitized)) {
           // dd($sanitized["driver"]);
            if (array_key_exists("id", $sanitized["driver"])) {
                $sanitized['driver_id'] = $sanitized["driver"]["id"];
            }elseif(array_key_exists(0, $sanitized["driver"])) {
                $sanitized['driver_id'] = $sanitized["driver"][0]["id"];
            }else $sanitized['driver_id'] = null;
        }else $sanitized['driver_id'] = null;

        return $sanitized;
    }
}
