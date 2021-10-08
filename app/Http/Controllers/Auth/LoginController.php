<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Providers\RouteServiceProvider;
//use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

   // use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::HOME;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

    public function index(){
        if(!Auth::check() || 1 != Auth::user()->admin){
            //return view('auth.login');
            return redirect('/login');
        }else{
            return redirect('show.Home');
        }
    }

    public function login(Request $request){

        if(!filter_var($request->email,FILTER_VALIDATE_EMAIL)){
            $login['success'] = false;
            $login['message'] = "O Email Informado não é Valido";
            echo json_encode($login);
            return;
        }

        $credentials =[
            'email' => $request->email,
            'password' => $request->password
        ];

        $verificaSeExcluido = User::where('email',$request->email)->where('status',0)->get();

        if(!$verificaSeExcluido->isEmpty()){
            $login['success'] = false;
            $login['message'] = "O Usuário invalido";
            echo json_encode($login);
            return;
        }

        if(Auth::attempt($credentials)){
            $login['success'] = true;
            echo json_encode($login);
            return;
        }

        $login['success'] = false;
        $login['message'] = "Os dados Informados não conferem";
        echo json_encode($login);
        return;
    }
}
