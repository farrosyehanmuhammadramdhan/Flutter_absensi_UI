<?php

namespace App\Http\Controllers;

use App\Models\Attendance;

class AttendanceController extends Controller
{
    public function index(){
        $attendances = Attendance::with('user')->orderBy('id', 'desc')->paginate(10);
        return view('pages.attendances.index', compact('attendances'));
    }
}
