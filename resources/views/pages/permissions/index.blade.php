@extends('layouts.app')

@section('title', 'Posts')

@push('style')
    <!-- CSS Libraries -->
    <link rel="stylesheet"
        href="{{ asset('library/selectric/public/selectric.css') }}">
@endpush

@section('main')
    <div class="main-content">
        <section class="section">
            <div class="section-header">
                <h1>Permissions</h1>
                <div class="section-header-button">
                    <a href="{{ route('user.create') }}"
                        class="btn btn-primary">Add New</a>
                </div>
                <div class="section-header-breadcrumb">
                    <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
                    <div class="breadcrumb-item"><a href="#">Permissionss</a></div>
                    <div class="breadcrumb-item">All Permissions</div>
                </div>
            </div>
            @include('layouts.alert')
            <div class="section-body">
                <h2 class="section-title">Permissions</h2>
                <p class="section-lead">
                    You can manage all Permissions, such as editing, deleting and more.
                </p>


                <div class="row mt-4">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4>All Permissions</h4>
                            </div>
                            <div class="card-body">
                                <div class="float-left">
                                    <select class="form-control selectric">
                                        <option>Action For Selected</option>
                                        <option>Move to Draft</option>
                                        <option>Move to Pending</option>
                                        <option>Delete Pemanently</option>
                                    </select>
                                </div>
                                <div class="float-right">
                                    <form>
                                        <div class="input-group">
                                            <input type="text"
                                            name="name"
                                                class="form-control"
                                                placeholder="Search">
                                            <div class="input-group-append">
                                                <button class="btn btn-primary"><i class="fas fa-search"></i></button>
                                            </div>
                                        </div>
                                    </form>
                                </div>

                                <div class="clearfix mb-3"></div>

                                <div class="table-responsive">
                                    <table class="table-striped table">
                                        <tr>
                                            <th>Name</th>
                                            <th>Date</th>
                                            <th>Position</th>
                                            <th>Department</th>
                                            <th>Time</th>
                                            <th>Status</th>
                                        </tr>
                                        @foreach ($permissions as $permission)
                                        <tr>
                                            <td>
                                                {{ $permission->user->name }}
                                                <div class="table-links">
                                                    <a href="{{ route('permission.show', $permission->id)}}">View</a>
                                                    <div class="bullet"></div>
                                               <!-- <a href="#"
                                                    onclick="event.preventDefault();
                                                    document.getElementById('delete-form-{{$permission->id}}').submit();"
                                                     class="text-danger">
                                                     Trash
                                                    </a>
                                                     <form action="{{route('user.destroy', $permission->id)}}"
                                                      id="delete-form-{{ $permission->id}}"
                                                      style="display: none;"
                                                      method="POST">
                                                      @csrf
                                                      @method('DELETE')
                                                     </form> -->
                                                </div>
                                            </td>
                                            <td>
                                                {{ $permission->date_permission }}
                                            </td>
                                            <td>
                                                {{ $permission->user->position }}
                                            </td>
                                            <td>
                                                {{ $permission->user->department }}
                                            </td>
                                            <td>
                                                {{ $permission->created_at->diffForHumans() }}
                                            </td>
                                            <td>
                                              @if ($permission->is_approved == 1)
                                               <p class="badge badge-success">Approved</p>
                                              @else
                                              <p class="badge badge-danger">Not Approved</p>
                                              @endif
                                            </td>

                                        </tr>
                                        @endforeach

                                    </table>
                                </div>
                                <div class="float-right">
                                    <nav>
                                        {{ $permissions->links() }}
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
@endsection

@push('scripts')
    <!-- JS Libraies -->
    <script src="{{ asset('library/selectric/public/jquery.selectric.min.js') }}"></script>

    <!-- Page Specific JS File -->
    <script src="{{ asset('js/page/features-posts.js') }}"></script>
@endpush