<?php

namespace App\Http\Requests\Admin\Driver;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Gate;
use Illuminate\Validation\Rule;

class UpdateDriver extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize(): bool
    {
        return Gate::allows('admin.driver.edit', $this->driver);
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules(): array
    {
        return [
            'admin_user_id' => ['nullable', 'integer'],
            'birthday' => ['sometimes', 'date', 'before_or_equal:-18 years', 'after_or_equal:-65 years'],
            
            'adminUser' => ['required', 'array']
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

        if (array_key_exists("adminUser", $sanitized)) {
            if (array_key_exists("id", $sanitized["adminUser"])) {
                $sanitized['admin_user_id'] = $sanitized["adminUser"]["id"];
            }else  $sanitized['admin_user_id'] = $sanitized["adminUser"][0]["id"];
        }

        return $sanitized;
    }
}
