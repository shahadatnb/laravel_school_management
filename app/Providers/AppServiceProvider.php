<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Facades\Validator;
use App\Http\Traits\PostTrait;
use DB;

class AppServiceProvider extends ServiceProvider
{
  use PostTrait;
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        Paginator::useBootstrap();
        //URL::forceScheme('https');

        Validator::extend('unique_with', function ($attribute, $value, $parameters, $validator) {
            $request = request()->all();
    
          // $table is always the first parameter
          // You can extend it to use dots in order to specify: connection.database.table
          $table = array_shift($parameters);
    
          // Add current column to the $clauses array
          $clauses = [
            $attribute => $value,
          ];
    
          // Add the rest  
          foreach ($parameters as $column) {
            if (isset($request[$column])) {
                $clauses[$column] = $request[$column];
            }
          }
    
          // Query for existence.
          return ! DB::table($table)
                    ->where($clauses)
                    ->exists();
        });
    
        /*
        Validator::extend('unique_with', function ($attribute, $value, $parameters, $validator) {
              $count = DB::table('users')->where('placementId', $value)->count();
              //return $count < 5;
              if($count < 5){
                return true;
              }
              
            });
        */
        \View::share('postType', $this->postType);

        
    }
}
