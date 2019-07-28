@extends('layouts.app')

@section('content')
    <div class="container">
        @if(count($projects) > 0)
            <div class="row">
                @foreach($projects as $prj)
                    <div class="col-sm-12 col-md-12 col-lg-3 item">
                        <div class="image">
                            @if (isset($prj->subject()->get()[0]->path_image_front))
                                <img class="img-fluid" src="{{ asset($prj->subject()->get()[0]->path_image_front) }}">
                            @else
                                <img class="img-fluid" class="" src="https://dummyimage.com/350x350/bfb9bf/000000" alt="Card image cap">
                            @endif
                        </div>
                        <div>
                            <h5 class="card-title">{{$prj->name}}</h5>
                            <p class="card-text">Description: {{$prj->description}}</p>
                            <p class="card-text">Name: {{$prj->subject()->get()[0]->name}} {{$prj->subject()->get()[0]->surname}} Age: {{$prj->subject()->get()[0]->age}}</p>
                            <a href="projects/{{$prj->id}}/editor" class="btn btn-primary">Open</a>
                            <a href="projects/{{$prj->id}}/delete" class="btn btn-danger">Delete</a>
                        </div>
                    </div>
                @endforeach
            </div>
        @else
            <div class="jumbotron">
                <h1 class="display-4">Project list is empty! :)</h1>
                <hr class="my-4">
                <p>Create your firts project! It's simple!</p>
                <p class="lead">
                    <a class="btn btn-primary btn-lg" href="{{route('create')}}" role="button">Create project</a>
                </p>
            </div>
        @endif
    </div>
@endsection

@section('css')
    <link href="{{ asset('css/list_projects.css') }}" rel="stylesheet">
@endsection