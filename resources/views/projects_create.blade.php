@extends('layouts.app')

@section('content')
<div class="container">

    <div class="jumbotron">
        <form action="store" method="post">
            <h1 class="display-6">Subject Information</h1>
            <p>Fill this field with info about subject</p>
            <hr class="my-4">
            <div class="row justify-content-center">
                @csrf
                <div class="col-5 col-md-5 pull-md-5 bd-content">
                        <div class="form-group row">
                            <label for="example-text-input" class="col-2 col-form-label">Name</label>
                            <div class="col-10">
                                <input required class="form-control" type="text" name="name" id="name">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="example-text-input" class="col-2 col-form-label">Surname</label>
                            <div class="col-10">
                                <input required class="form-control" type="text" name="surname" id="subject_surname">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="example-number-input" class="col-2 col-form-label">Age</label>
                            <div class="col-10">
                                <input required class="form-control" type="number" name="age" id="subject_age">
                            </div>
                        </div>
                </div>
            </div>

            <h1 class="display-6">Project Information</h1>
            <p>Fill this field with info about project you creating</p>
            <hr class="my-4">
            <div class="row justify-content-center">
                <div class="col-5 col-md-5 pull-md-5 bd-content">
                    <div class="form-group row">
                        <label for="example-text-input" class="col-2 col-form-label">Name</label>
                        <div class="col-10">
                            <input required class="form-control" type="text" name="project_name" id="project_name">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="example-text-input" class="col-2 col-form-label">Description</label>
                        <div class="col-10">
                            <input required class="form-control" type="text" name="project_description" id="project_description">
                        </div>
                    </div>
                </div>
            </div>

            <button type="submit" class="btn btn-success">Create Project</button>
        </form>
    </div>


</div>
@endsection
