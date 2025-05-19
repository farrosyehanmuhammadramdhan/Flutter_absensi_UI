<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function index(Request $request) {
        $users = User::query()
        ->when($request->input('name'), function ($query, $name){
            $query->where('name', 'like', '%' . $name . '%');
        })
        ->orderBy('id', 'desc')
        ->paginate(10);
        return view('pages.users.index', compact('users'));
    }

    public function create(){
        return view('pages.users.create');
    }

    public function store(Request $request){

        $request->validate([
            'name' => 'required',
            'email' => 'required|email',
            'position' => 'required',
            'department' => 'required',
            'password' => 'required',
        ]);

        User::create([
            'name' => $request->name,
            'email' => $request->email,
            'position' => $request->position,
            'department' => $request->department,
            'password' => Hash::make($request->password),
        ]);

        return redirect()->route('user.index')->with('success', 'User created successfully');
    }

    public function edit(User $user){
        return view('pages.users.edit', compact('user'));
    }

    public function update(Request $request, User $user){
        $data = $request->except('password');

        if($request->password){
            $data['password'] = Hash::make($request->password);
        }

        $user->update($data);

        return redirect()->route('user.index')->with('success', 'User updated successfully');
    }

    public function destroy(User $user){
        $user->delete();
        return redirect()->route('user.index')->with('success', 'User Deleted successfully');
    }
}
