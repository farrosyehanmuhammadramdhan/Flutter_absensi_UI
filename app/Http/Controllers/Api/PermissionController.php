<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Permission;
use Illuminate\Http\Request;

class PermissionController extends Controller
{
    public function store(Request $request){
        $request->validate([
            'reason' => 'required',
        ]);

        $permission = new Permission;
        $permission->user_id = $request->user()->id;
        $permission->date_permission = now()->format('Y-m-d');
        $permission->reason = $request->reason;
        $permission->is_approved = false;
        if ($request->hasFile('image')) {
            $fileName = time() . '.' . $request->image->extension();
            $request->image->storeAs('permissions', $fileName, 'public');
            $permission->image = $fileName;
        }
        
        $permission->save();

        return response()->json([
            'message' => 'Permission created successfully',
            'data' => $permission
        ], 201);
    }
}
