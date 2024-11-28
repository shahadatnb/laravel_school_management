<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="robots" content="noindex">
        <title>{{ config('app.name', 'Laravel') }}</title>
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <link rel="stylesheet" href="//stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        {{-- <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> --}}
        <!-- Styles -->
        <style>
            body {
                color: #000;
                overflow-x: hidden;
                height: 100%;
                background-color: #B0BEC5;
                background-repeat: no-repeat;
            }

            .card0 {
                box-shadow: 0px 4px 8px 0px #757575;
                border-radius: 0px;
            }

            .card2 {
                margin: 0px 40px;
            }

            .logo {
                width: 200px;
                height: 100px;
                margin-top: 20px;
                margin-left: 35px;
            }

            .image {
                width: 360px;
                height: 280px;
            }

            .border-line {
                border-right: 1px solid #EEEEEE;
            }

            .facebook {
                background-color: #3b5998;
                color: #fff;
                font-size: 18px;
                padding-top: 5px;
                border-radius: 50%;
                width: 35px;
                height: 35px;
                cursor: pointer;
            }

            .twitter {
                background-color: #1DA1F2;
                color: #fff;
                font-size: 18px;
                padding-top: 5px;
                border-radius: 50%;
                width: 35px;
                height: 35px;
                cursor: pointer;
            }

            .linkedin {
                background-color: #2867B2;
                color: #fff;
                font-size: 18px;
                padding-top: 5px;
                border-radius: 50%;
                width: 35px;
                height: 35px;
                cursor: pointer;
            }

            .line {
                height: 1px;
                width: 45%;
                background-color: #E0E0E0;
                margin-top: 10px;
            }

            .or {
                width: 10%;
                font-weight: bold;
            }

            .text-sm {
                font-size: 14px !important;
            }

            ::placeholder {
                color: #BDBDBD;
                opacity: 1;
                font-weight: 300
            }

            :-ms-input-placeholder {
                color: #BDBDBD;
                font-weight: 300
            }

            ::-ms-input-placeholder {
                color: #BDBDBD;
                font-weight: 300
            }

            input, textarea {
                padding: 10px 12px 10px 12px;
                border: 1px solid lightgrey;
                border-radius: 2px;
                margin-bottom: 5px;
                margin-top: 2px;
                width: 100%;
                box-sizing: border-box;
                color: #2C3E50;
                font-size: 14px;
                letter-spacing: 1px;
            }

            input:focus, textarea:focus {
                -moz-box-shadow: none !important;
                -webkit-box-shadow: none !important;
                box-shadow: none !important;
                border: 1px solid #304FFE;
                outline-width: 0;
            }

            button:focus {
                -moz-box-shadow: none !important;
                -webkit-box-shadow: none !important;
                box-shadow: none !important;
                outline-width: 0;
            }

            a {
                color: inherit;
                cursor: pointer;
            }

            .btn-blue {
                background-color: #1A237E;
                width: 150px;
                color: #fff;
                border-radius: 2px;
            }

            .btn-blue:hover {
                background-color: #000;
                cursor: pointer;
            }

            .bg-blue {
                color: #fff;
                background-color: #1A237E;
            }

            @media screen and (max-width: 991px) {
                .logo {
                    margin-left: 0px;
                }

                .image {
                    width: 300px;
                    height: 220px;
                }

                .border-line {
                    border-right: none;
                }

                .card2 {
                    border-top: 1px solid #EEEEEE !important;
                    margin: 0px 15px;
                }
            }
        </style>
    </head>
    <body class="">
        <div class="container-fluid px-1 px-md-5 px-lg-1 px-xl-5 py-5 mx-auto">
            <div class="card card0 border-0">
                <div class="row d-flex">
                    <div class="col-lg-6 my-auto">
                        <div class="card1 pb-5">
                            <div class="px-3 justify-content-center text-center mt-4 mb-5 border-line">
                                <img class="mx-auto img-fluid" src="{{asset('/upload/site_file/'.config('settings.siteLogo',''))}}" alt="{{ config('settings.siteTitle','') }}">
                                <h1>{{ config('settings.siteTitle','') }}</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="card2 card border-0 px-4 py-5">
                            <h1>{{ __('Login') }}</h1>
                            <form method="POST" action="{{ route('login') }}">
                                @csrf
                            {{-- <div class="row mb-4 px-3">
                                <h6 class="mb-0 mr-4 mt-2">Sign in with</h6>
                                <div class="facebook text-center mr-3"><div class="fa fa-facebook"></div></div>
                                <div class="twitter text-center mr-3"><div class="fa fa-twitter"></div></div>
                                <div class="linkedin text-center mr-3"><div class="fa fa-linkedin"></div></div>
                            </div>
                            <div class="row px-3 mb-4">
                                <div class="line"></div>
                                <small class="or text-center">Or</small>
                                <div class="line"></div>
                            </div> --}}
                            @if (session('message'))
                                <div class="alert alert-danger">{{ session('message') }}</div>
                            @endif
                            <div class="row px-3">
                                <label class="mb-1"><h6 class="mb-0 text-sm">{{ __('E-Mail Address') }}</h6></label>
                                <input id="email" type="text" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" placeholder="{{ __('E-Mail Address') }}" required autocomplete="email" autofocus>

                                @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            <div class="row px-3">
                                <label class="mb-1"><h6 class="mb-0 text-sm">{{ __('Password') }}</h6></label>
                                <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" placeholder="{{ __('Password') }}" name="password" required autocomplete="current-password">
                                @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            <div class="row px-3 mb-4">
                                <div class="custom-control custom-checkbox custom-control-inline">
                                    <input id="chk1" type="checkbox" name="chk" class="custom-control-input"> 
                                    <label for="chk1" class="custom-control-label text-sm">{{ __('Remember Me') }}</label>
                                </div>
                                @if (Route::has('password.request'))
                                    <a class="ml-auto mb-0 text-sm" href="{{ route('password.request') }}">
                                        {{ __('Forgot Your Password?') }}
                                    </a>
                                @endif
                            </div>
                            <div class="row mb-3 px-3">
                                <button type="submit" class="btn btn-blue text-center">
                                    {{ __('Login') }}
                                </button>
                            </div>
                            <div class="row mb-4 px-3">
                                {{-- <small class="font-weight-bold">Don't have an account? <a class="text-danger ">Register</a></small> --}}
                            </div>
                        </form>
                        </div>
                    </div>
                </div>
                {{-- <div class="bg-blue py-4">
                    <div class="row px-3">
                        <small class="ml-4 ml-sm-5 mb-2">Copyright &copy; 2019. All rights reserved.</small>
                        <div class="social-contact ml-4 ml-sm-auto">
                            <span class="fa fa-facebook mr-4 text-sm"></span>
                            <span class="fa fa-google-plus mr-4 text-sm"></span>
                            <span class="fa fa-linkedin mr-4 text-sm"></span>
                            <span class="fa fa-twitter mr-4 mr-sm-5 text-sm"></span>
                        </div>
                    </div>
                </div> --}}
            </div>
        </div>
{{--         
        <div class="relative flex items-top justify-center min-h-screen bg-gray-100 dark:bg-gray-900 sm:items-center sm:pt-0">
            @if (Route::has('login'))
                <div class="fixed top-0 right-0 px-6 py-4 sm:block">
                    @auth
                        <a href="{{ url('/home') }}" class="text-sm text-gray-700 underline">Home</a>
                    @else
                        <a href="{{ route('login') }}" class="text-sm text-gray-700 underline">Login</a>

                        @if (Route::has('register'))
                            <a href="{{ route('register') }}" class="ml-4 text-sm text-gray-700 underline">Register</a>
                        @endif
                    @endif
                </div>
            @endif

            <div class="max-w-6xl mx-auto sm:px-6 lg:px-8">
                <div class="flex justify-center pt-8 sm:justify-start sm:pt-0">
                    <h1>{{ config('settings.siteTitle','') }}</h1>
                </div>

                <div class="mt-8 bg-white dark:bg-gray-800 overflow-hidden shadow sm:rounded-lg">
                    <div class="grid grid-cols-1 md:grid-cols-2">

                    </div>
                </div>
            </div>
        </div> --}}
    </body>
</html>
