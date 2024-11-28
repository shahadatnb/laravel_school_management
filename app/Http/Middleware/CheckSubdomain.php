<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use App\Models\Branch;

class CheckSubdomain
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        $subdomain = $request->route('branch');
        $branch = Branch::where('subdomain', $subdomain)->firstOrFail();
        if(!$branch) abort(404);
        // Share user data globally
        \View::share('branch', $branch);
        $request->merge(['branch' => $branch]);
        return $next($request);
    }
}
